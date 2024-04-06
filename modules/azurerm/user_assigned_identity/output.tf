output "principal_id" {
  value       = azurerm_user_assigned_identity.az_user_assigned_identity.principal_id
  description = "The principal ids of the user assigned identity."
}

output "client_id" {
  value       = azurerm_user_assigned_identity.az_user_assigned_identity.client_id
  description = "The ids of the app associated with the Identity."
}

output "id" {
  value       = azurerm_user_assigned_identity.az_user_assigned_identity.id
  description = "The ids of the user assigned identity."
}