variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "name" {
  description = "Instance name"
  type        = string
}

variable "zone" {
  description = "GCP zone (e.g. asia-east1-b)"
  type        = string
}

variable "machine_type" {
  description = "Machine type (e.g. e2-medium)"
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_image" {
  description = "Boot disk image (e.g. debian-cloud/debian-12)"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "Boot disk type (pd-standard, pd-ssd, pd-balanced)"
  type        = string
  default     = "pd-balanced"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link (optional)"
  type        = string
  default     = null
}

variable "enable_public_ip" {
  description = "Assign an ephemeral public IP"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Network tags"
  type        = list(string)
  default     = []
}

variable "metadata" {
  description = "Instance metadata key-value pairs"
  type        = map(string)
  default     = {}
}

variable "service_account_email" {
  description = "Service account email; leave empty for default compute SA"
  type        = string
  default     = null
}

variable "service_account_scopes" {
  description = "Service account OAuth scopes"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default     = {}
}
