variable "fly_api_token" {
  type        = string
  description = "Fly.io API token"
  sensitive   = true
}

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
  description = "Fly.io region for the machine and its volume"
}

variable "image" {
  type        = string
  description = "Postgres image to run, ideally digest-pinned so plans stay stable"
}

variable "machine_name" {
  type        = string
  description = "Name of the Postgres machine. Changing this replaces the machine"
  default     = null
}

variable "desired_status" {
  type        = string
  description = "Desired machine status: started, stopped or suspended"
  default     = "started"
}

variable "env" {
  type        = map(string)
  description = "Environment variables set on the Postgres machine"
  default     = {}
}

variable "guest" {
  type = object({
    cpu_kind  = optional(string),
    cpus      = optional(number),
    memory_mb = optional(number),
  })
  description = "Guest VM sizing for the Postgres machine"
  default     = {}
}

variable "mount_path" {
  type        = string
  description = "Path inside the machine where the data volume is mounted"
  default     = "/data"
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

variable "services" {
  type = list(
    object(
      {
        protocol      = string,
        internal_port = number,
        autostart     = optional(bool),
        autostop      = optional(bool),
        force_https   = optional(bool),
        concurrency = optional(
          object(
            {
              type       = optional(string),
              soft_limit = optional(number),
              hard_limit = optional(number),
            }
          )
        ),
        ports = list(
          object(
            {
              port        = number,
              handlers    = list(string),
              force_https = optional(bool),
            }
          )
        ),
      }
    )
  )
  description = "Services the Postgres machine exposes"
  default     = []
}

variable "checks" {
  type = list(
    object(
      {
        name     = string,
        type     = string,
        port     = optional(number),
        path     = optional(string),
        interval = optional(string),
        timeout  = optional(string),
        method   = optional(string),
      }
    )
  )
  description = "Health checks run against the Postgres machine"
  default     = []
}

variable "metrics" {
  type = object(
    {
      port = optional(number),
      path = optional(string),
    }
  )
  description = "Prometheus metrics endpoint exposed by the machine"
  default     = null
}

variable "restart_policy" {
  type        = string
  description = "Restart policy for the Postgres machine"
  default     = "always"
}

variable "restart_max_retries" {
  type        = number
  description = "Maximum restart retries for the Postgres machine"
  default     = null
}
