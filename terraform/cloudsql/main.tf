terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

# Generate random password for database
resource "random_password" "db_password" {
  length  = 16
  special = true
}

# Store password in Secret Manager
resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.instance_name}-db-password"
  
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = random_password.db_password.result
}

# Call the CloudSQL module
module "cloudsql" {
  source = "../modules"
  
  # Required variables
  project_id      = var.project_id
  region          = var.region
  instance_name   = var.instance_name
  database_name   = var.database_name
  
  # Database configuration
  database_version     = var.database_version
  tier                = var.tier
  disk_size           = var.disk_size
  disk_type           = var.disk_type
  availability_type   = var.availability_type
  backup_enabled      = var.backup_enabled
  
  # Security configuration
  deletion_protection = var.deletion_protection
  authorized_networks = var.authorized_networks
  
  # Database credentials
  db_user     = var.db_user
  db_password = random_password.db_password.result
  
  # Maintenance window
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  
  # Labels
  labels = var.labels
}
