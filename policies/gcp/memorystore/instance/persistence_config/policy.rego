package terraform.gcp.memorystore.instance.persistence_config

import data.terraform.gcp.helpers

default allow = false

# 允许规则：所有 Redis 实例的 persistence_config.persistence_mode 必须为 "RDB"
allow {
    some resource
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    resource_values.persistence_config.persistence_mode == "RDB"
}

# 违规规则：persistence_mode 未设置为 RDB
violation[res] {
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    not resource_values.persistence_config.persistence_mode == "RDB"
    res := {
        "msg": sprintf("Redis 实例 '%v' 的 persistence_mode 未设置为 RDB，而是: %v", [resource.name, resource_values.persistence_config.persistence_mode])
    }
}
