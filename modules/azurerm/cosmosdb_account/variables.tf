variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the container registry."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "product" {
  type        = string
  description = "(Required) The name of product cosmosdb."
}

variable "company_short_code" {
  type        = string
  description = "(Required) The short code of the company."
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the environmnet the cosmosdb is in."
}

variable "cosmosdb_account" {
  type = object({
    user_assigned_identity = optional(string)
    offer_type             = optional(string, "Standard")
    kind                   = optional(string)
    free_tier_enabled      = optional(bool)

    is_virtual_network_filter_enabled = optional(bool)

    ip_range_filter = optional(list(string))

    capabilities = optional(list(string))

    consistency_policy = object({
      consistency_level       = string
      max_interval_in_seconds = optional(number)
      max_staleness_prefix    = optional(number)
    })

    geo_locations = list(object({
      location          = string
      failover_priority = optional(number, 0)
      zone_redundant    = optional(bool)
    }))

    virtual_network_rules = optional(list(object({
      id                                   = string
      ignore_missing_vnet_service_endpoint = optional(bool)
    })))

    analytical_storage = optional(object({
      schema_type = string
    }))

    capacities = optional(list(object({
      total_throughput_limit = number
    })))

    backups = optional(list(object({
      type                = string
      interval_in_minutes = optional(number)
      retention_in_hours  = optional(number)
      storage_redundancy  = optional(string)
    })))

    cors_rules = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = optional(number)
    })))

    identities = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })))

    restores = optional(list(object({
      source_cosmosdb_account_id = string
      restore_timestamp_in_utc   = string
      databases = optional(list(object({
        name             = string
        collection_names = optional(list(string))
      })))
    })))
  })

  description = "(Required) The Cosmos DB account to create."
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}
