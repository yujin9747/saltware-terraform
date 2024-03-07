resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  count                       = 3
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
  description = "EC2에 할당된 IP입니다"
  value = "${aws_instance.ec2_instance.*.public_ip}"
}