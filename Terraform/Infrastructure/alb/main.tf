resource "aws_security_group" "portfolio-sg" {
  name        = "portfolio-sg"
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description = "HTTP from ALB"
    from_port   = var.http-port
    to_port     = var.http-port
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
    Name = "allow-tls"
  }
}

resource "aws_lb" "portfolio-alb" {
  name                       = "portfolio-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.portfolio-sg.id]
  subnets                    = var.public-subnets
  enable_deletion_protection = false //TODO: true in prod
  tags = {
    Name = "portifolio-alb"
  }
}

resource "aws_lb_target_group" "portfolio-alb-tg" {
  name     = "portfolio-tg"
  port     = local.server-port
  protocol = local.http-protocol
  vpc_id   = var.vpc-id
  //target_type = "ip"

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }

  health_check {
    path = "/" # checks application to see if it is running
  }
}

# entry point
resource "aws_lb_listener" "http-listener" {
  load_balancer_arn = aws_lb.portfolio-alb.arn
  port              = local.http-port
  protocol          = local.http-protocol

  //production
  default_action {
    type = "redirect"

    redirect {
      port        = local.https-port
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  depends_on = [aws_lb.portfolio-alb, aws_lb_target_group.portfolio-alb-tg]
  tags = {
    Name = "http-listener"
  }
}

resource "aws_lb_listener" "portfolio-listener" {
  load_balancer_arn = aws_lb.portfolio-alb.arn
  port              = local.https-port
  protocol          = local.https-protocol
  ssl_policy        = var.ssl-policy
  certificate_arn   = var.certificate-arn
  default_action {
    type             = var.listener-type
    target_group_arn = aws_lb_target_group.portfolio-alb-tg.arn
  }
  depends_on = [aws_lb.portfolio-alb, aws_lb_target_group.portfolio-alb-tg]
  tags = {
    Name = "https-listener"
  }
}

resource "aws_lb_target_group_attachment" "server-tg-attach" {
  target_group_arn = aws_lb_target_group.portfolio-alb-tg.arn
  target_id        = var.ec2-id
  port             = local.server-port
}
