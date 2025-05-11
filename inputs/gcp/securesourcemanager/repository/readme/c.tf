resource "google_secure_source_manager_repository" "c" {
    location = "us-central1"
    repository_id = "repo-c"
    instance = "test-repo-readme-c"
    project  = "policy-depolyment"
    
    initial_config {
      readme = "README.md"
    }
}