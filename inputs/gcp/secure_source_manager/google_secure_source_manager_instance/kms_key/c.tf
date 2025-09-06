# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secure_source_manager_instance" "c" {
    instance_id = "testgcp-secure-source-manager-c"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"
    
    kms_key = "company-provided-key"
    
}
