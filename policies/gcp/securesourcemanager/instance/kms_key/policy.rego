package terraform.gcp.security.securesourcemanager.instance.kms_key
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.instance.vars

attribute_path := "kms_key"
compliant_values := [
    "company-provided-key",
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)