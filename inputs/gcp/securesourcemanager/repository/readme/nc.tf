resource "google_secure_source_manager_repository" "nc" {
    location = "us-central1"
    repository_id = "repo-nc"
    instance = "test-repo-nc"
    project  = "policy-depolyment"

}