output "id" {
  value       = azurerm_key_vault.az_key_vault.id
  description = "The key vault id."
}

output "name" {
  value       = azurerm_key_vault.az_key_vault.name
  description = "The key vault name."
}

output "vault_uri" {
  value       = azurerm_key_vault.az_key_vault.vault_uri
  description = "The key vault uri."
}