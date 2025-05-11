package terraform.gcp.security.securesourcemanager.branch_rule.comments
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.branch_rule.vars

conditions := [
    [
    {"situation_description" : "Enforce a rule to require comments resolved before merging to the branch",
    "remedies":[ "Have this enabled for the branch before merge"]},
    {
        "condition": "Checks if there is a requirement for the comments to be resolved before merging",
        "attribute_path" : ["require_comments_resolved"],
        "values" : [true],
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details