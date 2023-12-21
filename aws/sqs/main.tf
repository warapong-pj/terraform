provider "aws" {
  region = var.region
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "4.1.0"

  name = var.queue_name
}
