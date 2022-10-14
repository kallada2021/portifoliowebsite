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
  policy_arn = aws_iam_policy.ec2-policy.arn
}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "PortfolioAPI-EC2-Profile"
  role = aws_iam_role.ec2-role.name
}

resource "aws_iam_policy" "ec2-policy" {
  name        = "EC2Policy"
  path        = "/"
  description = "Policy to grant permission to EC2 instances"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:ListTagsForResource",
          "ecr:DescribeImageScanFindings",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage",
          "autoscaling:Describe*",
          "cloudwatch:*",
          "logs:*",
          "sns:*",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iam:CreateServiceLinkedRole",
        "Resource" : "arn:aws:iam::*:role/aws-service-role/events.amazonaws.com/AWSServiceRoleForCloudWatchEvents*",
        "Condition" : {
          "StringLike" : {
            "iam:AWSServiceName" : "events.amazonaws.com"
          }
        }
      },
      {
        "Sid" : "GrantECRAuthAccess",
        "Effect" : "Allow",
        "Action" : "ecr:GetAuthorizationToken",
        "Resource" : "*"
      }
    ]
  })
}

// Provision ec2
resource "aws_instance" "webserver" {
  ami                    = "ami-0c939d61cecdb617b"
  instance_type          = var.instance-type
  iam_instance_profile   = aws_iam_instance_profile.ec2-profile.name
  key_name               = "portfolioec2user"
  subnet_id              = var.subnet
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  user_data              = filebase64("${path.module}/run-docker.sh")

  associate_public_ip_address = true

  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_size           = 30
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "PortfolioWebServer"
  }
}

resource "aws_cloudwatch_log_group" "portfolio-loggroup" {
  name              = "portfolio-ec2-loggroup"
  retention_in_days = 30
  tags = {
    Environment = "production"
    Application = "portfoliowebsite"
  }
}

resource "aws_cloudwatch_log_stream" "portfolio-logstream" {
  name           = "Django-Logstream"
  log_group_name = aws_cloudwatch_log_group.portfolio-loggroup.name
}
