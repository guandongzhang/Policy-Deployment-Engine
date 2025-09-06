resource "google_secure_source_manager_instance" "nc" {
    instance_id = "test_workforce_identity_federation-nc"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    
    workforce_identity_federation_config {
      enabled = false
    } 
}
