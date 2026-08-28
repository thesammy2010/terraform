module "fly_postgres" {
  source   = "./modules/fly"
  org_slug = "leo-966"
  app_name = "thesammy2010"
  region   = "lhr"

  volume_size_gb            = 1
  volume_snapshot_retention = 5
}
