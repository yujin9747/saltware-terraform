terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend s3 {
    bucket         = "immersion-day-salt20"
    key            = "terraform/terraform.tfstate" # tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "tfstate-lock" # dynamodb table 이름
  }  
}