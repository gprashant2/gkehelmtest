variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for the Cloud SQL instance"
  type        = string
  default     = "us-east4"
}

variable "instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "database_version" {
  description = "The database version"
  type        = string
  default     = "POSTGRES_15"
}

variable "tier" {
  description = "The machine type for the Cloud SQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "disk_size" {
  description = "The disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type (PD_SSD or PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "availability_type" {
  description = "The availability type (ZONAL or REGIONAL)"
  type        = string
  default     = "ZONAL"
}

variable "backup_enabled" {
  description = "Enable automated backups"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = true
}

variable "authorized_networks" {
  description = "List of authorized networks"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "db_user" {
  description = "Database user name"
  type        = string
  default     = "app_user"
}

variable "maintenance_window_day" {
  description = "Day of the week for maintenance window (1-7, where 1 is Monday)"
  type        = number
  default     = 7
}

variable "maintenance_window_hour" {
  description = "Hour of the day for maintenance window (0-23)"
  type        = number
  default     = 2
}

variable "maintenance_window_update_track" {
  description = "Update track for maintenance window (stable or canary)"
  type        = string
  default     = "stable"
}

variable "labels" {
  description = "Labels to apply to resources"
  type        = map(string)
  default     = {}
}
