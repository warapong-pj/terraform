variable "region" {
  default = "ap-southeast-1"
}

variable "vpc_name" {
  default = "vpc"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "az" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "public_subnets" {
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}