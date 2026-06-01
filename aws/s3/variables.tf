variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "bucket_name" {
  default = "demo-bucket"
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
