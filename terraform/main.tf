
resource "google_project_service" "required_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "run.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudbuild.googleapis.com",
    "firestore.googleapis.com",
    "vpcaccess.googleapis.com",
    "artifactregistry.googleapis.com"
  ])

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}


module "networking" {
  source       = "./modules/networking"
  project_id   = var.project_id
  region       = var.region
  network_name = "exercise5-vpc"
}
module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
}

module "storage" {
  source               = "./modules/storage"
  project_id           = var.project_id
  region               = var.region
  state_bucket_name    = "${var.project_id}-tf-state"
  frontend_bucket_name = "${var.project_id}-frontend"
}

module "compute" {
  source = "./modules/compute"

  project_id = var.project_id
  region     = var.region

  vpc_connector_id        = module.networking.vpc_connector_id
  cloud_function_sa_email = module.iam.cloud_function_sa_email
  cloud_run_sa_email      = module.iam.cloud_run_sa_email
}


resource "google_cloud_run_v2_service_iam_member" "function_public_invoker" {
  project  = var.project_id
  location = var.region
  name     = module.compute.function_name

  role   = "roles/run.invoker"
  member = "allUsers"
}

resource "google_cloud_run_v2_service_iam_member" "backend_public" {
  project  = var.project_id
  location = var.region
  name     = module.compute.function_name

  role   = "roles/run.invoker"
  member = "allUsers"
}
