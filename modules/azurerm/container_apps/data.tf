data "azurerm_container_registry" "container_registry" {
  name                = var.container_registry.name
  resource_group_name = var.container_registry.resource_group_name
}