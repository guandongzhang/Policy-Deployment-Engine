resource "google_secure_source_manager_branch_rule" "c" {
    location = "australia-southeast2-a"
     branch_rule_id = "my-pull-request-rule-c"
    repository_id = "my-repository-c"
    include_pattern = "*"
    project  = "policy-depolyment"
    require_pull_request  = true
}