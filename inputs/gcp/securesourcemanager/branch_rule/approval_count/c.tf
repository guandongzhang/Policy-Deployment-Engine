resource "google_secure_source_manager_branch_rule" "c" {
    location = "us-central1"
     branch_rule_id = "my-initial-branchrule-c"
    repository_id = "my-repository-c"
    include_pattern = "*"
    project  = "policy-depolyment"
    minimum_approvals_count   = 3
}