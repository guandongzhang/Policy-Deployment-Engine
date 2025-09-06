resource "google_redis_instance" "correct" {
  name           = "correct"
  tier           = "BASIC"
  memory_size_gb = 2  
  region         = "us-central1"
  redis_version  = "REDIS_6_X"
  authorized_network = "default"
  persistence_config {
    rdb_snapshot_period = "TWENTY_FOUR_HOURS"
  }
}
