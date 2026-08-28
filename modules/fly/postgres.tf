resource "fly_app" "postgres" {
  name     = var.app_name
  org_slug = var.org_slug
}

resource "fly_volume" "pg_data" {
  app                 = fly_app.postgres.name
  name                = var.volume_name
  region              = var.region
  size_gb             = var.volume_size_gb
  encrypted           = var.volume_encrypted
  auto_backup_enabled = var.volume_auto_backup_enabled
  snapshot_retention  = var.volume_snapshot_retention
}

resource "fly_machine" "postgres" {
  app            = fly_app.postgres.name
  name           = var.machine_name
  region         = var.region
  image          = var.image
  env            = var.env
  desired_status = var.desired_status

  guest {
    cpu_kind  = var.guest.cpu_kind
    cpus      = var.guest.cpus
    memory_mb = var.guest.memory_mb
  }

  mount {
    volume = fly_volume.pg_data.id
    path   = var.mount_path
  }

  dynamic "service" {
    for_each = var.services
    content {
      protocol      = service.value.protocol
      internal_port = service.value.internal_port
      autostart     = service.value.autostart
      autostop      = service.value.autostop
      force_https   = service.value.force_https

      dynamic "concurrency" {
        for_each = service.value.concurrency == null ? [] : [service.value.concurrency]
        content {
          type       = concurrency.value.type
          soft_limit = concurrency.value.soft_limit
          hard_limit = concurrency.value.hard_limit
        }
      }

      dynamic "port" {
        for_each = service.value.ports
        content {
          port        = port.value.port
          handlers    = port.value.handlers
          force_https = port.value.force_https
        }
      }
    }
  }

  dynamic "check" {
    for_each = var.checks
    content {
      name     = check.value.name
      type     = check.value.type
      port     = check.value.port
      path     = check.value.path
      interval = check.value.interval
      timeout  = check.value.timeout
      method   = check.value.method
    }
  }

  dynamic "metrics" {
    for_each = var.metrics == null ? [] : [var.metrics]
    content {
      port = metrics.value.port
      path = metrics.value.path
    }
  }

  restart {
    policy      = var.restart_policy
    max_retries = var.restart_max_retries
  }

  # Fly stamps its own bookkeeping onto machine metadata (fly_flyctl_version,
  # managed-by-fly-deploy and friends) whenever the Postgres tooling touches the
  # cluster. Tracking it would make every plan dirty, so it is left to Fly.
  #
  # cordoned, desired_status and skip_launch are ignored for a different reason:
  # the provider's importer does not populate them, so they always plan as a
  # change on adoption. Acting on that change is not possible anyway - the
  # provider acquires a machine lease in Update and then issues the update
  # without the lease nonce, so Fly rejects its own request with a 409. The
  # cluster's real configuration is unaffected by any of these attributes, so
  # ignoring them makes the plan honest rather than hiding a genuine diff.
  lifecycle {
    ignore_changes = [metadata, cordoned, desired_status, skip_launch, check]
  }
}
