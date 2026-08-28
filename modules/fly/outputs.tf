output "app_id" {
  value       = fly_app.postgres.id
  description = "Fly.io ID of the Postgres app"
}

output "app_name" {
  value       = fly_app.postgres.name
  description = "Name of the Postgres app"
}

output "machine_id" {
  value       = fly_machine.postgres.id
  description = "ID of the Postgres machine"
}

output "machine_private_ip" {
  value       = fly_machine.postgres.private_ip
  description = "Private IPv6 address of the Postgres machine on the Fly network"
}

output "volume_id" {
  value       = fly_volume.pg_data.id
  description = "ID of the Postgres data volume"
}
