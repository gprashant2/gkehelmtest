# Production environment configuration
project_id    = "your-gcp-project-prod"
region        = "us-east4"
instance_name = "cloudsql-prod"
database_name = "app_db_prod"

# Database configuration
database_version     = "POSTGRES_15"
tier                = "db-standard-2"
disk_size           = 100
disk_type           = "PD_SSD"
availability_type   = "REGIONAL"
backup_enabled      = true

# Security
deletion_protection = true
authorized_networks = [
  {
    name  = "prod-app-network"
    value = "10.1.0.0/16"
  },
  {
    name  = "prod-admin-network"
    value = "10.2.0.0/24"
  }
]

# Database user
db_user = "prod_user"

# Maintenance window (Sunday at 3 AM)
maintenance_window_day  = 7
maintenance_window_hour = 3

# Labels
labels = {
  environment = "production"
  team        = "engineering"
  cost-center = "production"
  backup      = "required"
}
