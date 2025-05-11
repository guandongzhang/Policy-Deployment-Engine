resource "google_secure_source_manager_instance_iam_binding" "nc" {
  project     = var.project_id
  location    = var.region 
  instance_id = "testgcp-secure-source-manager-iam-binding-view-nc"

  role    = "roles/secureSourceManager.instanceOwner"
  members = ["domain:google.com"]
}