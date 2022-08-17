esource "aws_security_group" "portfolio-sg" {
  name        = "portfolio-sg"
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description = "HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS from NGINX"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_lb" "portfolio-alb" {
  name                       = "portfolio-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.portfolio-sg.id]
  subnets                    = var.public-subnets
  enable_deletion_protection = false //true in prod
  tags = {
    Name = "portifolio-alb"
  }
}

resource "aws_lb_target_group" "portfolio-alb-tg" {
  name = "portfolio-tg"
  port = local.http_port
  protocol = local.http_protocol
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "portfolio-listener" {
  load_balancer_arn = aws_lb.portfolio-alb.arn
  port = local.https_port
  protocol = local.https_protocol
  ssl_policy = var.ssl_policy
  certificate_arn = var.certificate_arn
  default_action {
    type = var.listener_type
    target_group_arn = aws_lb_target_group.portfolio-alb-tg.arn
  }
  depends_on = [aws_lb.portfolio-alb, aws_lb_target_group.portfolio-alb-tg]
  tags = {
    Name = "https-listener"
  }
}