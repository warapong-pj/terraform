variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "vpc_id" {
  default = "vpc-XXXXXXXXXXXXXXXXX"
}

variable "vpc_cidr_blocks" {
  default = "10.0.0.0/20"
}

variable "private_subnets" {
  default = [
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
  ]
}

variable "cluster_id" {
  default = "demo-redis"
}

variable "engine" {
  default = "redis"
}

variable "engine_version" {
  default = "7.1"
}

variable "node_type" {
  default = "cache.t4g.small"
}

variable "kms_arn" {
  default = "arn:aws:kms:ap-southeast-1:000000000000:key/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
