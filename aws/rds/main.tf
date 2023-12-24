provider "aws" {
  region = var.region
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = var.rds_name
  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.3.0"

  identifier = var.rds_name

  engine         = var.engine
  engine_version = var.engine_version
  family         = var.family
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  vpc_security_group_ids = [module.security_group.security_group_id]

  publicly_accessible = false
  manage_master_user_password = false
  username            = var.rds_username
  password            = var.rds_password
}
