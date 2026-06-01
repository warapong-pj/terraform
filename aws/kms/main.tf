provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "kms_ecr" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = "ECR KMS Key"

  deletion_window_in_days = 30

  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = var.tags
}

module "kms_s3" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = "ECR KMS Key"

  deletion_window_in_days = 30

  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = var.tags
}

module "kms_rds" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = "RDS KMS Key"

  deletion_window_in_days = 30

  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = var.tags
}

module "kms_ec2" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = "EC2 KMS Key"

  deletion_window_in_days = 30

  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = var.tags
}

module "kms_elasticache" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = "Elasticache KMS Key"

  deletion_window_in_days = 30

  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = var.tags
}
