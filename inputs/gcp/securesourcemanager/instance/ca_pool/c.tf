variable "project_id" {
  default = "policy-depolyment"
}

variable "region" {
  default = "australia-southeast2"
}

variable "zone" {
  default = "australia-southeast2-a"
}

variable "ca_pool_name" {
  default = "my-ca-pool"
}

resource "google_secure_source_manager_instance" "c" {
  instance_id = "testgcp-ca-pool-c"
  location    = var.zone
  project     = var.project_id

  private_config {
    is_private = true
    ca_pool    = "projects/${var.project_id}/locations/${var.region}/caPools/${var.ca_pool_name}"
  }
}
