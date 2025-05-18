package terraform.gcp.security.secure_source_manager.google_secure_source_manager_repository.git_ignore

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_repository.vars

conditions := [[
	{
		"situation_description": "Ensure repository uses approved tech stack",
		"remedies": ["Use tech stack from the approved list in the config file"],
	},
	{
		"condition": "Verify tech stack in repository is not null",
		"attribute_path": ["initial_config", 0, "gitignores"],
		"values": [null],
		"policy_type": "blacklist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
