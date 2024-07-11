output "database_password" {
  value = random_password.password.result
}

output "fully_qualified_domain_name" {
    value = azurerm_mssql_server.az_mssql_server.fully_qualified_domain_name
}

output "database_name" {
  value = azurerm_mssql_database.az_mssql_database.name
}

output "administrator_login" {
  value = azurerm_mssql_server.az_mssql_server.administrator_login
}