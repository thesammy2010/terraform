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
