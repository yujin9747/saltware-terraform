#가용영역 a에 public subnet 생성
resource "aws_subnet" "saltware_weba" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "saltware-weba"
  }
}

resource "aws_subnet" "saltware_wasa" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "saltware-wasa"
  }
}

resource "aws_subnet" "saltware_dba" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "saltware-dba"
  }
}

#가용영역 c에 public subnet 생성
resource "aws_subnet" "saltware_webc" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "saltware-webc"
  }
}

resource "aws_subnet" "saltware_wasc" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "saltware-wasc"
  }
}

resource "aws_subnet" "saltware_dbc" {
  vpc_id            = aws_vpc.saltware_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "saltware-dbc"
  }
}