# GCP project ID
project_id = "rearc-quest-425918"

# GCP region
region = "us-central1"

# VPC and subnet configuration
vpc_name    = "rearc-quest-vpc"
subnet_name = "quest-subnet"
subnet_cidr = "10.0.0.0/24"

# GKE cluster configuration
cluster_name       = "rearc-quest-cluster"
initial_node_count = 1
node_version       = "1.21.6-gke.1500"
min_master_version = "1.21.6-gke.1500"
machine_type       = "n1-standard-2"
disk_size_gb       = 50
image_type         = "COS_CONTAINERD"
oauth_scopes       = ["https://www.googleapis.com/auth/cloud-platform"]
node_labels        = { "environment" = "dev" }
node_tags          = ["quest-cluster"]
node_taints        = [{ key = "dedicated", value = "quest", effect = "NO_SCHEDULE" }]


# Cluster addons
http_load_balancing_disabled        = false
horizontal_pod_autoscaling_disabled = false
network_policy_disabled             = false

# Workload identity
workload_identity_namespace = "rearc-quest.svc.id.goog"

# Private cluster
enable_private_nodes    = true
enable_private_endpoint = false
master_ipv4_cidr_block  = "172.16.0.0/28"

# IP aliasing
enable_ip_alias               = true
cluster_secondary_range_name  = "pods"
services_secondary_range_name = "services"

# Other configurations
remove_default_node_pool       = true
enable_database_encryption     = false
cluster_resource_labels        = { "environment" = "dev" }
enable_vertical_pod_autoscaling = true
enable_legacy_abac             = false
enable_network_policy          = true
network_policy_provider        = "CALICO"
enable_shielded_nodes          = true
release_channel                = "REGULAR"
monitoring_service             = "monitoring.googleapis.com/kubernetes"
logging_service                = "logging.googleapis.com/kubernetes"

cloudrun_service_name = "my-service"
cloudrun_image_url    = "us-central1-docker.pkg.dev/rearc-quest-425918/rearc-quest/my-app:v1"