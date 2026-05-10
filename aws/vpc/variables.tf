variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
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

variable "database_subnets" {
  default = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
}

variable "intra_subnets" {
  default = ["10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24"]
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
