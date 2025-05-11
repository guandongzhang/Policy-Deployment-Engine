package terraform.gcp.security.securesourcemanager.repository.description
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.repository.vars

conditions := [
    [
        {
            "situation_description": "The repository description must be present",
            "remedies": [
                "Expand the 'description' field to include a few words."
            ]
        },
        {
            "condition": "Checks that the 'description' is present.",
            "attribute_path": ["description"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details