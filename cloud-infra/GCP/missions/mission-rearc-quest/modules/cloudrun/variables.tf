variable "project_id" {
  description = "The project ID"
}

variable "region" {
  description = "The region where the Cloud Run service will be deployed"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
}

variable "image_url" {
  description = "The URL of the Docker image to deploy"
}