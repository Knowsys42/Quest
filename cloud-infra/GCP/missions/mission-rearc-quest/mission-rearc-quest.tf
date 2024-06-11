# Set the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create the VPC network
module "vpc" {
  source = "../modules/vpc"

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region  = var.region
}

# Create the GKE cluster
module "gke_cluster" {
  source = "../modules/gke-cluster"
  project_id         = var.project_id
  cluster_name       = var.cluster_name
  region             = var.region
  initial_node_count = var.initial_node_count
  node_version       = var.node_version
  min_master_version = var.min_master_version
  machine_type       = var.machine_type
  disk_size_gb       = var.disk_size_gb
  image_type         = var.image_type
  oauth_scopes       = var.oauth_scopes
  node_labels        = var.node_labels
  node_tags          = var.node_tags
  node_taints        = var.node_taints
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.vpc.subnet_id
}

module "cloudrun" {
  source = "../modules/cloudrun"

  project_id   = var.project_id
  region       = var.region
  service_name = var.cloudrun_service_name
  image_url    = var.cloudrun_image_url
}
/*
# Create the Kubernetes service account
module "kubernetes_rbac" {
  source = "../modules/k8s-rbac"

  service_account_name = var.service_account_name
}

# Set up logging for the GKE cluster
module "logging" {
  source = "../modules/logging"

  project_id          = var.project_id
  log_retention_days  = var.log_retention_days
}

# Set up monitoring for the GKE cluster
module "monitoring" {
  source = "../modules/monitoring"

  notification_email = var.notification_email
}
*/