provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = var.vpc_name
  cidr = var.cidr

  # two-tier architecture
  azs              = var.az
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # # three-tier architecture
  # azs              = var.az
  # public_subnets   = var.public_subnets
  # private_subnets  = var.private_subnets
  # database_subnets = var.database_subnets

  # # nat per az
  # enable_nat_gateway     = true
  # single_nat_gateway     = false
  # one_nat_gateway_per_az = true

  map_public_ip_on_launch = true
}

