resource "google_storage_bucket" "this" {
  name     = "${var.environment}-bucket-${var.region}"
  location = var.region
}

