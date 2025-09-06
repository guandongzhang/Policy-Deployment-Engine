package terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.missing_labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_instance.vars

conditions := [
    [
    {
        "situation_description": "Workforce Identity Federation is enabled, but the 'owner' label is missing",
        "remedies": [
        "Add a label like owner = 'security-team' to indicate who manages the instance",
        "Ensure ownership is clearly defined when allowing external identity access"
        ]
    },
    {
        "condition": "Federated identity is enabled",
        "attribute_path": ["workforce_identity_federation_config",0, "enabled"],
        "values": [true],
        "policy_type": "blacklist"
    },
    {
        "condition": "Missing 'owner' label",
        "attribute_path": ["labels",0, "owner"],
        "values": ["",null],
        "policy_type": "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
