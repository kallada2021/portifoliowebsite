resource "aws_security_group" "ec2-sg" {
  description = "Control ec2 inbound and outbound access"
  name        = "Portfolio EC2 Security Group"
  vpc_id      = var.vpc-id
  # ssh 

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All open
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Role for EC2
resource "aws_iam_role" "ec2-role" {
  name = "EC2Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Effect" : "Allow"
      }
    ]
  })
}

# Policy attachment
resource "aws_iam_policy_attachment" "ec2-policy-role" {
  name       = "EC2-PolicyAttachment"
  roles      = [aws_iam_role.ec2-role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ProtfolioAPI-EC2-Profile"
  role = aws_iam_role.ec2-role.name
}

// Provision ec2
resource "aws_instance" "webserver" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.sshkey.id
  subnet_id                   = var.subnet
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  user_data                   = filebase64("${path.module}/docker-userdata.sh")
  associate_public_ip_address = true

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

