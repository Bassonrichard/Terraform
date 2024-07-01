locals {
  name = var.product == null ? "${var.company_short_code}${var.environment_name}${var.name}sa" : "${var.company_short_code}${var.product}${var.environment_name}${var.name}sa"
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

  for_each = var.storage_containers 

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = each.value.container_access_type
}