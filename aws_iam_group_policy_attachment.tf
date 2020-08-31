resource "aws_iam_group_policy_attachment" "attach-policy-1" {
  group      = "${local.cluster["cluster_identifier"]}-access"
  policy_arn = aws_iam_policy.NeptuneS3BucketPolicy.arn
}

resource "aws_iam_group_policy_attachment" "attach-policy-2" {
  group      = "${local.cluster["cluster_identifier"]}-access"
  policy_arn = aws_iam_policy.NeptuneAllowAccess.arn
}