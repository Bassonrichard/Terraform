resource "azurerm_container_registry" "az_container_registry" {
  name                = "${var.name}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  tags = var.tags
}