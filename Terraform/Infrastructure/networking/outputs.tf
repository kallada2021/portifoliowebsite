output "vpc-id" {
  value = aws_vpc.main.id
}

output "private-subnets" {
  value = aws_subnet.PrivateSubnet.*.id
}

output "PublicSubnet" {
  value = aws_subnet.PublicSubnet.*.id
}
