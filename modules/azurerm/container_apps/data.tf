data "azurerm_container_registry" "container_registry" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_resource_group_name
}