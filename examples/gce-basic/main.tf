provider "google" {
  project = var.project_id
  region  = var.region
}

module "web_server" {
  # 本地路徑，方便在 module repo 內測試
  source = "../../modules/gce"

  project_id   = var.project_id
  name         = "example-web"
  zone         = "${var.region}-b"
  machine_type = "e2-small"

  enable_public_ip = true
  tags             = ["http-server", "https-server"]

  labels = {
    env  = "example"
    team = "platform"
  }
}

output "web_server_ip" {
  value = module.web_server.external_ip
}
