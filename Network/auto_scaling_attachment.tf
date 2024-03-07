resource "aws_autoscaling_attachment" "saltware_auto_scaling_attach" {
    autoscaling_group_name = aws_autoscaling_group.saltware_scaling_group.id
    lb_target_group_arn = aws_lb_target_group.saltware_albta.arn  
}

resource "aws_autoscaling_attachment" "saltware_auto_scaWAS_attach" {
    autoscaling_group_name = aws_autoscaling_group.saltware_scaWAS_group.id
    lb_target_group_arn = aws_lb_target_group.saltware_nlbta.arn
}