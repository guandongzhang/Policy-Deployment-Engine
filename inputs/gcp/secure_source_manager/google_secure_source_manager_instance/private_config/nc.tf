resource "google_secure_source_manager_instance" "nc" {
    instance_id = "test_private_config_gcp-secure-source-manager-nc"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    
    private_config {
    is_private = false
    ca_pool = "google_private"
  }
    
}
