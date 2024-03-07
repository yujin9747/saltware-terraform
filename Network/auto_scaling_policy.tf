resource "aws_autoscaling_policy" "saltware_auto_WEB_policy" {
    name = "saltware-auto-WEB-policy"
    policy_type = "TargetTrackingScaling"
    autoscaling_group_name = aws_autoscaling_group.saltware_scaling_group.name

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}

resource "aws_autoscaling_policy" "saltware_auto_WAS_policy" {
    name = "saltware-auto-WAS-policy"
    policy_type = "TargetTrackingScaling"
    autoscaling_group_name = aws_autoscaling_group.saltware_scaWAS_group.name

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }

}