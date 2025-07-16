terraform {
  backend "gcs" {
    bucket = "newbgp1"
    prefix = "cloudstorage"
  }
}

