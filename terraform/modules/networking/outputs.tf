output "vpc_name" {
  description = "VPC network name"
  value       = google_compute_network.vpc.name
}

output "vpc_connector_id" {
  description = "Serverless VPC connector ID"
  value       = google_vpc_access_connector.connector.id
}
