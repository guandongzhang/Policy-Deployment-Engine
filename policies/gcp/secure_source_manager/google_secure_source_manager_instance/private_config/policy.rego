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
	],
	
	[
	{
		"situation_description": "The instance must not be public and without CMEK",
		"remedies": ["Ensure that you encrypt your public instances with google_kms"],
	},
	{
		"condition": "Verifies that the 'kms_key' attribute is set to the approved company-managed key",
		"attribute_path": ["kms_key"],
		"values": [null],
		"policy_type": "blacklist",
	},
	{
		"condition": "Verifies that the the instance is private",
		"attribute_path": ["private_config", 0, "is_private"],
		"values": [true],
		"policy_type": "whitelist",
	}
	]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
