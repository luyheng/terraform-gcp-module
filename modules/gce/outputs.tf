output "instance_id" {
  description = "Instance ID"
  value       = google_compute_instance.this.instance_id
}

output "self_link" {
  description = "Self link of the instance"
  value       = google_compute_instance.this.self_link
}

output "name" {
  description = "Instance name"
  value       = google_compute_instance.this.name
}

output "internal_ip" {
  description = "Internal IP address"
  value       = google_compute_instance.this.network_interface[0].network_ip
}

output "external_ip" {
  description = "External IP address (null if not assigned)"
  value       = try(google_compute_instance.this.network_interface[0].access_config[0].nat_ip, null)
}
