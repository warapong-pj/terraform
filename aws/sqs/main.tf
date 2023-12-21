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

  name        = var.queeu_policy
  path        = "/"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"sqs:*"
			],
			"Resource": "arn:aws:sqs:ap-southeast-1:XXXXXXXXXXXX:lms-import-data"
		}
	]
}
EOF
}
