variable "region" {
  default = "ap-southeast-1"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "name" {
  default = "rds-instance"
}

variable "kms_key_arn" {
  default = "arn:aws:kms:ap-southeast-1:000000000000:key/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}

variable "tags" {
  default = {
    "ManageByTerraform" : "True"
    "Environment" : "POC"
  }
}
