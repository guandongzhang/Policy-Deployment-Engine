resource "google_secure_source_manager_branch_rule" "c" {
  location               = "us-central1"
  branch_rule_id         = "c1"
  repository_id          = "my-repository-c"
  include_pattern        = ".*" # matches all branches
  project                = "policy-depolyment"

  require_pull_request   = true
  minimum_reviews_count  = 1
  minimum_approvals_count = 2
  require_comments_resolved = true
  allow_stale_reviews    = false
  require_linear_history = true
}
