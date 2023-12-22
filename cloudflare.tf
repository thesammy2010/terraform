module "cloudflare" {
  source               = "./modules/cloudflare"
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  txt_records = [
    {
      "name" : "_dmarc.mail",
      "value" : "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "mail"
      "value" : "v=spf1 include:simplelogin.co ~all",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "mail",
      "value" : "sl-verification=iexaqmuqgizrxuitllmharfijvpqla",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "thesammy2010.com",
      "value" : "sl-verification=lbujgkpdypcdikfpracxopphygazun",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "thesammy2010.com",
      "value" : "v=spf1 include:simplelogin.co ~all",
      "comment" : "SimpleLogin"
    },
    {
      "name" : "_dmarc",
      "value" : "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s",
      "comment" : "SimpleLogin"
    }
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
  aaaa_records = [
    {
      "name" : "thesammy2010.com",
      "value" : "2606:50c0:8003::153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "2606:50c0:8002::153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "2606:50c0:8001::153",
      "comment" : "GitHub",
      "proxied" : true,
    },
    {
      "name" : "thesammy2010.com",
      "value" : "2606:50c0:8000::153",
      "comment" : "GitHub",
      "proxied" : true,
    }
  ]
  cname_records = [
    {
      "name" : "dkim._domainkey.mail",
      "value" : "dkim._domainkey.simplelogin.co",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "dkim._domainkey.thesammy2010.com",
      "value" : "dkim._domainkey.simplelogin.co",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "dkim02._domainkey.thesammy2010.com",
      "value" : "dkim02._domainkey.simplelogin.co.",
      "comment" : "SimpleLogin",
    },
    {
      "name" : "dkim03._domainkey.thesammy2010.com",
      "value" : "dkim03._domainkey.simplelogin.co.",
      "comment" : "SimpleLogin",
    }
  ]
  mx_records = [
    {
      "name" : "mail",
      "value" : "mx1.simplelogin.co",
      "priority" : 10,
      "comment" : "SimpleLogin",
    },
    {
      "name" : "mail",
      "value" : "mx2.simplelogin.co",
      "priority" : 20,
      "comment" : "SimpleLogin"
    },
    {
      "name" : "thesammy2010.com",
      "value" : "mx1.simplelogin.co",
      "priority" : 10,
      "comment" : "SimpleLogin",
    },
    {
      "name" : "thesammy2010.com",
      "value" : "mx2.simplelogin.co",
      "priority" : 20,
      "comment" : "SimpleLogin"
    },
  ]
}
