resource "google_secure_source_manager_repository" "nc" {
    location = "us-central1"
    repository_id = "repo1"
    instance = "test-instance-nc"
    project  = "policy-depolyment"

   description = "This is the first repository"
    initial_config {
      default_branch = "release"
    }
}