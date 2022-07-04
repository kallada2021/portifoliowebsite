provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "picturesbucket" {
  bucket = "portfolio-website-bucket"
  #key = "Images/"
}

resource "aws_s3_object" "imagesfolder" {
  bucket = aws_s3_bucket.picturesbucket.id
  acl    = "private"
  key    = "Images/"
}
