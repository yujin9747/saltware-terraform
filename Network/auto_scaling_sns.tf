resource "aws_sns_topic" "saltware_topic" {
  name = "saltware-topic"

}

resource "aws_sns_topic_subscription" "saltware_topic_sub" {
  topic_arn = aws_sns_topic.saltware_topic.arn
  protocol  = "email"
  endpoint  = "yujin.jang@merlotlab.com"
}

resource "aws_autoscaling_notification" "saltware_notifications_WAS" {
  group_names = [
    aws_autoscaling_group.saltware_scaWAS_group.id
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.saltware_topic.arn
}

