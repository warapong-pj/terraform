provider "aws" {
  region = var.region
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "4.1.0"

  name = var.queue_name
}

module "iam_sqs_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.33.0"

  name = "${module.sqs.queue_name}-policy"
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
			"Resource": "${module.sqs.queue_arn}/*"
		}
	]
}
EOF
}

