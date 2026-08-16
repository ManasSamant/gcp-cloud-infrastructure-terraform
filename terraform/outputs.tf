output "vpc_name" {
  value = module.networking.vpc_name
}

output "vpc_connector_id" {
  value = module.networking.vpc_connector_id
}
output "cloud_function_service_account" {
  value = module.iam.cloud_function_sa_email
}

output "cloud_run_service_account" {
  value = module.iam.cloud_run_sa_email
}

output "terraform_state_bucket" {
  value = module.storage.state_bucket_name
}

output "frontend_bucket" {
  value = module.storage.frontend_bucket_name
}

output "frontend_url" {
  value = module.storage.frontend_bucket_url
}
output "cloud_function_url" {
  value = module.compute.function_url
}

