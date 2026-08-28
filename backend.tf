terraform {
  required_version = "1.16.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "thesammy2010"
    workspaces {
      name = "terraform"
    }
  }
}
