module "cloudstorage" {
  source      = "./modules"
  project     = var.project
  region      = var.region
  environment = var.environment
}

