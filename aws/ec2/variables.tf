variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "ec2_name" {
  default = "demo"
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

variable "volume_type" {
  default = "gp3"
}

variable "volume_size" {
  default = "20"
}
