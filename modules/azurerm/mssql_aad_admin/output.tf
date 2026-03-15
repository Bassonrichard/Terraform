output "id" {
  value       = azurerm_mssql_server_microsoft_entra_admin.mssql_aad_admin.id
  description = "The ID of the SQL Server Microsoft Entra Admin configuration."
}

output "login_username" {
  value       = azurerm_mssql_server_microsoft_entra_admin.mssql_aad_admin.login_username
  description = "The login username of the Azure AD Administrator."
}

output "object_id" {
  value       = azurerm_mssql_server_microsoft_entra_admin.mssql_aad_admin.object_id
  description = "The object ID of the Azure AD Administrator."
}
