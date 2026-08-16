output "cloud_function_sa_email" {
  description = "Service account email for Cloud Function"
  value       = google_service_account.cloud_function_sa.email
}

output "cloud_run_sa_email" {
  description = "Service account email for Cloud Run"
  value       = google_service_account.cloud_run_sa.email
}
