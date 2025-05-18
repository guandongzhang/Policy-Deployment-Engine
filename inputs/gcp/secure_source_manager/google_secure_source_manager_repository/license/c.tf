resource "google_secure_source_manager_repository" "c" {
    location = "australia-southeast2-a"
    repository_id = "repo-c"
    instance = "test-repo-license-type-c"
    project  = "policy-depolyment"
    
    initial_config {
      readme = "README.md"
      license = "mit"
    }
}