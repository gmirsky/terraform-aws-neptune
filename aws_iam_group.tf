resource "aws_iam_group" "neptune-user-group" {
  name = "${local.cluster["cluster_identifier"]}-access"
  path = "/"
}