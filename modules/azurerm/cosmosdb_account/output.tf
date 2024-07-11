output "id" {
  value = azurerm_cosmosdb_account.az_cosmosdb_account.id
  description = "The CosmosDB Account id."
}

output "primary_sql_connection_string" {
  value = azurerm_cosmosdb_account.az_cosmosdb_account.primary_sql_connection_string
  description = "The CosmosDB connection string."
}

output "name" {
  value = azurerm_cosmosdb_account.az_cosmosdb_account.name
  description = "The CosmosDB Account name."
  
}