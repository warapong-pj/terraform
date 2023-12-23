output "s3_name" {
  value = module.s3.s3_bucket_id
}

output "s3_arn" {
  value = module.s3.s3_bucket_arn
}