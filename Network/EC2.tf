resource "aws_instance" "saltware_ec2" {
  ami                         = "ami-01711d925a1e4cc3a"
  instance_type               = "t2.small"
  vpc_security_group_ids      = [aws_security_group.saltware_sec.id]
  availability_zone           = "ap-northeast-2a"
  subnet_id                   = aws_subnet.saltware_weba.id
  count                       = 0
  user_data                   = <<-EOF
#! /bin/bash
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
docker pull nginx
docker run -itd -p 80:80 --name nginx nginx

EOF
    tags = {
      Name = "Saltware_ec2 ${count.index}"
    }
}

output "public_ip" {
  value = aws_instance.saltware_ec2[*].public_ip
}
