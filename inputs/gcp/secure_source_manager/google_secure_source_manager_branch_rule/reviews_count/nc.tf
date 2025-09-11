resource "google_secure_source_manager_branch_rule" "nc" {
    location = "us-central1"
     branch_rule_id = "my-review-rule-nc"
    repository_id = "my-repository-nc"
    include_pattern = "*"
    project  = "policy-depolyment"

}