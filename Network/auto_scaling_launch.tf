resource "aws_launch_configuration" "saltware_autowas" {
  name            = "saltware-autowas"
  image_id        = "ami-066d41d96fc160063"
  instance_type   = "t2.small"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.saltware_sec.id]
  key_name        = "immersionDay-key"
  user_data       = <<-EOF
                    #! bin/bash
                    sudo su -
                    amazon-linux-extras install docker -y
                    amazon-linux-extras enable docker
                    systemctl enable docker
                    systemctl start docker
                    EOF
}

resource "aws_launch_configuration" "saltware_autola" {
  name            = "saltware-autola"
  image_id        = "ami-066d41d96fc160063"
  instance_type   = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.saltware_sec.id]
  key_name        = "immersionDay-key"
  user_data       = <<-EOF
                    #! bin/bash
                    systemctl start httpd
                    systemctl enable httpd
                    EOF
}
