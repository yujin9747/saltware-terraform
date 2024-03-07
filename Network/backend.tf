resource "aws_s3_bucket" "tfstate" {
    bucket = "immersion-day-salt20"
}

resource "aws_dynamodb_table" "tfstate-lock" {
    name = "tfstate-lock"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockID"
      type = "S"
    }
}