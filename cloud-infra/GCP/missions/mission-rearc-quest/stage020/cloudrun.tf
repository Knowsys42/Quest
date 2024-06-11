provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "service" {
  name     = "my-cloud-run-service"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/my-project/my-image"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

output "cloud_run_url" {
  value = google_cloud_run_service.service.status[0].url
}