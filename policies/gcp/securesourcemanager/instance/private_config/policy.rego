package terraform.gcp.security.securesourcemanager.instance.private_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.securesourcemanager.instance.vars

attribute_path := ["private_config", 0, "is_private"]
compliant_values := true

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)