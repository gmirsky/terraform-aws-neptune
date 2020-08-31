data "aws_subnet_ids" "private" {
  vpc_id = element(
    tolist(
      data.aws_vpcs.main.ids
    ),
    0
  )
  tags = {
    Type = var.subnet_private_tag
  }
}

data "aws_vpcs" "main" {
  tags = {
    Name = var.vpc_name_tag
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_route_tables" "rts" {
  vpc_id = element(
    tolist(
      data.aws_vpcs.main.ids
    ),
    0
  )
  filter {
    name   = "tag:subnet_type"
    values = ["private"]
  }
}

data "aws_iam_role" "aws_service_role_for_rds" {
  name = "AWSServiceRoleForRDS"
}