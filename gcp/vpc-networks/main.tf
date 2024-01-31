provider "google" {}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.0.0"


  project_id   = var.project_id
  network_name = var.vpc_name

  subnets = var.subnets

  firewall_rules = [
    {
      name = "ssh"
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
    }
  ]
}