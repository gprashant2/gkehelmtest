terraform {
  backend "gcs" {
    bucket = "deploy89gp"
    prefix = "cloudstorage"
  }
}

