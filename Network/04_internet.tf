resource "aws_internet_gateway" "saltware_ig" {
  vpc_id = aws_vpc.saltware_vpc.id
  tags = {
    "Name" = "IG"
  }
}