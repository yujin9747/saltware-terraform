resource "aws_route_table" "saltware_rt" {
  vpc_id = aws_vpc.saltware_vpc.id
  # 0.0.0.0/0은 모두 saltware_ig를 통해서 나간다
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.saltware_ig.id
  }
  tags = {
    "Name" = "saltware-rt"
  }
}