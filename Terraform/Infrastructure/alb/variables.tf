variable "public-subnets" {
  type = list(string)
}

variable "vpc-id" {
  type = string
}

variable "http-port" {
  type    = number
  default = 80
}

variable "http-protocol" {
  type    = string
  default = "HTTP"
}

variable "https-port" {
  type    = number
  default = 443
}

variable "https-protocol" {
  type    = string
  default = "HTTPS"
}

variable "ssl-policy" {
  type = string
}

variable "certificate-arn" {
  type = string
}

variable "listener-type" {
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
  default     = "magnoliaitsolutionsgroup.com"
}

variable "server-port" {
  type = number
  description = "Nginx port for web server"
  default = 8080
}
