resource "aws_neptune_event_subscription" "default" {
  name          = "neptune-event-subscription"
  enabled       = true
  sns_topic_arn = aws_sns_topic.default.arn
  tags          = local.tags
  source_type   = "db-instance"
  source_ids    = aws_neptune_cluster_instance.this[*].id
  event_categories = [
    "read replica",
    "restoration",
    "recovery",
    "maintenance",
    "configuration change",
    "creation",
    "backtrack",
    "low storage",
    "backup",
    "failover",
    "availability",
    "failure",
    "notification",
    "deletion",
  ]
}
