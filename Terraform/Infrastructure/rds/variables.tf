variable "private-subnets" {
  description = "Private subnets used for database"
  default = ["subnet-0dcc8af05ee6d91a2", "subnet-0705402fd58f87ab4"]
}

variable "vpc-id" {
  type        = string
  description = "VPC Id"
  default = "vpc-0e39bd885fa6fd4ca"
}

variable "db-name" {
  type        = string
  description = "Database Name"
  default     = "testdb"
}

variable "dbusername" {
  type        = string
  description = "Database User"
  default = "admin123"
}

variable "dbpassword" {
  type        = string
  description = "Database password"
  default = "Mysecurepassword1"
}

variable "db-instance-type" {
  description = "DB Instance type"
  default     = "db.t3.micro" // TODOS change size based on growth
}

variable "backup-days" {
  type        = number
  description = "Backdays for rds instance"
  default = 30
}
