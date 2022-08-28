/* output "dbusername" {
    value = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["username"]
    sensitive = true
}

output "dbpassword" {
    value = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["password"]
    sensitive = true
} */
