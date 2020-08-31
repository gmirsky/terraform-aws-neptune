resource "random_pet" "neptune_cluster_suffix" {
  prefix    = local.cluster_prefix
  length    = 2
  separator = "-"
}
