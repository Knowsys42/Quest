variable "environment" {}

variable "vpc-id" {}
variable "vpc-cidr-block" {}

variable "public-subnet-id" {}

variable "public2-subnet-id" {}

variable "private-subnet-id" {}



variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}