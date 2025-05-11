data "google_iam_policy" "admin" {
  binding {
    role = "roles/securesourcemanager.instanceOwner"
    members = [
    ]
  }
}

resource "google_secure_source_manager_instance_iam_policy" "nc" {
  project = "policy-deployment"
  location = "australia-southeast2-a"
  instance_id = "testgcp-iam-policy-access-nc"
  policy_data = data.google_iam_policy.admin.policy_data
}