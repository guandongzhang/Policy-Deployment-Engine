resource "google_secure_source_manager_repository" "c" {
    location = "australia-southeast2-a"
    repository_id = "my-repository-c"
    instance = "test-repo-git-ignore-c"
    project  = "policy-depolyment"

    description = "This is a test repository"
    initial_config {
      default_branch = "main"
      gitignores = ["Bazel","Cloud9"]
      license = "mit"
      readme = "default"
    }
}