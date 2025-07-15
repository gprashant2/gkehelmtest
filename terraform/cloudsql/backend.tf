terraform {
  backend "gcs" {
    bucket = "run-sources-poc-070424-us-central1"
    prefix = "cloudsql"
  }
}
