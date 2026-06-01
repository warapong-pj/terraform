output "ecr_key_id" {
  value = module.kms_ecr.key_id
}

output "ecr_key_arn" {
  value = module.kms_ecr.key_arn
}

output "s3_key_id" {
  value = module.kms_s3.key_id
}

output "s3_key_arn" {
  value = module.kms_s3.key_arn
}

output "kms_rds_id" {
  value = module.kms_rds.key_id
}

output "kms_rds_arn" {
  value = module.kms_rds.key_arn
}

output "kms_ec2_id" {
  value = module.kms_ec2.key_id
}

output "kms_ec2_arn" {
  value = module.kms_ec2.key_arn
}

output "kms_elasticache_id" {
  value = module.kms_elasticache.key_id
}

output "kms_elasticache_arn" {
  value = module.kms_elasticache.key_arn
}
