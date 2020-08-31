# Not used. VPC endpoints are account global. Set up manually once in account.
#
# resource "aws_vpc_endpoint" "s3" {
#   vpc_id = element(
#     tolist(
#       data.aws_vpcs.main.ids
#     ),
#     0
#   )
#   service_name    = "com.amazonaws.${data.aws_region.current.name}.s3"
#   tags            = local.tags
#   route_table_ids = data.aws_route_tables.rts.ids
# }