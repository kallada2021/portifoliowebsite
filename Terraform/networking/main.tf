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
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

   ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
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

resource "aws_route_table" "portifolio-public-rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "portifolio-public-rt"
  }
}

resource "aws_route" "portifolio-public-route" {
  route_table_id         = aws_route_table.portifolio-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.PortifolioGW.id
}

resource "aws_route_table_association" "portifolio-rt-assoc" {
  count = 2
  subnet_id      = aws_subnet.PublicSubnet[count.index].id
  route_table_id = aws_route_table.portifolio-public-rt.id
}

/* resource "aws_nat_gateway" "portifolio-nat-gateway" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
} */

