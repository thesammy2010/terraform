module "fly_postgres" {
  source        = "./modules/fly"
  fly_api_token = var.terraform_cloud_deploy_token
  org_slug      = "leo-966"
  app_name      = "thesammy2010"
  region        = "lhr"

  # Digest-pinned so that a retag of flyio/postgres-flex:15.3 upstream does not
  # silently show up as a diff. Bump both tag and digest together on upgrade.
  image        = "flyio/postgres-flex:15.3@sha256:44b698752cf113110f2fa72443d7fe452b48228aafbb0d93045ef1e3282360a6"
  machine_name = "restless-feather-5104"

  env = {
    PRIMARY_REGION = "lhr"
  }

  guest = {
    cpu_kind  = "shared"
    cpus      = 1
    memory_mb = 256
  }

  mount_path                 = "/data"
  volume_name                = "pg_data"
  volume_size_gb             = 1
  volume_encrypted           = true
  volume_auto_backup_enabled = true
  volume_snapshot_retention  = 5

  services = [
    {
      "protocol" : "tcp",
      "internal_port" : 5432,
      "autostart" : true,
      "force_https" : false,
      "concurrency" : {
        "type" : "connections",
        "soft_limit" : 1000,
        "hard_limit" : 1000,
      },
      "ports" : [
        {
          "port" : 5432,
          "handlers" : ["pg_tls"],
          "force_https" : false,
        },
      ],
    },
    {
      "protocol" : "tcp",
      "internal_port" : 5433,
      "autostart" : true,
      "force_https" : false,
      "concurrency" : {
        "type" : "connections",
        "soft_limit" : 1000,
        "hard_limit" : 1000,
      },
      "ports" : [
        {
          "port" : 5433,
          "handlers" : ["pg_tls"],
          "force_https" : false,
        },
      ],
    },
  ]

  checks = [
    {
      "name" : "pg",
      "type" : "http",
      "port" : 5500,
      "path" : "/flycheck/pg",
      "interval" : "15s",
      "timeout" : "10s",
    },
    {
      "name" : "role",
      "type" : "http",
      "port" : 5500,
      "path" : "/flycheck/role",
      "interval" : "15s",
      "timeout" : "10s",
    },
    {
      "name" : "vm",
      "type" : "http",
      "port" : 5500,
      "path" : "/flycheck/vm",
      "interval" : "15s",
      "timeout" : "10s",
    },
  ]

  metrics = {
    port = 9187
    path = "/metrics"
  }

  restart_policy      = "always"
  restart_max_retries = 0
}
