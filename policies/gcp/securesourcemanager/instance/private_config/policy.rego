package terraform.gcp.security.securesourcemanager.instance.private_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.instance.vars

conditions := [
    [
    {"situation_description" : "Checks the type of access of the Source Manager",
    "remedies":[ "Google Source Instance must be private"]},
    {
        "condition": "Checks the access type of the created instance",
        "attribute_path" : ["private_config", 0, "is_private"],
        "values" : [true],
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