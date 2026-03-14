output "connection_string" {
  value       = azurerm_application_insights.az_application_insights.connection_string
  sensitive   = true
  description = "The connection string for the Application Insights instance."
}

output "instrumentation_key" {
  value       = azurerm_application_insights.az_application_insights.instrumentation_key
  sensitive   = true
  description = "The instrumentation key for the Application Insights instance."
}

output "id" {
  value       = azurerm_application_insights.az_application_insights.id
  description = "The resource ID of the Application Insights instance."
}
