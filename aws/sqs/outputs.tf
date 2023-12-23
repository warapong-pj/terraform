output "sqs_name" {
  value = module.sqs.queue_name
}

output "sqs_url" {
  value = module.sqs.queue_url
}