provider "kubernetes" {
  # Use the 'kubeconfig' output from the 'gke-cluster' module to configure the Kubernetes provider
  config_path = var.kubeconfig_path
}

variable "kubeconfig_path" {
  description = "The path to the kubeconfig file for accessing the GKE cluster"
  type        = string
}