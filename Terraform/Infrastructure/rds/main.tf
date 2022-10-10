# output "dbusername" {
#   value     = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["POSTGRES_USERNAME"]
#   sensitive = true
# }

# output "dbpassword" {
#   value     = jsondecode(aws_secretsmanager_secret_version.dbsecret.secret_string)["POSTGRES_PASSWORD"]
#   sensitive = true
# }

# DB Subnets
resource "aws_db_subnet_group" "db-main" {
  name       = "main-rds-db-subnets"
  subnet_ids = [var.private-subnets[0], var.private-subnets[1]]
}

# Postgres RDS instance 
resource "aws_db_instance" "main-db" {
  identifier              = "main-db"
  db_name                 = var.db-name
  storage_encrypted       = true
  kms_key_id              = aws_kms_key.portfoliodbkey.arn
  apply_immediately       = true
  allocated_storage       = 20    # disk space
  storage_type            = "gp2" # entry level general purpose
  engine                  = "postgres"
  engine_version          = "14.3"
  instance_class          = var.db-instance-type
  db_subnet_group_name    = aws_db_subnet_group.db-main.name
  password                = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["POSTGRES_USERNAME"]
  username                = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["POSTGRES_USERNAME"]
  backup_retention_period = var.backup-days
  multi_az                = false // TODO: true for production
  skip_final_snapshot     = true  //TODO:  false for production
  vpc_security_group_ids  = [aws_security_group.rds-sg.id]
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
}


# RDS Security Group
resource "aws_security_group" "rds-sg" {
  description = "Allow access to the RDS DB"
  name        = "rds-inbound-access"
  vpc_id      = var.vpc-id

  ingress {
    protocol  = "tcp"
    from_port = 5432
    to_port   = 5432
  }
}

#Added Glacier resource for archiving
/* resource "aws_glacier_vault" "portfoliodb-archive" {
  name          = "portfoliodb-archive"
  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "${aws_glacier_vault.portfoliodb-archive.arn}"
       }
    ]
}
EOF

  tags = {
    Name = "portfoliodb-archive"
  }
} */
