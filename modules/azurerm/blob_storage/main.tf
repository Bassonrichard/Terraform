locals {
  name = "${var.name_prefix}${var.name}sa"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.name
  resource_group_name      = var.resource_group_name

  location                 = var.location
  access_tier              = "Hot"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "storage_container" {

  for_each = { for idx, container in var.storage_containers : idx => container }

  name                  = each.value.name
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = each.value.container_access_type
}