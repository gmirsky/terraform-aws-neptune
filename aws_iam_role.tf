resource "aws_iam_role" "NeptuneLoadFromS3" {
  description           = "Allows ${local.cluster["cluster_identifier"]} to access the S3 bucket ${local.s3_bucket_name}"
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "NeptuneLoadFromS3-${local.cluster["cluster_identifier"]}"
  path                  = "/"
  tags                  = local.tags
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : [
              "rds.amazonaws.com"
            ]
          },
          "Action" : "sts:AssumeRole"
        }
      ]
      Version = "2012-10-17"
    }
  )

}
