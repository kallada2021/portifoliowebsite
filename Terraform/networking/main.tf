resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "Portifolio VPC"
    }
}


resource "aws_subnet" "PublicSubnet" {
    count = 2
    vpc_id = aws_vpc.main.id
    cidr_block = var.puclic_cidr_blocks[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name = "Portifolio Public Subnet.${count.index}"
    }
}

resource "aws_subnet" "PrivateSubnet" {
    count = 2
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_cidr_blocks[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index + 2]
    map_public_ip_on_launch = false

    tags = {
        Name = "Portifolio Private Subnet.${count.index}"
    }
}

resource "aws_internet_gateway" "PortifolioGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PortifolioGateway"
  }
}

resource "aws_security_group" "PortifolioAllowTls" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "PortifolioAllowSshSecurityGroup"
  }
}
