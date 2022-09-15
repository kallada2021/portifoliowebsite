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

variable "secret-name" {
  type    = string
  default = "AppSecrets"
}