resource "google_secure_source_manager_repository" "c" {
    location = "us-central1"
    repository_id = "repo"
    instance = "test-instance-c"
    project  = "policy-depolyment"

    description = "This is the first repository"
    initial_config {
      default_branch = "main"
      readme = "README.md"
    }
}