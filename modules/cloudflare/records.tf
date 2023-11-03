resource "cloudflare_record" "TXT" {
  # for_each = var.txt_records
  for_each = {
    for idx, record in var.txt_records :
    "${record.name}-${sha1(record.value)}" => record
  }
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = each.value["name"]
  value   = each.value["value"]
  comment = each.value["comment"]
  proxied = each.value["proxied"]
  tags = [
    "terraform"
  ]
}
