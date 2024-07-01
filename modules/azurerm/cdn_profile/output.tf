output "fqdn" {
  value = azurerm_cdn_endpoint.cdn_endpoint.fqdn
  description = "The fully qualified domain name of the CDN Endpoint."
}

output "cdn_endpoint_id" {
  value = azurerm_cdn_endpoint.cdn_endpoint.id
  description = "The ID of the CDN Endpoint."
}