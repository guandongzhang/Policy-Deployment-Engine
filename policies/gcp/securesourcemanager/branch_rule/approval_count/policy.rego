package terraform.gcp.security.securesourcemanager.branch_rule.approval_count
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.branch_rule.vars

conditions := [
    [
    {"situation_description" : "Enforce a minimum number of approvals",
    "remedies":[ "Have at least 3 people approve requests"]},
    {
        "condition": "Checks if there is a min number of approvals to merge branch",
        "attribute_path" : ["minimum_approvals_count"],
        "values" : [3,null],
        "policy_type" : "range" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details