# main.tf
variable "memorystore_name"   { type = string }
variable "location"      { type = string }
variable "storage_class" { type = string }

resource "policy_memorystore" "b" {
  name          = var.memorystore_name
  location      = var.location
  storage_class = var.storage_class

  uniform_bucket_level_access = true
  encryption {
    default_kms_key_name = var.kms_key
  }
}