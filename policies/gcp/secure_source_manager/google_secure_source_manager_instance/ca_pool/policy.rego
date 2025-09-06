package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.ca_pool

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.vars

conditions := [[
	{
		"situation_description": "The instance must use a trusted Certificate Authority (CA) pool",
		"remedies": ["Set the 'ca_pool' attribute to the approved CA pool"],
	},
	{
		"condition": "Checks whether the ca_pool attribute is set to the required CA pool for compliance",
		"attribute_path": ["private_config", 0, "ca_pool"],
		"values": ["projects/*/locations/*/caPools/my-ca-pool",[["policy-depolyment"],["australia-southeast2"]]],
		"policy_type": "pattern whitelist",
	},
	{
		"situation_description": "The instance must use a trusted Certificate Authority (CA) pool",
		"remedies": ["Set the 'ca_pool' attribute to the approved CA pool"],
	},
	{
		"condition": "Checks whether the ca_pool attribute is set to the required CA pool for compliance",
		"attribute_path": ["private_config", 0, "ca_pool"],
		"values": [""],
		"policy_type": "blacklist",
	},
	]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
