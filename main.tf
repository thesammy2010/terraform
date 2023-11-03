module "cloudflare" {
  source                = "./modules/cloudflare"
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_zone_id    = var.cloudflare_zone_id
  txt_records = [
    {
      "name" : "_dmarc.mail",
      "value" : "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s",
      "proxied" : false,
      "comment" : null
    },
    {
      "name" : "mail"
      "value" : "v=spf1 include:simplelogin.co ~all",
      "proxied" : false,
      "comment" : null
    },
    {
      "name" : "mail",
      "value" : "sl-verification=iexaqmuqgizrxuitllmharfijvpqla",
      "proxied" : false,
      "comment" : null
    },
    {
      "name" : "test",
      "value" : "foo=bar"
      "proxied" : false,
      "comment" : "This is a test via Terraform"
    },
  ]
}
