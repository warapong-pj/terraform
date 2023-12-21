variable "region" {
  default = "ap-southeast-1"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_ids" {
  default = []
}

variable "cluster_name" {
  default = "eks"
}

variable "cluster_version" {
  default = "1.28"
}

variable "instance_types" {
  default = ["t3.medium", "t3a.medium"]
}
