package terraform.gcp.memorystore.instance.authorization_mode

import data.terraform.gcp.helpers

default allow = false

# 允许规则：所有 Redis 实例的 AUTH 认证模式必须为 "AUTH_MODE_IAM_AUTH"（如有该属性）
allow {
    some resource
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    
} {
    some resource
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    resource_values.authorization_mode == "AUTH_MODE_IAM_AUTH"
}

# 违规规则：authorization_mode 存在且不为 AUTH_MODE_IAM_AUTH
violation[res] {
    resources := helpers.get_all_resources("google_redis_instance")
    resource := resources[_]
    resource_values := resource.values
    resource_values.authorization_mode
    resource_values.authorization_mode != "AUTH_MODE_IAM_AUTH"
    res := {
        "msg": sprintf("Redis 实例 '%v' 的 authorization_mode 未设置为 AUTH_MODE_IAM_AUTH，而是: %v", [resource.name, resource_values.authorization_mode])
    }
}
