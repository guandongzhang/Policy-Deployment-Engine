package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.approval_count

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [
	[
	{
		"situation_description": "Enforce a minimum number of approvals",
		"remedies": ["Have at least 3 people approve requests"],
	},
	{
		"condition": "Checks if there is a min number of approvals to merge branch",
		"attribute_path": ["minimum_approvals_count"],
		"values": [3, null],
		"policy_type": "range"
	},
	
	],

	[
	{
		"situation_description": "Enforce a minimum number of approvals and reviews",
		"remedies": ["Have at least 4 people review and 2 people approve the request"],
	},
	{
		"condition": "Checks if there is a min number of approvals to merge branch",
		"attribute_path": ["minimum_approvals_count"],
		"values": [2, null],
		"policy_type": "range"
	},
	{
		"condition": "Checks if there is a min number of approvals to merge branch",
		"attribute_path": ["minimum_reviews_count"],
		"values": [4, null],
		"policy_type": "range"
	}
	
	]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
