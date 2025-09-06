package gcp.memorystore

import future.keywords.if
import future.keywords.contains

default gcs_violations := set()

# 检查 'correct' 实例的内存大小是否至少为2GB
violation["Correct instance must have at least 2GB memory"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "correct"
    res.type == "google_memorystore_instance"
    res.values.memory_size_gb < 2
}

# 检查 'wrong' 实例的内存大小是否小于2GB（预期违规）
violation["Wrong instance must have at least 2GB memory"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "wrong"
    res.type == "google_memorystore_instance"
    res.values.memory_size_gb < 2
}

# 检查 'correct' 实例的区域是否为us-central1
violation["Correct instance must be in us-central1 region"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "correct"
    res.type == "google_memorystore_instance"
    res.values.region != "us-central1"
}

# 检查 'wrong' 实例的区域是否不是us-central1（预期违规）
violation["Wrong instance must not be in us-central1 region"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "wrong"
    res.type == "google_memorystore_instance"
    res.values.region == "us-central1"
}

# 检查 'correct' 实例的Redis版本是否为6.X或更高
violation["Correct instance must use Redis 6 or higher"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "correct"
    res.type == "google_memorystore_instance"
    res.values.redis_version < "REDIS_6_X"
}

# 检查 'wrong' 实例的Redis版本是否低于6（预期违规）
violation["Wrong instance must use Redis 6 or higher"] if {
    res := input.planned_values.root_module.resources[_]
    res.name == "wrong"
    res.type == "google_memorystore_instance"
    res.values.redis_version < "REDIS_6_X"
}