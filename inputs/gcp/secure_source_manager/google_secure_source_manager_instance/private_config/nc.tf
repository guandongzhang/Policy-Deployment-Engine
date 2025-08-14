resource "google_secure_source_manager_instance" "nc1" {
    instance_id = "nc1"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    kms_key = "my-key"

    private_config {
    is_private = false
    ca_pool = "google_private"
  }
    
}

resource "google_secure_source_manager_instance" "nc2" {
    instance_id = "nc2"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"

    
    private_config {
    is_private = false
    ca_pool = "google_private"
  } 
}

