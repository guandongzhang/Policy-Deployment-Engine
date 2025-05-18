resource "google_secure_source_manager_branch_rule" "nc" {
    location = "australia-southeast2-a"
     branch_rule_id = "my-pull-request-rule-nc"
    repository_id = "my-repository-nc"
    include_pattern = "*"
    project  = "policy-depolyment"
    require_pull_request  = false
}