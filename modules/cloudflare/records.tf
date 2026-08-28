resource "cloudflare_record" "TXT" {
  for_each = {
    for record in var.txt_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = each.value.name
  value   = each.value.value
  comment = each.value.comment
  proxied = each.value.proxied != null ? each.value.proxied : false
}

resource "cloudflare_record" "A" {
  for_each = {
    for record in var.a_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "A"
  name    = each.value.name
  value   = each.value.value
  comment = each.value.comment
  proxied = each.value.proxied != null ? each.value.proxied : false
  ttl     = each.value.ttl
}

resource "cloudflare_record" "AAAA" {
  for_each = {
    for record in var.aaaa_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "AAAA"
  name    = each.value.name
  value   = each.value.value
  comment = each.value.comment
  proxied = each.value.proxied != null ? each.value.proxied : false
  ttl     = each.value.ttl
}

resource "cloudflare_record" "CNAME" {
  for_each = {
    for record in var.cname_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "CNAME"
  name    = each.value.name
  value   = each.value.value
  comment = each.value.comment
  proxied = each.value.proxied != null ? each.value.proxied : false
  ttl     = each.value.ttl
}

resource "cloudflare_record" "MX" {
  for_each = {
    for record in var.mx_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id  = var.cloudflare_zone_id
  type     = "MX"
  name     = each.value.name
  value    = each.value.value
  comment  = each.value.comment
  proxied  = each.value.proxied != null ? each.value.proxied : false
  ttl      = each.value.ttl
  priority = each.value.priority
}
