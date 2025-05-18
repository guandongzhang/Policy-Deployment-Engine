package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_policy.view_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_policy.vars

conditions := [[
	{
		"situation_description": "Ensure the policy is correctly set.",
		"remedies": [
			"Set the role to instanceAccessor only",
			"Double-check the policy configuration in your Terraform code.",
		],
	},
	{
		"condition": "The policy must be only instanceAccessor.",
		"attribute_path": ["policy_data"],
		"values": ["{\"bindings\":[{\"role\":\"roles/secure_source_manager.instanceAccessor\"}]}"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
