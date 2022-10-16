# Bucket for deposits
resource "aws_s3_bucket" "deposits" {
  bucket = "${var.environment_name}-deposits"

  tags = {
    Environment = "${var.environment_name}"
  }
}

resource "aws_s3_bucket_acl" "deposits" {
  bucket = aws_s3_bucket.deposits.id
  acl    = "private"
}

# Bucket for the frontend
resource "aws_s3_bucket" "frontend" {
  bucket = "${var.environment_name}-frontend"
}

resource "aws_s3_bucket_acl" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.frontend.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}