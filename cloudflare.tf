module "cloudflare" {
  source               = "./modules/cloudflare"
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  txt_records = [
    {
      "name" : "_dmarc.mail",
      "value" : "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s",
      "proxied" : false,
      "comment" : "SimpleLogin",
    },
    {
      "name" : "mail"
      "value" : "v=spf1 include:simplelogin.co ~all",
      "proxied" : false,
      "comment" : "SimpleLogin",
    },
    {
      "name" : "mail",
      "value" : "sl-verification=iexaqmuqgizrxuitllmharfijvpqla",
      "proxied" : false,
      "comment" : "SimpleLogin",
    },
  ]
  a_records = [
    {
      "name" : "mail"
      "value" : "192.0.2.1",
      "proxied" : true,
      "comment" : "SimpleLogin",
    },
    {
      "name" : "thesammy2010.com",
      "value" : "185.199.111.153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "185.199.110.153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "185.199.109.153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "185.199.108.153",
      "comment" : "GitHub",
      "proxied" : true,
    }
  ]
}
