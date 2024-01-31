variable "project_id" {
  default = ""
}

variable "vpc_name" {
  default = "vpc"
}

variable "subnets" {
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))

  default = [{
    subnet_name   = "public-subnet-1"
    subnet_ip     = "10.0.0.0/24"
    subnet_region = "us-west1"
    },
    {
      subnet_name   = "public-subnet-2"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "public-subnet-3"
      subnet_ip     = "10.0.2.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "private-subnet-1"
      subnet_ip     = "10.0.3.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "private-subnet-2"
      subnet_ip     = "10.0.4.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "private-subnet-3"
      subnet_ip     = "10.0.5.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "database-subnet-1"
      subnet_ip     = "10.0.6.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "database-subnet-2"
      subnet_ip     = "10.0.7.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "database-subnet-3"
      subnet_ip     = "10.0.8.0/24"
      subnet_region = "us-west1"
    }
  ]
}