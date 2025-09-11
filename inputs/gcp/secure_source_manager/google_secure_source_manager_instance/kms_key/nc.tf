# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secure_source_manager_instance" "nc" {
    instance_id = "testgcp-secure-source-manager-nc"
    location = "australia-southeast2-a"
    project = "voltaic-pilot-419406"

 # kms_key = "my-key" check whether this key exists or not, 
}