package terraform.gcp.security.securesourcemanager.repository.git_ignore
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.repository.vars

conditions := [
    [
    {"situation_description" : "Ensure repository configuration uses approved tech stack",
    "remedies":[ "Ensure the tech stack is from the approved list in the configuration file"]},
    {
        "condition": "Verify that the tech stack used in the repository is from the approved list",
        "attribute_path" : ["initial_config",0,"gitignores"],
        "values" : [null],
        "policy_type" : "blacklist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details