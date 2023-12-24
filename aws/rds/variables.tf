variable "region" {
  default = "ap-southeast-1"
}

variable "rds_name" {
  default = "rds"
}

variable "vpc_id" {
  default = "vpc-XXXXXXXXXXXXXXXXX"
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "14"
}

variable "family" {
  default = "postgres14"
}

variable "instance_class" {
  default = "db.t3.medium"
}

variable "allocated_storage" {
  default = 20
}

variable "rds_username" {
  default   = "postgres"
  sensitive = true
}

variable "rds_password" {
  default   = "XXXXXXXXXXXXXXXX"
  sensitive = true
}
