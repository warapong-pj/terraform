variable "region" {
  default = "ap-southeast-1"
}

variable "vpc_id" {
  default = "vpc-XXXXXXXXXXXXXXXXX"
}

variable "subnet_ids" {
  default = [
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
  ]
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

variable "aws_auth_users" {
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [{
    rolearn  = "arn:aws:iam::XXXXXXXXXXXX:user/test"
    username = "test"
    groups   = ["system:masters"]
  }]
}