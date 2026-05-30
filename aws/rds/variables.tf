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

variable "subnets_id" {
  default = [
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
    "subnet-XXXXXXXXXXXXXXXXX",
  ]
}

variable "identifier" {
  default = "demo"
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "17.1"
}

variable "family" {
  default = "postgres17"
}

variable "instance_class" {
  default = "db.t4g.medium"
}

variable "database" {
  default = "poc-db"
}

variable "username" {
  default   = "postgres"
  sensitive = true
}

variable "password" {
  default   = "passw0rd"
  sensitive = true
}

variable "allocated_storage" {
  default = 20
}

variable "max_allocated_storage" {
  default = 40
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
