variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the key vault resides in."
}

variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}

variable "key_vault" {
  type = object({
    name                        = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  })
  description = "(Required) Key vault configuration variables."
}

variable "access_policies" {
  type = list(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    storage_permissions     = list(string)
    certificate_permissions = list(string)
  }))
  description = "(Optional) List of access policies for the key vault."
  default = []
}

variable "network_acls" {
  type = list(object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  description = "(Optional) List of network ACL configurations for the key vault."
  default = []
}