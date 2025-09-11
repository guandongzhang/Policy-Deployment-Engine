resource "google_secure_source_manager_instance" "c" {
    instance_id = "test_private_config_gcp-secure-source-manager-c"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    kms_key = "my-key"
    
    private_config {
    is_private = true
    ca_pool = "google_private"
  } 
}
