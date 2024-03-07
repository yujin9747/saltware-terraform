resource "aws_route_table_association" "saltware_rtass_a" {
  subnet_id      = aws_subnet.saltware_weba.id
  route_table_id = aws_route_table.saltware_rt.id
}
