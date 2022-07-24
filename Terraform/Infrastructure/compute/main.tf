
resource "aws_security_group" "ec2-sg" {
  description = "Control ec2 inbound and outbound access"
  name        = "Portfolio EC2 Security Group"
  vpc_id      = var.vpc-id

  # ssh 
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https out
  egress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  # standard http
  egress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = var.private-subnets

  }
}

// Provisioning ec2
resource "aws_instance" "webserver" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = var.subnet

  tags = {
    Name = "PortfolioWebServer"
  }
}
