terraform {
  backend "s3" {}  
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "test" {
  bucket = "${var.project_name}-${var.environment}-test-bucket-12345"
}