variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "state_bucket_name" {
  description = "Bucket name for Terraform remote state"
  type        = string
}

variable "frontend_bucket_name" {
  description = "Bucket name for frontend static assets"
  type        = string
}
