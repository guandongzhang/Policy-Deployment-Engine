package terraform.gcp.security.securesourcemanager.branch_rule.pull_request
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.branch_rule.vars

conditions := [
    [
    {"situation_description" : "Enforce a pull request creation before merge",
    "remedies":[ "Set the required flag for pull request"]},
    {
        "condition": "Checks if there is a pull request requirement before merge",
        "attribute_path" : ["require_pull_request"],
        "values" : [false],
        "policy_type" : "blacklist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details