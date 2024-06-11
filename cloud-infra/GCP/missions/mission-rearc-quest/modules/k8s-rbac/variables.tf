variable "namespace" {
  description = "The namespace in which to create the RBAC resources"
  type        = string
  default     = "default"
}

variable "service_account_name" {
  description = "The name of the service account to create"
  type        = string
  default     = "quest-service-account"
}

variable "role_name" {
  description = "The name of the role to create"
  type        = string
  default     = "quest-role"
}