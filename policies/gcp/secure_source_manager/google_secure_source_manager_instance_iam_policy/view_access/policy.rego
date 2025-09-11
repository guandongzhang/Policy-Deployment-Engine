package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_policy.view_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance_iam_policy.vars

# Extract the actual values dynamically
extracted_values := [v |
	r := input.planned_values.root_module.resources[_] # Iterate over all resources in the planned Terraform values
	r.type == vars.variables.resource_type # Only consider resources of resource policy type (defined in vars)
	pd := json.unmarshal(r.values.policy_data) # Unmarshel the 'policy_data' JSON string into an object
	binding := pd.bindings[_] # Iterate over each binding inside the decoded policy data
	contains(binding.role, "instanceAccessor") # Check if the binding role contains 'instanceAccessor'
	v := r.values.policy_data # If the condition passes, capture the raw policy_data value
]

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
		"values": extracted_values,
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
