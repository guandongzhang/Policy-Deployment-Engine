data "google_iam_policy" "access" {
  binding {
    role = "roles/securesourcemanager.instanceAccessor"
    members = [
    ]
  }
}

resource "google_secure_source_manager_instance_iam_policy" "c" {
  project = "policy-deployment"
  location = "australia-southeast2-a"
  instance_id = "testgcp-iam-policy-access-c"
  policy_data = data.google_iam_policy.access.policy_data
}