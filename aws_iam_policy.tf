resource "aws_iam_policy" "NeptuneAllowAccess" {
  name        = "NeptuneAllowAccess-${local.cluster["cluster_identifier"]}"
  path        = "/"
  description = "Allows IAM authentication access to ${local.cluster["cluster_identifier"]}"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Effect": "Allow",
        "Action": [
            "neptune-db:*"
        ],
        "Resource": [
            "${aws_neptune_cluster.default.arn}/*"
        ]
      }
  ]
}
EOF
}

resource "aws_iam_policy" "NeptuneDenyAccess" {
  name        = "NeptuneDenyAccess-${local.cluster["cluster_identifier"]}"
  path        = "/"
  description = "Deny IAM authentication access to ${local.cluster["cluster_identifier"]}"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Effect": "Deny",
        "Action": [
            "neptune-db:*"
        ],
        "Resource": [
            "${aws_neptune_cluster.default.arn}/*"
        ]
      }
  ]
}
EOF
}

resource "aws_iam_policy" "NeptuneS3BucketPolicy" {
  name        = "${local.s3_bucket_name}-all-access"
  path        = "/"
  description = "Allow all access to S3 bucket ${local.s3_bucket_name}"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${local.s3_bucket_name}"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::${local.s3_bucket_name}/*"
            ]
        }
    ]
}
EOF
}