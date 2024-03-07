resource "aws_route_table_association" "saltware_rtnass_wasa" {
  subnet_id      = aws_subnet.saltware_wasa.id
  route_table_id = aws_route_table.saltware_natrt.id
}

resource "aws_route_table_association" "saltware_rtnass_dba" {
  subnet_id      = aws_subnet.saltware_dba.id
  route_table_id = aws_route_table.saltware_natrt.id
}