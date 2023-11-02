variable "cloudflare_api_token" {}

variable "cloudflare_zone_id" {}

variable "cloudflare_account_id" {}

variable "txt_records" {
  type = map(
    object({
      value   = string,
      proxied = bool,
      comment = string
    })
  )
  # type = list(object({
  #   name    = string,
  #   value   = string,
  #   proxied = bool,
  #   comment = string
  # }))
}
