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

variable "ssl_policy" {
    type = string
    default = "ELBSecurityPolicy-2016-08"
}

variable "certificate_arn" {
    type = string
}

variable "listener_type" {
    type = string
    default = "forward"
}