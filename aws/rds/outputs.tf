output "rds_engine" {
  value = module.rds.db_instance_engine
}

output "rds_address" {
    value = module.rds.db_instance_address
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}