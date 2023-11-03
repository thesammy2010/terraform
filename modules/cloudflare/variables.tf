variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API Key"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone ID"
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare Account ID"
}

variable "txt_records" {
  type = list(
    object({
      name    = string,
      value   = string,
      proxied = bool,
      comment = string
    })
  )
  description = "Map of TXT records to add"
}
