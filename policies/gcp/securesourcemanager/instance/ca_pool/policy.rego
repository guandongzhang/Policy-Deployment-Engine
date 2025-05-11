package terraform.gcp.security.securesourcemanager.instance.ca_pool
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.instance.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "The Secure Source Manager instance must use a trusted Certificate Authority (CA) pool",
    "remedies":["Set the 'ca_pool' attribute to the approved CA pool"]},
    {
        "condition": "Checks whether the 'ca_pool' attribute is set to the required CA pool for compliance",
        "attribute_path" : ["private_config", 0, "ca_pool"],
        "values" : "projects/policy-depolyment/locations/australia-southeast2/caPools/my-ca-pool",
        "policy_type" : "whitelist" 
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details