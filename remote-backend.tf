resource "aws_s3_bucket" "s3" {
  bucket = "tf-state-bucket-54651800"
  force_destroy = true
  tags = {
    Name        = "tf-s3"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb" {
  name           = "dynamodb"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tf-dynamodb"
    Environment = "dev"
  }
}

/*
terraform {
  backend "s3" {
    bucket = "tf-state-bucket-54651800"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamodb"
    encrypt = true
  }
}
*/
