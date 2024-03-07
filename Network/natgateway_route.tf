resource "aws_route_table" "saltware_natrt" {
  vpc_id = aws_vpc.saltware_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.saltware_NAT.id
  }
  tags = {
    "Name" = "saltware-natrt"
  }
}