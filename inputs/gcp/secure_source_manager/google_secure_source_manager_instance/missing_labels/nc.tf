resource "google_secure_source_manager_instance" "nc" {
  instance_id = "nc1"
  location    = "us-central1"
  project     = "example-project-id"
  kms_key     = "projects/example-project-id/locations/global/keyRings/example-ring/cryptoKeys/example-key"

  workforce_identity_federation_config {
    enabled = true
  }

  # Missing 'owner' label — this triggers the policy
  labels = {
    environment = "prod"
  }

  private_config {
    is_private = true
    ca_pool    = "projects/example-project-id/locations/us-central1/caPools/secure-ca-pool"
  }

  lifecycle {
    prevent_destroy = true
  }
}
