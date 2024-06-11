data "google_container_engine_versions" "supported" {
  location = var.region
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location = var.region
  initial_node_count = var.initial_node_count
  node_version       = data.google_container_engine_versions.supported.latest_node_version
  min_master_version = data.google_container_engine_versions.supported.latest_master_version

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }

  network    = var.vpc_id
  subnetwork = var.subnet_id

  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }

  depends_on = [var.vpc_id, var.subnet_id]
}