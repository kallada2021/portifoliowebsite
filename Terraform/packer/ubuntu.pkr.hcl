variable "aws-region" {
  type    = string
  default = "us-east-1"
}

data "ubuntu-ami" "amazon-ubuntu" {
  filters = {
    name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
  region      = var.aws-region
}
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "amazon-ubuntu" {
  ami_name      = "ubuntu-${local.timestamp}"
  instance_type = "t2.micro"
  region                      = var.aws-region
  ami_virtualization_type     = "hvm"
  associate_public_ip_address = true
  force_delete_snapshot       = true
  source_ami                  = data.ubuntu-ami.amazon-ubuntu.id
  ssh_pty                     = "true"
  ssh_username                = "ubuntu"
  tags = {
    Created-by = "Packer"
    OS_Version = "Ubuntu"
    Release    = "Latest"
  }
}

build {
  name = "amazon ubuntu"
  sources = ["source.amazon-ebs.amazon-ubuntu"]

  provisioner "file" {
    destination = "/tmp"
    source      = "/files/"
  }

  provisioner "shell" {
    inline = [
      "echo installing updates",
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}

#TODO: Install Docker