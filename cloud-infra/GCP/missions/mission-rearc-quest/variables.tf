variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
}

variable "region" {
  description = "The region to host the cluster in"
}

variable "initial_node_count" {
  description = "The number of nodes to initially create in the cluster"
}

variable "node_version" {
  description = "The Kubernetes version to use for the nodes. Defaults to the latest supported version."
  default     = ""
}

variable "min_master_version" {
  description = "The minimum Kubernetes version to use for the master. Defaults to the latest supported version."
  default     = ""
}

variable "machine_type" {
  description = "The machine type to use for the cluster nodes"
}

variable "disk_size_gb" {
  description = "The disk size (in GB) for each node in the cluster"
}

variable "image_type" {
  description = "The image type to use for the cluster nodes"
  default     = "COS"
}

variable "oauth_scopes" {
  description = "The OAuth scopes to be added to the cluster nodes"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]
}

variable "node_labels" {
  description = "The labels to be added to the cluster nodes"
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  description = "The network tags to be added to the cluster nodes"
  type        = list(string)
  default     = []
}

variable "node_taints" {
  description = "The taints to be added to the cluster nodes"
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}

variable "http_load_balancing_disabled" {
  description = "Whether to disable HTTP load balancing"
  type        = bool
  default     = false
}

variable "horizontal_pod_autoscaling_disabled" {
  description = "Whether to disable horizontal pod autoscaling"
  type        = bool
  default     = false
}

variable "network_policy_disabled" {
  description = "Whether to disable network policy"
  type        = bool
  default     = false
}

variable "issue_client_certificate" {
  description = "Whether to issue a client certificate"
  type        = bool
  default     = false
}

variable "workload_identity_namespace" {
  description = "The workload identity namespace"
  type        = string
  default     = ""
}

variable "enable_private_nodes" {
  description = "Whether to enable private nodes"
  type        = bool
  default     = false
}

variable "enable_private_endpoint" {
  description = "Whether to enable private endpoint"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The IPv4 CIDR block for the master network"
  type        = string
  default     = "172.16.0.0/28"
}

variable "enable_ip_alias" {
  description = "Whether to enable IP aliasing"
  type        = bool
  default     = false
}

variable "cluster_secondary_range_name" {
  description = "The name of the secondary range for the cluster"
  type        = string
  default     = ""
}

variable "services_secondary_range_name" {
  description = "The name of the secondary range for the services"
  type        = string
  default     = ""
}

variable "remove_default_node_pool" {
  description = "Whether to remove the default node pool"
  type        = bool
  default     = false
}

variable "enable_database_encryption" {
  description = "Whether to enable database encryption"
  type        = bool
  default     = false
}

variable "database_encryption_key_name" {
  description = "The name of the database encryption key"
  type        = string
  default     = ""
}

variable "cluster_resource_labels" {
  description = "The resource labels to be added to the cluster"
  type        = map(string)
  default     = {}
}

variable "enable_vertical_pod_autoscaling" {
  description = "Whether to enable vertical pod autoscaling"
  type        = bool
  default     = false
}

variable "enable_legacy_abac" {
  description = "Whether to enable legacy ABAC"
  type        = bool
  default     = false
}

variable "enable_network_policy" {
  description = "Whether to enable network policy"
  type        = bool
  default     = false
}

variable "network_policy_provider" {
  description = "The network policy provider"
  type        = string
  default     = "CALICO"
}

variable "enable_shielded_nodes" {
  description = "Whether to enable shielded nodes"
  type        = bool
  default     = false
}

variable "release_channel" {
  description = "The release channel for the cluster"
  type        = string
  default     = null
}

variable "monitoring_service" {
  description = "The monitoring service to be used"
  type        = string
  default     = null
}

variable "logging_service" {
  description = "The logging service to be used"
  type        = string
  default     = null
}

# VPC and subnet configuration (from stage000)
variable "vpc_name" {
  description = "The name of the VPC network created in stage000"
}

variable "subnet_name" {
  description = "The name of the subnet created in stage000"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet created in stage000"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "node_version" {
  description = "The version of the node pool"
  type        = string
}

variable "min_master_version" {
  description = "The minimum version of the master"
  type        = string
}

variable "image_type" {
  description = "The image type for the nodes"
  type        = string
}

variable "oauth_scopes" {
  description = "The OAuth scopes for the nodes"
  type        = list(string)
}

variable "node_labels" {
  description = "The labels for the nodes"
  type        = map(string)
}

variable "node_tags" {
  description = "The network tags for the nodes"
  type        = list(string)
}

variable "node_taints" {
  description = "The taints for the nodes"
  type        = list(object({
    key    = string
    value  = string
    effect = string
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "cloudrun_service_name" {
  description = "The name of the Cloud Run service"
}

variable "cloudrun_image_url" {
  description = "The URL of the Docker image to deploy"
}