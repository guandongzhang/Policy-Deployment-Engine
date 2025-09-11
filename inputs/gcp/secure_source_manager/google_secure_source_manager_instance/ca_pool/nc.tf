resource "google_secure_source_manager_instance" "nc" {
  instance_id = "testgcp-ca-pool-nc"
  location    = var.zone
  project     = var.project_id

  private_config {
    is_private = true
    ca_pool    = ""
  }
}
