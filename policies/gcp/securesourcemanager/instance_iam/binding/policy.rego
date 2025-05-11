package terraform.gcp.security.securesourcemanager.instance_iam.binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.instance_iam.vars

conditions := [
    [
    {"situation_description" : "Ensure the IAM binding role is correctly set.",
    "remedies":[ "Set the role to 'roles/secureSourceManager.instanceAccessor' to comply with the policy",
    "Double-check the IAM role configuration in your Terraform code."]},
    {
        "condition": "The IAM role must be 'roles/secureSourceManager.instanceAccessor'.",
        "attribute_path" : ["role"],
        "values" : ["roles/secureSourceManager.instanceAccessor"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details