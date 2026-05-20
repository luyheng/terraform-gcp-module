resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size_gb
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    dynamic "access_config" {
      for_each = var.enable_public_ip ? [1] : []
      content {}
    }
  }

  metadata = var.metadata

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  labels = merge(var.labels, {
    managed-by = "terraform"
  })

  allow_stopping_for_update = true
}
