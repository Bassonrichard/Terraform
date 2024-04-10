output "id" {
  value       = azurerm_container_registry.az_container_registry.id
  description = "Id of the container registry."
}

output "login_server" {
  value       = azurerm_container_registry.az_container_registry.login_server
  description = "The login server of the container registry."
}

output "name" {
  value       = azurerm_container_registry.az_container_registry.name
  description = "The name of the container registry."
}
