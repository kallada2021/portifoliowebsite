provider "aws" {
  region     = var.region
  access_key = var.aws-accesskey
  secret_key = var.aws-secretkey
}

module "networking" {
  source = "./networking"
}

module "compute" {
  source          = "./compute"
  vpc-id          = module.networking.vpc-id
  private-subnets = module.networking.private-subnets
  subnet          = module.networking.public-subnets[0]
  db-secret       = var.secret-name
  region          = var.region
  depends_on      = [module.rds]
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
  db-secret       = var.secret-name
  private-subnets = module.networking.private-subnets
  db-name         = var.db-name
  vpc-id          = module.networking.vpc-id
}

