terraform {
  cloud {
    organization = "thesammy2010"
    workspaces {
      name = "terraform"
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
