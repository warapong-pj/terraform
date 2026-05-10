output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_id" {
  value = module.vpc.public_subnets
}

output "public_subnets_cidr" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets_id" {
  value = module.vpc.private_subnets
}

output "private_subnets_cidr" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "database_subnets_id" {
  value = module.vpc.database_subnets
}

output "database_subnets_cidr" {
  value = module.vpc.database_subnets_cidr_blocks
}

output "intra_subnets_id" {
  value = module.vpc.database_subnets
}

output "intra_subnets_cidr" {
  value = module.vpc.database_subnets_cidr_blocks
}
