resource "aws_sns_topic" "default" {
  name = local.cluster["cluster_identifier"]
}
