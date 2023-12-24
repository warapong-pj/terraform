provider "aws" {
  region = var.region
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

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
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

# module "key_pair" {
#   source  = "terraform-aws-modules/key-pair/aws"
#   version = "2.0.2"

#   key_name           = var.ec2_name
#   create_private_key = true
# }

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = var.ec2_name
  ami = data.aws_ami.amazon_linux.id

  instance_type          = var.ec2_instance_type
  key_name               = var.key_pair
  monitoring             = false
  vpc_security_group_ids = [ module.security_group.security_group_id ]
  subnet_id              = var.subnet_id

  root_block_device = [
    {
      volume_type = var.volume_type
      volume_size = var.volume_size
    },
  ]
}