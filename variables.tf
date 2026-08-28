variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API Key"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone ID"
}

variable "terraform_cloud_deploy_token" {
  type        = string
  description = "Fly.io API token"
  sensitive   = true
}
