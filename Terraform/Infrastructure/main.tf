provider "aws" {
  region = var.region
}

module "networking" {
  source = "./networking"
}

module "compute" {
  source          = "./compute"
  vpc-id          = module.networking.vpc-id
  private-subnets = module.networking.private-subnets
  subnet          = module.networking.public-subnets[0]
}

module "alb" {
  source         = "./alb"
  vpc-id         = module.networking.vpc-id
  public-subnets = module.networking.public-subnets
  ec2-id         = module.compute.ec2-id
  certificate_arn = var.certificate_arn
  listener_type = var.listener_type
  ssl_policy = var.ssl_policy

}

module "rds" {
  source          = "./rds"
  private-subnets = module.networking.private-subnets
  db-name         = var.db-name
  db-password     = var.db-password
  db-username     = var.db-username
  vpc-id         = module.networking.vpc-id
}
