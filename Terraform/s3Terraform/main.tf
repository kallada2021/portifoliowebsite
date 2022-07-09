provider "aws" {
  region     = var.region
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
}

resource "aws_s3_bucket" "picturesbucket" {
  bucket = "testing-portfolio-website-magnolia-bucket"
}

# Store Images to be used onsite
resource "aws_s3_object" "imagesfolder" {
  bucket = aws_s3_bucket.picturesbucket.id
  acl    = "public-read"
  key    = "Images/"
}

resource "aws_s3_bucket_acl" "bucketacl" {
  bucket = aws_s3_bucket.picturesbucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.picturesbucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "VisualEditor0"
        Effect    = "Allow"
        Action    = "s3*"
        Principal = "*"
        Resource = [
          "${aws_s3_bucket.picturesbucket.arn}/*",
          aws_s3_bucket.picturesbucket.arn
        ]
      }
    ]
  })
}

resource "aws_s3_bucket_cors_configuration" "bucketcors" {
  bucket = aws_s3_bucket.picturesbucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}
