output "primary_blob_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
  description = "The primary connection string of the storage account."

  sensitive = true
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "The primary blob endpoint of the storage account."
  
}