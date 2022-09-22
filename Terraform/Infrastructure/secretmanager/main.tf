# Secret Manager 
resource "random_password" "dbpassword" {
  length  = 30
  special = false
}

#Create an AWS Secret for Portfolio db
resource "aws_secretsmanager_secret" "dbsecretmaster" {
  name = var.secret-name

  tags = {
    "Name" = "AppSecrets"
  }
}

resource "random_string" "djangokey" {
  length  = 35
  special = true
}

# aws secretsmanager delete-secret --secret-id your-secret-name --force-delete-without-recovery --region your-region
resource "aws_secretsmanager_secret_version" "dbsecret" {
  secret_id     = aws_secretsmanager_secret.dbsecretmaster.id
  secret_string = <<EOF
    {
      "POSTGRES_USERNAME": "admin1",
      "POSTGRES_PASSWORD": "${random_password.dbpassword.result}",
      "DJANGO_SECRET_KEY": "${random_string.djangokey.result}",
      "POSTGRES_DB" : "${var.db-name}"
    }
EOF
}

resource "aws_secretsmanager_secret_policy" "secret-policy" {
  secret_arn = aws_secretsmanager_secret.dbsecretmaster.arn
  policy     = <<POLICY
  {
					"Version": "2012-10-17",
					"Statement": [
						{
							"Sid": "EnableAllPermissions",
							"Effect": "Allow",
							"Principal": {
								"AWS": "*"
							},
							 "Action": [
                  "secretsmanager:DescribeSecret",
                  "secretsmanager:GetSecretValue",
                  "secretsmanager:ListSecrets"
              ],
							"Resource": "*"
						}
					]
				}
POLICY
  lifecycle {
    ignore_changes = [secret_arn, policy]
  }
}
