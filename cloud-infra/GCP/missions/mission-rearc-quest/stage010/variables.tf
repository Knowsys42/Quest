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

variable "machine_type" {
  description = "The machine type to use for the cluster nodes"
}

variable "disk_size_gb" {
  description = "The disk size (in GB) for each node in the cluster"
}

variable "vpc_id" {
  description = "The ID of the VPC network created in stage000"
}

variable "subnet_id" {
  description = "The ID of the subnet created in stage000"
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
