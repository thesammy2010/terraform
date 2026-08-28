output "app_id" {
  value       = fly_app.postgres.id
  description = "Fly.io ID of the Postgres app"
}

output "app_name" {
  value       = fly_app.postgres.name
  description = "Name of the Postgres app"
}

output "volume_id" {
  value       = fly_volume.pg_data.id
  description = "ID of the Postgres data volume"
}
