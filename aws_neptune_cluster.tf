resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = local.cluster["cluster_identifier"]
  engine                              = local.cluster["engine"]
  port                                = local.cluster["port"]
  backup_retention_period             = local.cluster["backup_retention_period"]
  preferred_backup_window             = local.cluster["preferred_backup_window"]
  skip_final_snapshot                 = local.cluster["skip_final_snapshot"]
  iam_database_authentication_enabled = local.cluster["iam_database_authentication_enabled"]
  apply_immediately                   = local.cluster["apply_immediately"]
  storage_encrypted                   = local.cluster["storage_encrypted"]
  neptune_subnet_group_name           = aws_neptune_subnet_group.default.name
  deletion_protection                 = local.cluster["deletion_protection"]
  tags                                = local.tags
  iam_roles = [
    aws_iam_role.NeptuneLoadFromS3.arn,
    data.aws_iam_role.aws_service_role_for_rds.arn
  ]
}
