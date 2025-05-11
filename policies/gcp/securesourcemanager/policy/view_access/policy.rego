package terraform.gcp.security.securesourcemanager.policy.view
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.policy.vars

conditions := [
    [
    {"situation_description" : "Ensure the policy is correctly set.",
    "remedies":[ "Set the role to instanceAccessor only",
    "Double-check the policy configuration in your Terraform code."]},
    {
        "condition": "The policy must be only instanceAccessor'.",
        "attribute_path" : ["policy_data"],
        "values": ["{\"bindings\":[{\"role\":\"roles/securesourcemanager.instanceAccessor\"}]}"] ,
       "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details