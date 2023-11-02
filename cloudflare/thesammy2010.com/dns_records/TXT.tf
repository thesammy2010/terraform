resource "cloudflare_record" "terraform-test" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform"
  value   = "This was created using Terraform"
  type    = "TXT"
  proxied = false
  tags = [ 
    "terraform"
   ]
}
