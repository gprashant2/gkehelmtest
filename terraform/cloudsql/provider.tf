provider "google" {
  project = var.project_id
  region  = var.region
}

provider "random" {
  # No configuration needed
}
