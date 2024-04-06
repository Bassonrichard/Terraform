module "cosmosdb" {
  source = ""

  depends_on = [
    module.resource_groups,
    module.user_assigned_identity
  ]

  cosmosdb_accounts = {
    datastorage_cosmosdb = {
      name     = local.cosmosdb_name
      location = var.location
      # user_assigned_identity = module.user_assigned_identity.client_ids[local.container_apps_uai_name]
      offer_type          = "Standard"
      enable_free_tier    = var.cosmosdb.cosmosdb_free_tier
      resource_group_name = local.database_resource_group_name

      is_virtual_network_filter_enabled = true

      ip_range_filter = join(",", local.comosdb_ip_range_filter)

      tags = var.tags

      consistency_policy = {
        consistency_level = "Strong"
      }

      geo_locations = [
        {
          location          = var.location
          failover_priority = 0
        }
      ]

      capacities = [
        {
          total_throughput_limit = var.cosmosdb.cosmosdb_free_tier ? 1000 : -1
        }
      ]

      virtual_network_rules = [
        {
          id                                   = module.subnets.ids["${local.subnet_name}-container"]
          ignore_missing_vnet_service_endpoint = false
        }
      ]
    }
  }
}