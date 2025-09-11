resource "google_secure_source_manager_instance" "c" {
    instance_id = "test_workforce_identity_federation-c"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    
    workforce_identity_federation_config {
      enabled = true
    } 
}
