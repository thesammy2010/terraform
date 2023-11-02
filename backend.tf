terraform {
  required_version = "1.6.1"
  cloud {
    organization = "thesammy2010"
    workspaces {
      name = "terraform"
    }
  }
}
