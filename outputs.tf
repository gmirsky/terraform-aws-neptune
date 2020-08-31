output "cluster" {
  value       = aws_neptune_cluster.default
  sensitive   = false
  description = "Cluster Information"
}

output "instances" {
  value       = aws_neptune_cluster_instance.this
  sensitive   = false
  description = "Cluster instance(s) information"
}

output "subnet" {
  value       = aws_neptune_subnet_group.default
  sensitive   = false
  description = "Subnet information"
}

output "subscription" {
  value       = aws_neptune_event_subscription.default
  sensitive   = false
  description = "SNS subscription information"
}

output name {
  value       = aws_s3_bucket.this
  sensitive   = false
  description = "S3 Bucket Information for loading data"
}
