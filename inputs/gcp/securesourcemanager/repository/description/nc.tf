resource "google_secure_source_manager_repository" "nc" {
    location = "us-central1"
    repository_id = "my-repository-nc"
    instance = "my-instance-nc"
    project  = "policy-depolyment"
}