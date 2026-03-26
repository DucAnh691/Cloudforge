provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "cloudforge-tf-state-ducanh-2026"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name = "cloudforge-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}