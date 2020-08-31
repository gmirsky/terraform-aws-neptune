resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.NeptuneLoadFromS3.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}