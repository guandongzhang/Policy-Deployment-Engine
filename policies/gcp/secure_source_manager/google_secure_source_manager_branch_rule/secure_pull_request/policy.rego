package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.secure_pull_request

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [[
  {
    "situation_description": "Enforce secure and standard pull request practices across repositories",
    "remedies": [
      "Require pull requests for all changes",
      "Set a minimum of 1 reviewer and 2 approvals",
      "Disallow merging if comments are unresolved or reviews are stale",
      "Maintain a linear commit history for traceability"
    ]
  },
  {
    "condition": "Require pull request before merging",
    "attribute_path": ["require_pull_request"],
    "values": [true],
    "policy_type": "whitelist"
  },
  {
    "condition": "At least 1 review required",
    "attribute_path": ["minimum_reviews_count"],
    "comparison": ">=",
    "values": [1],
    "policy_type": "whitelist"
  },
  {
    "condition": "At least 2 approvals required",
    "attribute_path": ["minimum_approvals_count"],
    "comparison": ">=",
    "values": [2],
    "policy_type": "whitelist"
  },
  {
    "condition": "Require all comments to be resolved before merging",
    "attribute_path": ["require_comments_resolved"],
    "values": [true],
    "policy_type": "whitelist"
  },
  {
    "condition": "Do not allow stale reviews",
    "attribute_path": ["allow_stale_reviews"],
    "values": [false],
    "policy_type": "whitelist"
  },
  {
    "condition": "Enforce linear history",
    "attribute_path": ["require_linear_history"],
    "values": [true],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
