# Secret Manager 
resource "random_password" "dbpassword" {
  length  = 30
  special = false
}

#Creating a AWS Secret for Portfolio db
resource "aws_secretsmanager_secret" "dbsecretmaster" {
  name = var.secret-name
}

resource "aws_secretsmanager_secret_version" "dbsecret" {
  secret_id     = aws_secretsmanager_secret.dbsecretmaster.id
  secret_string = <<EOF
    {
      "username": "admin",
      "password": "${random_password.dbpassword.result}"
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
