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
