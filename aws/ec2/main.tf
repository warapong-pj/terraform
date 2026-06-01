provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name   = var.ec2_name
  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
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

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.2"

  key_name           = var.ec2_name
  create_private_key = true
}

resource "aws_ssm_parameter" "amazon_linux_ami" {
  name  = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  type  = "String"
  value = "ami-12345678"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.0"


  name = var.ec2_name
  ami  = aws_ssm_parameter.amazon_linux_ami.value

  instance_type          = var.ec2_instance_type
  key_name               = module.key_pair.key_pair_name
  monitoring             = false
  create_iam_instance_profile = false
  create_security_group  = false
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = var.subnet_id

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"   # allows IMDSv1, avoids the metadata API call
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "disabled"
  }

  # root_block_device = [
  #   {
  #     volume_type = var.volume_type
  #     volume_size = var.volume_size
  #   },
  # ]

  depends_on = [aws_ssm_parameter.amazon_linux_ami]

  tags = var.tags
}
