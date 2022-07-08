provider "aws" {
  region = var.region
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
}

resource "aws_s3_bucket" "picturesbucket" {
  bucket = "portfolio-website-magnolia-bucket"
  #key = "Images/"
}

resource "aws_s3_object" "imagesfolder" {
  bucket = aws_s3_bucket.picturesbucket.id
  acl    = "private"
  key    = "Images/"
}
