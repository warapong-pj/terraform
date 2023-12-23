provider "aws" {
  region = var.region
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"

  bucket = "${var.bucket_name}"
}

module "iam_s3_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.33.0"

  name = "${module.s3.s3_bucket_id}-policy"
  path = "/"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"s3:*"
			],
			"Resource": "${module.s3.s3_bucket_arn}/*"
		}
	]
}
EOF
}
