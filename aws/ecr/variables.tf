variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "kms_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "name" {
  default = "ecr"
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
