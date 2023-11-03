module "cloudflare" {
  source                = "./modules/cloudflare"
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_zone_id    = var.cloudflare_zone_id
  txt_records = [
    {
      "name" : "test",
      "value" : "foobar"
      "proxied" : false,
      "comment" : "This is a test via Terraform"
    },
    {
      "name" : "mail"
      "value" : "v=spf1 include:simplelogin.co ~all",
      "proxied" : false,
      "comment" : null
    }
  ]
}
