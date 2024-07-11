locals {
  cosmosdb_name = "${var.name_prefix}-cosmosdb"
}


resource "azurerm_cosmosdb_account" "az_cosmosdb_account" {
  name                              = local.cosmosdb_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  default_identity_type             = var.cosmosdb_account.user_assigned_identity == null ? null : join("=", ["UserAssignedIdentity", var.cosmosdb_account.user_assigned_identity])
  offer_type                        = var.cosmosdb_account.offer_type
  kind                              = var.cosmosdb_account.kind
  free_tier_enabled                 = var.cosmosdb_account.free_tier_enabled
  is_virtual_network_filter_enabled = var.cosmosdb_account.is_virtual_network_filter_enabled
  ip_range_filter                   = join(",", var.cosmosdb_account.ip_range_filter)

  dynamic "capabilities" {
    for_each = coalesce(var.cosmosdb_account.capabilities, [])
    content {
      name = capabilities.value
    }
  }

  consistency_policy {
    consistency_level       = var.cosmosdb_account.consistency_policy.consistency_level
    max_interval_in_seconds = var.cosmosdb_account.consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = var.cosmosdb_account.consistency_policy.max_staleness_prefix
  }

  dynamic "geo_location" {
    for_each = coalesce(var.cosmosdb_account.geo_locations, [])
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = geo_location.value.zone_redundant
    }
  }

  dynamic "virtual_network_rule" {
    for_each = coalesce(var.cosmosdb_account.virtual_network_rules, [])
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }


  dynamic "analytical_storage" {
    for_each = var.cosmosdb_account.analytical_storage == null ? [] : [true]
    content {
      schema_type = var.cosmosdb_account.analytical_storage.schema_type
    }
  }

  capacity {
    total_throughput_limit = var.cosmosdb_account.free_tier_enabled ? 1000 : -1
  }

  dynamic "backup" {
    for_each = coalesce(var.cosmosdb_account.backups, [])
    content {
      type                = backup.value.type
      interval_in_minutes = backup.value.interval_in_minutes
      retention_in_hours  = backup.value.retention_in_hours
      storage_redundancy  = backup.value.storage_redundancy
    }
  }

  dynamic "cors_rule" {
    for_each = coalesce(var.cosmosdb_account.cors_rules, [])
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "identity" {
    for_each = coalesce(var.cosmosdb_account.identities, [])
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "restore" {
    for_each = coalesce(var.cosmosdb_account.restores, [])
    content {
      source_cosmosdb_account_id = restore.value.source_cosmosdb_account_id
      restore_timestamp_in_utc   = restore.value.restore_timestamp_in_utc
      dynamic "database" {
        for_each = restore.value.databases
        content {
          name             = database.value.name
          collection_names = database.value.cocollection_names
        }
      }
    }
  }

  tags = var.tags
}
