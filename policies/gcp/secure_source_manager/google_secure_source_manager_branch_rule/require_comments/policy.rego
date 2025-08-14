package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.require_comments

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [
	[
	{
		"situation_description": "Enforce a rule to require comments resolved before merging to the branch",
		"remedies": ["Have this enabled for the branch before merge"],
	},
	{
		"condition": "Checks if there is a requirement for the comments to be resolved before merging",
		"attribute_path": ["require_comments_resolved"],
		"values": [true],
		"policy_type": "whitelist",
	},
	],
	[
	{
		"situation_description": "Ensure branches cannot be merged without fresh approvals and resolved comments",
		"remedies": [
		"Disable stale reviews so only up-to-date approvals are considered",
		"Require all review comments to be resolved before merging"
		],
	},
	{
		"condition": "Checks if stale reviews are disallowed",
		"attribute_path": ["allow_stale_reviews"],
		"values": [false],
		"policy_type": "whitelist"
	},
	{
		"condition": "Checks if unresolved comments block merge",
		"attribute_path": ["require_comments_resolved"],
		"values": [true],
		"policy_type": "whitelist"
	}
	]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
