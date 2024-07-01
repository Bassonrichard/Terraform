output "primary_blob_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
  description = "The primary connection string of the storage account."

  sensitive = true
}