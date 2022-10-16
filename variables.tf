# General variables
variable "region" {
  description = "Terraform region"
  type        = string
  default     = "us-east-1"
}

variable "environment_name" {
  description = "Cloud environment name"
  type        = string
  default     = "cshlp"
}


# VPC variables
variable "cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "172.31.0.0/16"
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(any)
  default     = ["172.31.0.0/20", "172.31.16.0/20", "172.31.32.0/20"]
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(any)
  default     = ["172.31.64.0/20", "172.31.96.0/20", "172.31.128.0/20"]
}

# Database
variable "db_name" {
  description = "DB name"
  type        = string
  default     = "postgres"
}

variable "db_user" {
  description = "DB user name"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "DB user password"
  type        = string
  default     = "postgres"
}

