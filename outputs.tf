output "state_bucket_name" {
  value = google_storage_bucket.terraform_state.name
}

output "frontend_bucket_name" {
  value = google_storage_bucket.frontend.name
}

output "frontend_bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.frontend.name}/index.html"
}
