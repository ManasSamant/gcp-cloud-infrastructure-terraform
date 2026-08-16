
resource "google_storage_bucket" "terraform_state" {
  name          = var.state_bucket_name
  location      = var.region
  force_destroy = false

  versioning {
    enabled = true
  }
}


resource "google_storage_bucket" "frontend" {
  name          = var.frontend_bucket_name
  location      = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
  }
}


resource "google_storage_bucket_object" "frontend_files" {
  for_each = fileset("${path.module}/frontend", "*")

  name   = each.value
  bucket = google_storage_bucket.frontend.name
  source = "${path.module}/frontend/${each.value}"
}

resource "google_storage_bucket_iam_member" "frontend_public_read" {
  bucket = google_storage_bucket.frontend.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_storage_bucket" "tf_state" {
  name          = "cloud-excercise-03-manassamant-tf-state"
  location      = var.region
  force_destroy = true
}


