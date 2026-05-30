provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name   = var.identifier
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
  version = "7.2.0"

  identifier = var.identifier

  engine         = var.engine
  engine_version = var.engine_version

  apply_immediately = true
  allow_major_version_upgrade = true

  instance_class = var.instance_class
  family         = var.family

  vpc_security_group_ids = [module.security_group.security_group_id]

  multi_az               = true
  create_db_subnet_group = true
  subnet_ids             = var.subnets_id

  db_name                     = var.database
  username                    = var.username
  manage_master_user_password = true
  password_wo                 = var.password
  password_wo_version         = 1

  allocated_storage = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  kms_key_id        = "arn:aws:kms:ap-southeast-1:000000000000:key/dcb40258-7f41-4940-9067-1bef84b7f7fe"

  deletion_protection = false

  tags = var.tags
}
