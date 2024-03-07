resource "aws_lb_listener" "saltware_nlbli" {
  load_balancer_arn = aws_alb.saltware_n.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.saltware_nlbta.arn
  }
}

resource "aws_lb_listener" "saltware_albli" {
  load_balancer_arn = aws_alb.saltware_a.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.saltware_albta.arn
  }
}

