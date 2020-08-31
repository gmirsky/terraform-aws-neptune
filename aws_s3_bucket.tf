resource "aws_s3_bucket" "this" {
  bucket        = local.s3_bucket_name
  acl           = "private"
  force_destroy = true
  tags          = local.tags
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}