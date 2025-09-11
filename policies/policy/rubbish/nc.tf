resource "google_redis_instance" "wrong" {
  name           = "wrong"
  tier           = "BASIC"
  memory_size_gb = 1  # 小于 2GB，不合规
  region         = ""  # 未指定 region，不合规
  redis_version  = "REDIS_5_X"  # Redis 版本低于 6，不合规
}