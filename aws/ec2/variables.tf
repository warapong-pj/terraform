variable "region" {
  default = "ap-southeast-1"
}

variable "ec2_name" {
  default = "ec2"
}

variable "ec2_instance_type" {
  default = "t3.medium"
}

variable "vpc_id" {
  default = "vpc-XXXXXXXXXXXXXXXXX"
}

variable "subnet_id" {
  default = "subnet-XXXXXXXXXXXXXXXXX"
}

variable "key_pair" {
  default = "key-pair"
}

variable "volume_type" {
  default = "gp3"
}

variable "volume_size" {
  default = "20"
}