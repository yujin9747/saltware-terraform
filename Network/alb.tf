resource "aws_alb" "saltware_n" {
  name            = "saltware-n"
  internal        = true
  subnets         = [aws_subnet.saltware_wasa.id, aws_subnet.saltware_wasc.id]
  security_groups = [aws_security_group.saltware_sec.id]
  tags = {
    "Name" = "saltware-a"
  }
}
output "dns_name_nlb" {
  value = aws_alb.saltware_n.dns_name
}

resource "aws_alb" "saltware_a" {
  name            = "saltware-a"
  internal        = false
  subnets         = [aws_subnet.saltware_weba.id, aws_subnet.saltware_webc.id]
  security_groups = [aws_security_group.saltware_sec.id]
  tags = {
    "Name" = "saltware-a"
  }
}
output "dns_name" {
  value = aws_alb.saltware_a.dns_name
}

