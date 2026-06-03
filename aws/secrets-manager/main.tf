provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "secrets-manager" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "2.1.0"

  name = var.name

  secret_string = jsonencode({
    host = "demo.000000000000.ap-southeast-1.rds.amazonaws.com"
    port = "5432"
    dbname = "demo-db"
    username = "postgres"
    password = "xxxxxxxxxxxxxxxx"
  })

  recovery_window_in_days = 30

  kms_key_id = var.kms_key_arn

  tags = var.tags
}
