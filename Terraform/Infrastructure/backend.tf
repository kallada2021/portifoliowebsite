terraform {
    backend "s3" {
        bucket = "portfolio-website-magnolia-bucket"
        key    = "terraformstate/portfolioinfrastructure/terraform.tfstate"
        region = "us-east-1"
        
    }
}