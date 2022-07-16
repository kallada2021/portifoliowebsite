# DB Subnets
resource "aws_db_subnet_group" "db-main" {
  name       = "main-rds-db-subnets"
  subnet_ids = [var.private-subnets[0].id, var.private-subnets[1].id]
}

# Postgres RDS instance 
resource "aws_db_instance" "main-db" {
  identifier        = "main-db"
  db_name           = var.db-name
  storage_encrypted = true
  kms_key_id        = aws_kms_key.kms-key.arn //TODO: Add KMS key resoure
  apply_immediately = true

  allocated_storage       = 20    # disk space
  storage_type            = "gp2" # entry level general purpose
  engine                  = "postgres"
  engine_version          = "13.1"
  instance_class          = var.db-instance-type //TODO: decide instance type
  db_subnet_group_name    = aws_db_subnet_group.db-main.name
  password                = var.db-password
  username                = var.db-username
  backup_retention_period = var.backup-days # backup days
  multi_az                = false           // true for production
  skip_final_snapshot     = true            // false for production
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

  tags = var.common-tags
}
