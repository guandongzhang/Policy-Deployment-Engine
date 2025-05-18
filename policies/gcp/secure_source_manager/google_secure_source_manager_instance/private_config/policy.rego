package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.private_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.vars

conditions := [[
	{
		"situation_description": "Checks the type of access of the Source Manager",
		"remedies": ["Google Source Instance must be private"],
	},
	{
		"condition": "Checks the access type of the created instance",
		"attribute_path": ["private_config", 0, "is_private"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
