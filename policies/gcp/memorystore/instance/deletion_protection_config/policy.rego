package terraform.gcp.memorystore.instance.deletion_protection_config

import data.terraform.gcp.helpers

default allow = false

# 允许规则：所有 Redis 实例的 deletion_protection_config.enable_deletion_protection 必须为 true
allow {
    some resource
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    resource_values.deletion_protection_config.enable_deletion_protection == true
}

# 违规规则：deletion_protection_config 未开启
violation[res] {
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    not resource_values.deletion_protection_config.enable_deletion_protection == true
    res := {
        "msg": sprintf("Redis 实例 '%v' 未开启 deletion_protection_config.enable_deletion_protection", [resource.name])
    }
}
