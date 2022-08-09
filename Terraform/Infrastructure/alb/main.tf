esource "aws_security_group" "portifolio-sg" {
  name        = "portifolio-sg"
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from NGINX"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_alb" "portifolio-alb"{
    name = "portfolio-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = []
    subnets = var.public-subnets
    enable_deletion_protection = false //true in prod
    tags = {
        Name = "portifolio-alb"
    }
}

