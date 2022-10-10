data "aws_secretsmanager_secret" "db-secret" {
  name = var.db-secret
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.db-secret.id
}
