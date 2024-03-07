data "aws_vpc" "existing_vpc" {
  tags = {
    Name = "saltware-vpc"
  }
}
 
data "aws_subnet" "existing_subnet" {
  tags = {
    Name = "saltware-weba"
  }
}
 
module "ec2-module" {
  source        = "./EC2_Module/"
  ami           = "ami-097bf0ec147165215"
  instance_type = "t3.medium"
  subnet_id     = data.aws_subnet.existing_subnet.id
}

output "public_ip" {

  value = module.ec2-module.*.public_ip
}