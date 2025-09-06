resource "google_secure_source_manager_branch_rule" "c" {
    location = "us-central1"
     branch_rule_id = "c1"
    repository_id = "my-repository-c"
    include_pattern = "*"
    project  = "policy-depolyment"
    minimum_approvals_count   = 4
    minimum_reviews_count = 2
}