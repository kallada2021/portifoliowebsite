variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "db-name" {
  type        = string
  description = "Database Name"
}

variable "db-username" {
  type        = string
  description = "Username for RDS postgres DB"
}

variable "db-password" {
  description = "Password for RDS postgres DB"
}
