variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "log_retention_days" {
  description = "The number of days to retain logs"
  type        = number
  default     = 30
}