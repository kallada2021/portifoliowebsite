variable "aws-region" {
    type = string 
    description = "Region where the AMI is made."
}

variable "aws-profile" {
    type = string 
    description = "AWS profile to use"
}

variable "db-secret" {
    type = string 
    description = "DB Secret Name"
}

variable "aws-accesskey" {
    type = string 
    description = "AWS Access Key"
}

variable "aws-secretkey" {
    type = string 
    description = "AWS Secret Key"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "portfolio" {
    ami_name = "portfolio-ec2-${local.timestamp}"
    profile = var.aws-profile
    instance_type = "t2.micro"
    region = var.aws-region 
    source_ami_filter {
        filters = {
            name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
            root-device-type = "ebs"
            virtualization-type = "hvm"
        }
        most_recent = true 
        owners = ["099720109477"]
    }
   
    ssh_username = "ubuntu"
}

build {
    sources = ["source.amazon-ebs.portfolio"]
    provisioner "shell" {
        environment_vars = [
            "REGION=${var.aws-region}",
            "ACCESSKEY=${var.aws-accesskey}",
            "SECRETKEY=${var.aws-secretkey}",
            "DB_SECRET=${var.db-secret}"
        ]
        script = "./install-docker.sh"
    }

    provisioner "file" {
        source = "./daemon.json"
        destination = "/tmp/daemon.json"
    }

    provisioner "shell" {
        script = "./move.sh"
    } 
}