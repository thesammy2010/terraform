resource "cloudflare_record" "TXT" {
  for_each = {
    for idx, record in var.txt_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = each.value["name"]
  value   = each.value["value"]
  comment = each.value["comment"] != null ? each.value["comment"] : null
  proxied = each.value["proxied"] != null ? each.value["proxied"] : false
}

resource "cloudflare_record" "A" {
  for_each = {
    for idx, record in var.a_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "A"
  name    = each.value["name"]
  value   = each.value["value"]
  comment = each.value["comment"] != null ? each.value["comment"] : null
  proxied = each.value["proxied"] != null ? each.value["proxied"] : false
  ttl     = each.value["ttl"] != null ? each.value["ttl"] : null
}
