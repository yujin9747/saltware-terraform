#natgateway 에서 사용할 eip 주소를 생성한다
resource "aws_eip" "saltware_natip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "saltware_NAT" {
  allocation_id = aws_eip.saltware_natip.id
  subnet_id     = aws_subnet.saltware_weba.id
  tags = {
    "Name" = "saltware-natgate"
  }
  depends_on = [
    aws_internet_gateway.saltware_ig
  ]
}