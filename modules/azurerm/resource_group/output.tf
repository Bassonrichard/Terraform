output "id" {
  value = azurerm_resource_group.az_rg.id
  description = "The id of the resource group."
}

output "name" {
  value = azurerm_resource_group.az_rg.name
  description = "The name of the resource group."
}