variable "aws-region" {
    type = string 
    description = "Region where the AMI is made."
}

/* variable "image-tag" {
    type = string 
    description = "Tag for the docker image."
} */

variable "docker-username" {
    type = string 
    description = "Docker Username"
}

variable "ecr-repo" {
    type = string 
    description = "ECR Repo name"
}

variable "account-id" {
    type = string 
    description = "AccountID"
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
  timestamp = regex_replace(timestamp(), "[- TZ]", "")
}

source "amazon-ebs" "portfolio" {
    #ami_name = "portfolio-ec2-${local.timestamp}"
    ami_name = "portfolio-ec2"
    instance_type = "t2.micro"
    region = var.aws-region 
     /* assume_role {
        role_arn     = "arn:aws:iam::454005374858:instance-profile/ProtfolioAPI-EC2-Profile"
        session_name = "Portfolio-Session"        
    } */
    source_ami_filter {
        filters = {
            name = "amzn2-ami-kernel-5.10-hvm-*"
            # name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
            root-device-type = "ebs"
            virtualization-type = "hvm"
        }
        most_recent = true 
        //owners = ["099720109477"]
        owners = ["amazon"]
    }
    ssh_username = "ec2-user"
}

build {
    sources = ["source.amazon-ebs.portfolio"]

    provisioner "shell" {
        environment_vars = [
            "USERNAME=${var.docker-username}",
            "REGION=${var.aws-region}",
            "ECRREPO=${var.ecr-repo}",
            "ACCESSKEY=${var.aws-accesskey}",
            "SECRETKEY=${var.aws-secretkey}",
            "ACCOUNTID=${var.account-id}"
            # "ECR_REGISTRY=${var.ecr-registry}",
            # "IMAGE_TAG=${var.image-tag}"
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