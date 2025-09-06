package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_binding.binding

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_binding.vars

conditions := [[
	{
		"situation_description": "Ensure the IAM binding role is correctly set.",
		"remedies": [
			"Set the role to 'roles/secure_source_manager.instanceAccessor' to comply with the policy",
			"Double-check the IAM role configuration in your Terraform code.",
		],
	},
	{
		"condition": "The IAM role must be 'roles/secure_source_manager.instanceAccessor'.",
		"attribute_path": ["role"],
		"values": ["roles/secure_source_manager.instanceAccessor"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
