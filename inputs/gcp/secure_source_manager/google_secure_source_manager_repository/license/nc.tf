resource "google_secure_source_manager_repository" "nc" {
    location = "australia-southeast2-a"
    repository_id = "repo-nc"
    instance = "test-repo-license-type-nc"
    project  = "policy-depolyment"
    
    initial_config {
      readme = "README.md"
    }
}