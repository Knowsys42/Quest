# stage010/gke-cluster/terraform.tf

terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }

  backend "gcs" {
    bucket = "questtfstate"
    prefix = "stage010/gke-cluster"
  }
}