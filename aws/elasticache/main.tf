provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name   = var.cluster_id
  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      cidr_blocks = var.vpc_cidr_blocks
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "elasticache" {
  source  = "terraform-aws-modules/elasticache/aws"
  version = "1.11.0"

  cluster_id               = var.cluster_id
  engine                   = var.engine
  engine_version           = var.engine_version
  create_cluster           = true
  create_replication_group = false

  node_type = var.node_type

  maintenance_window = "sun:05:00-sun:09:00"
  apply_immediately  = true

  vpc_id                = var.vpc_id
  subnet_ids            = var.private_subnets
  create_security_group = false
  security_group_ids    = [module.security_group.security_group_id]

  kms_key_arn = var.kms_arn

  create_parameter_group = true
  parameter_group_family = "redis7"
  parameters = [
    {
      name  = "latency-tracking"
      value = "yes"
    }
  ]

  tags = var.tags
}
