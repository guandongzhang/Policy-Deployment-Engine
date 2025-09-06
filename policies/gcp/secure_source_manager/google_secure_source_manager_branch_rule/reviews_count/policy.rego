package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.reviews_count

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [[
	{
		"situation_description": "Enforce a minimum number of reviews",
		"remedies": ["Have at least 2 people review requests"],
	},
	{
		"condition": "Checks if there is a min number of reviews to approve and merge branch",
		"attribute_path": ["minimum_reviews_count"],
		"values": [2, null],
		"policy_type": "range",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
