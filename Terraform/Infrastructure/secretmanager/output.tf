output "dbusername" {
  value     = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["POSTGRES_USERNAME"]
  sensitive = true
}

output "dbpassword" {
  value     = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["POSTGRES_PASSWORD"]
  sensitive = true
}
