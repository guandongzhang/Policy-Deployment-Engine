resource "google_secure_source_manager_repository" "c" {
    location = "us-central1"
    repository_id = "my-repository-c"
    instance = "my-instance-c"
    description = "This is a test repository"
    project  = "policy-depolyment"
}