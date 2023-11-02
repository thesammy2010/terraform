resource "cloudflare_record" "TXT" {
  for_each = var.txt_records
  zone_id  = var.cloudflare_zone_id
  type     = "TXT"
  name     = each.key
  value    = each.value["value"]
  comment  = each.value["comment"]
  proxied  = each.value["proxied"]
  tags = [
    "terraform"
  ]
}
