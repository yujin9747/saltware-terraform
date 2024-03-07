resource "aws_placement_group" "saltware_placement_WASgroup" {
  name     = "saltware_WASplacement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "saltware_scaWAS_group" {
  name                      = "saltware-scaWAS-group"
  min_size                  = 1
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.saltware_autowas.name
  vpc_zone_identifier       = [aws_subnet.saltware_wasa.id, aws_subnet.saltware_wasc.id]
}

resource "aws_placement_group" "saltware_placement_group" {
  name     = "saltware_placement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "saltware_scaling_group" {
  name                      = "saltware-scaling-group"
  min_size                  = 1
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.saltware_autola.name
  vpc_zone_identifier       = [aws_subnet.saltware_weba.id, aws_subnet.saltware_webc.id]
}
