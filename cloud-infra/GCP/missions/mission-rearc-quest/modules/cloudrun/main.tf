resource "google_cloud_run_service" "cloudrun_service" {
  name     = var.service_name
  location = var.region
  
  template {
    spec {
      containers {
        image = var.image_url
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = var.region
  project  = var.project_id
  service  = google_cloud_run_service.cloudrun_service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}