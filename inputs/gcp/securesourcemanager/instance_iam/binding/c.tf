variable "iam_role" {
  default = "roles/secureSourceManager.instanceAccessor"
}

variable "project_id" {
  default = "policy-deployment"
}

variable "region" {
  default = "australia-southeast2"
}

variable "zone" {
  default = "australia-southeast2-a"
}

resource "google_secure_source_manager_instance_iam_binding" "c" {
  project     = var.project_id
  location    = var.region 
  instance_id = "testgcp-secure-source-manager-iam-binding-view-c"

  role    = var.iam_role
  members = ["domain:deakin.edu.au"]
}