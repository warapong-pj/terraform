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
