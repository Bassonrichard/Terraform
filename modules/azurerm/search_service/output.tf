output "id" {
  value = azurerm_search_service.search_service.id
  description = "The ID of the Search Service."

}

output "primary_key" {
  value = azurerm_search_service.search_service.primary_key
  description = "The Primary Key of the Search Service."

  sensitive = true
}

output "url" {
  value = "https://${azurerm_search_service.search_service.name}.search.windows.net"
  description = "The URL of the Search Service."
}

output "query_key" {
  value = azurerm_search_service.search_service.query_keys.0.key
  description = "The Query Key of the Search Service."

  sensitive = true
}
