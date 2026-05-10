provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.13.0"

  bucket = var.bucket_name
}

module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "6.6.0"

  name = "${var.bucket_name}-policy"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"s3:*"
			],
			"Resource": "${module.s3_bucket.s3_bucket_arn}/*"
		}
	]
}
EOF
}
