data "google_client_config" "default" {}

data "google_container_engine_versions" "supported" {
  location = var.region
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = var.initial_node_count
  node_version       = var.node_version != "" ? var.node_version : data.google_container_engine_versions.supported.latest_node_version
  min_master_version = var.min_master_version != "" ? var.min_master_version : data.google_container_engine_versions.supported.latest_master_version

  network    = var.vpc_id
  subnetwork = var.subnet_id

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    image_type   = var.image_type

    oauth_scopes = var.oauth_scopes

    labels = var.node_labels

    tags = var.node_tags

    dynamic "taint" {
      for_each = var.node_taints
      content {
        key    = taint.value.key
        value  = taint.value.value
        effect = taint.value.effect
      }
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
    }

    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling_disabled
    }

    network_policy_config {
      disabled = var.network_policy_disabled
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = var.issue_client_certificate
    }
  }



  dynamic "private_cluster_config" {
    for_each = var.enable_private_nodes ? [1] : []
    content {
      enable_private_nodes    = var.enable_private_nodes
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }

  dynamic "ip_allocation_policy" {
    for_each = var.enable_ip_alias ? [1] : []
    content {
      cluster_secondary_range_name  = var.cluster_secondary_range_name
      services_secondary_range_name = var.services_secondary_range_name
    }
  }

  remove_default_node_pool = var.remove_default_node_pool

  dynamic "database_encryption" {
    for_each = var.enable_database_encryption ? [1] : []
    content {
      state    = "ENCRYPTED"
      key_name = var.database_encryption_key_name
    }
  }

  resource_labels = var.cluster_resource_labels

  vertical_pod_autoscaling {
    enabled = var.enable_vertical_pod_autoscaling
  }

  enable_legacy_abac = var.enable_legacy_abac

  network_policy {
    enabled  = var.enable_network_policy
    provider = var.network_policy_provider
  }

  enable_shielded_nodes = var.enable_shielded_nodes

  dynamic "release_channel" {
    for_each = var.release_channel != null ? [1] : []
    content {
      channel = var.release_channel
    }
  }

}