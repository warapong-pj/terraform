output "ecr_key_id" {
  value = module.kms_ecr.key_id
}

output "ecr_key_arn" {
  value = module.kms_ecr.key_arn
}
