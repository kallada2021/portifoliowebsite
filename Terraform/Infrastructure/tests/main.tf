# Secret Manager 
resource "random_password" "dbpassword" {
  length  = 30
  special = false
}

resource "random_string" "djangokey" {
  length  = 30
  special = true
}

#Creating a AWS Secret for Portfolio db
resource "aws_secretsmanager_secret" "dbsecretmaster" {
  name = var.secret-name

  tags = {
    "Env" = "Production"
  }
}

resource "aws_secretsmanager_secret_version" "dbsecret" {
  secret_id     = aws_secretsmanager_secret.dbsecretmaster.id
  secret_string = <<EOF
    {
      "username": "admin1",
      "password": "${random_password.dbpassword.result}",
      "djangokey": "${random_string.djangokey.result}"
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

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Portifolio VPC"
  }
}

resource "aws_internet_gateway" "portfoliogw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PortfolioGateway"
  }
}


# Postgres RDS instance 
resource "aws_db_instance" "maindb" {
  identifier              = "main-db"
  db_name                 = var.db-name
  apply_immediately       = true
  allocated_storage       = 20    # disk space
  storage_type            = "gp2" # entry level general purpose
  engine                  = "postgres"
  engine_version          = "14.3"
  instance_class          = var.db-instance-type
#   db_subnet_group_name    = aws_db_subnet_group.db-main.name
  password                = var.dbpassword
  username                = var.dbusername
  backup_retention_period = var.backup-days
  multi_az                = false // TODO: true for production
  skip_final_snapshot     = true  //TODO:  false for production
#   vpc_security_group_ids  = [aws_security_group.rds-sg.id]
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
}

