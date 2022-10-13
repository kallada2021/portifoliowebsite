variable "secret-name" {
  type = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws-accesskey" {
  type = string
}

variable "aws-secretkey" {
  type = string
}

variable "db-name" {
  type        = string
  description = "Database Name"
}

variable "db-host" {
  type = string
}