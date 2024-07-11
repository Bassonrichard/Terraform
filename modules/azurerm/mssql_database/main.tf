resource "random_password" "password" {
  length           = 32
  special          = true
  override_special = "#%$"
  upper            = true
  lower            = true
  numeric          = true
}

resource "azurerm_mssql_server" "az_mssql_server" {

  depends_on = [
    random_password.password
  ]

  name                         = "${var.name_prefix}-sqlserver"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.db_server.version
  minimum_tls_version          = var.db_server.minimum_tls_version
  administrator_login          = var.db_server.administrator_login
  administrator_login_password = random_password.password.result
}

resource "azurerm_mssql_database" "az_mssql_database" {

  depends_on = [azurerm_mssql_server.az_mssql_server]

  name         = "${var.name_prefix}-db"
  server_id    = azurerm_mssql_server.az_mssql_server.id
  collation    = var.database.collation
  license_type = var.database.license_type
  max_size_gb  = var.database.max_size_gb
  sku_name     = var.database.sku_name

  tags = var.tags
}