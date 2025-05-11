resource "google_secure_source_manager_repository" "nc" {
    location = "australia-southeast2-a"
    repository_id = "my-repository-nc"
    instance = "test-repo-git-ignore-nc"
    project  = "policy-depolyment"

    description = "This is a test repository"
}