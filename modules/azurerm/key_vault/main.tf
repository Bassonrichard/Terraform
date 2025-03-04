resource "azurerm_key_vault" "az_key_vault" {

  location            = var.location
  resource_group_name = var.resource_group_name

  name                        = "${var.name_prefix}-${var.key_vault.name}-kv"

  tenant_id                   = data.azurerm_client_config.current.tenant_id

  enabled_for_disk_encryption = var.key_vault.enabled_for_disk_encryption
  soft_delete_retention_days  = var.key_vault.soft_delete_retention_days
  purge_protection_enabled    = var.key_vault.purge_protection_enabled
  enable_rbac_authorization   = var.key_vault.enable_rbac_authorization

  sku_name                    = var.key_vault.sku_name
  
  tags                        = var.tags

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id               = access_policy.value.tenant_id
      object_id               = access_policy.value.object_id
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      storage_permissions     = access_policy.value.storage_permissions
      certificate_permissions = access_policy.value.certificate_permissions
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }
}
