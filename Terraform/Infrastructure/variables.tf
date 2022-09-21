variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "secret-name" {
  type = string
}

# variable "aws-accesskey" {
#   type = string
# }

# variable "aws-secretkey" {
#   type = string
# }

variable "db-name" {
  type        = string
  description = "Database Name"
}

variable "ssl-policy" {
  type    = string
  default = "ELBSecurityPolicy-2016-08"
}

variable "certificate-arn" {
  type = string
}

variable "listener-type" {
  type    = string
  default = "forward"
}
