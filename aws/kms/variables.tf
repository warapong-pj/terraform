variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "test"
}

variable "secret_key" {
  default = "test"
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
