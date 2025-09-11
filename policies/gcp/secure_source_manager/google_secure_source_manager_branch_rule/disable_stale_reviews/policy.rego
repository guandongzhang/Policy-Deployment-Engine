package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.disable_stale_reviews
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [
	[
	{
  "situation_description": "Prevent merging of branches with outdated approvals",
  "remedies": ["Disable stale reviews to ensure approvals are always up-to-date before merging"]
	},
	{
		"condition": "Checks if there is a min number of approvals to merge branch",
		"attribute_path": ["allow_stale_reviews"],
		"values": [false],
		"policy_type": "whitelist"
	},
	
	]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
