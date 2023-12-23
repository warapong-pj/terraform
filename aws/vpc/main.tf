provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.az
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway  = false
  map_public_ip_on_launch = true
}

