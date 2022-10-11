variable "vpc-id" {
  description = "VPC ID"
  type        = string
}

variable "private-subnets" {
  description = "Private Subnets Variable"
}

variable "subnet" {
  description = "Public Subnet for EC2 Instance"
  type        = string
}

variable "instance-type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "db-secret" {
  type        = string
  description = "Name of DB secret"
}
