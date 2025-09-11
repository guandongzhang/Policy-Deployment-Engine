package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.workforce_identity_federation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.vars

conditions := [[
	{
		"situation_description": "Ensure Workforce Identity Federation is enabled for secure, federated access",
		"remedies": ["Set workforce identity federation config to true"],
	},
	{
		"condition": "Checks that Workforce Identity Federation is enabled",
		"attribute_path": ["workforce_identity_federation_config", 0, "enabled"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
