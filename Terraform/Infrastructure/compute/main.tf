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
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// Provision ec2
resource "aws_instance" "webserver" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = var.instance-type
  key_name      = aws_key_pair.sshkey.id
  subnet_id     = var.subnet

  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_size           = 30
    volume_type           = "gp2"
    delete_on_termination = false
  }
  tags = {
    Name = "PortfolioWebServer"
  }
}

resource "aws_key_pair" "sshkey" {
  key_name   = "portfolio-key"
  public_key = file("${path.module}/keypair/portfolio-key.pub")
}

resource "aws_cloudwatch_log_group" "portifolio-loggroup" {
  name              = "portifolio-ec2-loggroup"
  retention_in_days = 30
  tags = {
    Environment = "production"
    Application = "portifoliowebsite"
  }
}

