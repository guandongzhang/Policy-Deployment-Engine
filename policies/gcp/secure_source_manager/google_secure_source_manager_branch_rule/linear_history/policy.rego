package terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.linear_history

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_branch_rule.vars

conditions := [[
	{
		"situation_description": "Enforce a requirement for linear history before merging to the branch",
		"remedies": ["Enable this setting to maintain a cleaner commit history and simplify branch management."],
	},
	{
		"condition": "Checks if the requirement for linear history of the branch is enabled",
		"attribute_path": ["require_linear_history"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
