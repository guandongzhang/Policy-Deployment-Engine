package terraform.gcp.security.securesourcemanager.repository.default_branch
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.repository.vars

conditions := [
    [
    {"situation_description" : "Default branch to be created and used for your repository instance",
    "remedies":[ "Set the default branch to main in your configuration"]},
    {
        "condition": "Checks that the default branch is set to 'main'",
        "attribute_path" : ["initial_config",0,"default_branch"],
        "values" : ["main"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details