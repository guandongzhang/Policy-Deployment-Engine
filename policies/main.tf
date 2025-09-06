terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

#offline mode
provider "google" {
  project     = "test-offline"
  region      = "australia-southeast1"
         
}

variable "memory_size_gb" { default = 2 }
variable "region"         { default = "us-central1" }
variable "redis_version"  { default = "REDIS_6_X" }

resource "google_redis_instance" "test" {
  name           = "test"
  tier           = "BASIC"
  memory_size_gb = var.memory_size_gb
  region         = var.region
  redis_version  = var.redis_version
}