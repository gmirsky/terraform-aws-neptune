resource "aws_neptune_subnet_group" "default" {
  name        = local.subnet_group_name
  subnet_ids  = data.aws_subnet_ids.private.ids
  tags        = local.tags
  description = "Neptune Subnet Group"
}
