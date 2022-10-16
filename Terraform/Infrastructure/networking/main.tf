resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Portifolio VPC"
  }
}

resource "aws_subnet" "public-subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr_blocks[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Portifolio Public Subnet-${count.index}"
  }
}

resource "aws_subnet" "private-subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr_blocks[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index + 2]
  map_public_ip_on_launch = false

  tags = {
    Name = "Portfolio Private Subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "portfolio-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PortfolioGateway"
  }
}

resource "aws_route_table" "portfolio-public-rt" {
  count  = 2
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "portifolio-public-rt"
  }
}

resource "aws_route" "portfolio-public-route" {
  depends_on = [
    aws_internet_gateway.portfolio-gw
  ]
  count                  = 2
  route_table_id         = aws_route_table.portfolio-public-rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.portfolio-gw.id
}

resource "aws_route_table_association" "portfolio-rt-assoc" {
  count          = 2
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.portfolio-public-rt[count.index].id
}
