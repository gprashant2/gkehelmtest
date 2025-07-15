# Stage environment configuration
project_id    = "your-gcp-project-stage"
region        = "us-east4"
instance_name = "cloudsql-stage"
database_name = "app_db_stage"

# Database configuration
database_version     = "POSTGRES_15"
tier                = "db-f1-micro"
disk_size           = 10
disk_type           = "PD_SSD"
availability_type   = "ZONAL"
backup_enabled      = true

# Security
deletion_protection = false
authorized_networks = [
  {
    name  = "stage-app-network"
    value = "10.0.0.0/8"
  }
]

# Database user
db_user = "stage_user"

# Maintenance window (Sunday at 2 AM)
maintenance_window_day  = 7
maintenance_window_hour = 2

# Labels
labels = {
  environment = "stage"
  team        = "engineering"
  cost-center = "development"
}
