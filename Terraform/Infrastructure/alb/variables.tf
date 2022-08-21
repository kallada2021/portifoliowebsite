variable "public-subnets" {
  type = list(string)
}

variable "vpc-id" {
  type = string
}

variable "http_port" {
  type    = number
  default = 80
}

variable "http_protocol" {
  type    = string
  default = "HTTP"
}

variable "https_port" {
  type    = number
  default = 443
}

variable "https_protocol" {
  type    = string
  default = "HTTPS"
}

variable "ssl_policy" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "listener_type" {
  type = string
  default = "forward"
}

variable "ec2-id" {
  type        = string
  description = "EC2 instance id"
}

variable "domain-name" {
  type        = string
  description = "Domain Name"
  default     = "magnoliaitsolutionsgroup.com."
}

variable "server-port" {
  type = number
  description = "Nginx port for web server"
  default = 8080
}
