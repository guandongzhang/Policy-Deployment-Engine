package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.kms_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.vars

conditions := [[
	{
		"situation_description": "The instance must be configured to use a company-managed KMS key",
		"remedies": ["Review your Terraform configuration to reference the approved KMS key"],
	},
	{
		"condition": "Verifies that the 'kms_key' attribute is set to the approved company-managed key",
		"attribute_path": ["kms_key"],
		"values": [null],
		"policy_type": "blacklist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
