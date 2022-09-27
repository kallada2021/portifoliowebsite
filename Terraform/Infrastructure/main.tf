provider "aws" {
  region     = var.region
  access_key = var.aws-accesskey
  secret_key = var.aws-secretkey
}

module "networking" {
  source = "./networking"
}

module "secretmanager" {
  source      = "./secretmanager"
  secret-name = var.secret-name
  db-name     = var.db-name
}

module "compute" {
  source          = "./compute"
  vpc-id          = module.networking.vpc-id
  private-subnets = module.networking.private-subnets
  subnet          = module.networking.public-subnets[0]
}

module "alb" {
  source          = "./alb"
  vpc-id          = module.networking.vpc-id
  public-subnets  = module.networking.public-subnets
  ec2-id          = module.compute.ec2-id
  certificate-arn = var.certificate-arn
  listener-type   = var.listener-type
  ssl-policy      = var.ssl-policy
}

module "rds" {
  source          = "./rds"
  depends_on      = [module.secretmanager]
  private-subnets = module.networking.private-subnets
  dbusername      = module.secretmanager.dbusername
  dbpassword      = module.secretmanager.dbpassword
  db-name         = var.db-name
  vpc-id          = module.networking.vpc-id
}

# data "aws_ami" "AWSAMI" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }
