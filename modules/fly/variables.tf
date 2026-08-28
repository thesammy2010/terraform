variable "org_slug" {
  type        = string
  description = "Fly.io organization slug the app belongs to"
}

variable "app_name" {
  type        = string
  description = "Name of the Fly.io app that hosts the Postgres cluster"
}

variable "region" {
  type        = string
  description = "Fly.io region for the data volume"
}

variable "volume_name" {
  type        = string
  description = "Name of the Postgres data volume"
  default     = "pg_data"
}

variable "volume_size_gb" {
  type        = number
  description = "Size of the data volume in GB. Fly volumes are extend-only, so this can grow but never shrink"
}

variable "volume_encrypted" {
  type        = bool
  description = "Whether the data volume is encrypted. Changing this replaces the volume"
  default     = true
}

variable "volume_auto_backup_enabled" {
  type        = bool
  description = "Whether Fly takes automatic snapshots of the data volume"
  default     = true
}

variable "volume_snapshot_retention" {
  type        = number
  description = "Number of volume snapshots Fly retains"
  default     = null
}
