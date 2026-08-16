
data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/function"
  output_path = "${path.module}/function.zip"
}


resource "google_storage_bucket" "function_source" {
  name     = "${var.project_id}-function-source"
  location = var.region
}


resource "google_storage_bucket_object" "function_zip" {
  name   = "function.zip"
  bucket = google_storage_bucket.function_source.name
  source = data.archive_file.function_zip.output_path
}


resource "google_cloudfunctions2_function" "backend" {
  project  = var.project_id
  name     = "exercise5-backend"
  location = var.region

  build_config {
    runtime     = "python311"
    entry_point = "handler"

    # Use custom service account for build
    service_account = "projects/${var.project_id}/serviceAccounts/${var.cloud_function_sa_email}"


    source {
      storage_source {
        bucket = google_storage_bucket.function_source.name
        object = google_storage_bucket_object.function_zip.name
      }
    }
  }

  service_config {
    service_account_email = var.cloud_function_sa_email
    available_memory      = "256M"
    timeout_seconds       = 60
    ingress_settings      = "ALLOW_ALL"
    vpc_connector         = var.vpc_connector_id
  }
}

