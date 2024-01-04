provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  create_cloudwatch_log_group = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  create_aws_auth_configmap = false
  manage_aws_auth_configmap = true
  aws_auth_users = [
    {
      rolearn  = "arn:aws:iam::XXXXXXXXXXXX:user/test"
      username = "test"
      groups   = ["system:masters"]
    }
  ]

  eks_managed_node_groups = {
    generic = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = var.instance_types
      disk_size      = 50

      tags = {
        node_type = "generic"
      }
    }
  }
}

module "eks_roles" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.33.0"

  create_role = true

  role_name = "${var.cluster_name}-cluster-roles"

  provider_url = module.eks.oidc_provider

  role_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
  number_of_role_policy_arns = 1
}