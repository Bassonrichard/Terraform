output "id" {
  value = azurerm_search_service.search_service.id
}

output "primary_key" {
  value = azurerm_search_service.search_service.primary_key
}

output "url" {
  value = "https://${azurerm_search_service.search_service.name}.search.windows.net"
}

output "query_keys" {
  value = azurerm_search_service.search_service.query_keys
}