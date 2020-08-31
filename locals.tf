locals {
  cluster_prefix    = "neptune-${lower(terraform.workspace)}"
  subnet_group_name = random_pet.neptune_cluster_suffix.id
  s3_bucket_name    = "mri-simmons-${random_pet.neptune_cluster_suffix.id}"
  cluster = {
    cluster_identifier                  = random_pet.neptune_cluster_suffix.id
    engine                              = "neptune"
    port                                = 8182
    enable_cloudwatch_logs_exports      = ["audit"]
    backup_retention_period             = 7
    preferred_backup_window             = "07:00-09:00"
    skip_final_snapshot                 = true
    iam_database_authentication_enabled = false
    apply_immediately                   = true
    final_snapshot_identifier           = "${random_pet.neptune_cluster_suffix.id}-final"
    storage_encrypted                   = true
    deletion_protection                 = false
  }
  tags = {
    Project           = "Neptune Cluster"
    created_by        = data.aws_caller_identity.current.arn
    Environment       = element(slice(split("-", upper(terraform.workspace)), 1, 2), 1)
    cost-center       = "Infrastructure-General"
    Role              = "Database"
    terraform-managed = true
    Jira              = "AWS-197"
  }
}
