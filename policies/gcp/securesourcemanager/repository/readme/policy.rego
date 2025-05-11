package terraform.gcp.security.securesourcemanager.repository.readme
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.repository.vars

conditions := [
    [
    {"situation_description" : "Ensure the repository includes a 'README.md' file",
    "remedies":[ "Ensure the repository includes a 'README.md' file"]},
    {
        "condition": "Checks that 'README.md' is included in the repository's initial files",
        "attribute_path" : ["initial_config", 0, "readme"],
        "values" : [null],
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details