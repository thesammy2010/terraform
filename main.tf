module "cloudflare" {
  source                = "./modules/cloudflare"
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_zone_id    = var.cloudflare_zone_id
  txt_records = {
    "test" : {
      value : "foobar"
      proxied : false,
      comment : "This is a test via Terraform"
    }
  }
}
