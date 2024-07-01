output "fqdn" {
  value = azurerm_cdn_endpoint.cdn_endpoint.fqdn
  description = "The fully qualified domain name of the CDN Endpoint."
  
}