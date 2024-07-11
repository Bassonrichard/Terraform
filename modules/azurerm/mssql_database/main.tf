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
    random_password.password,
    azurerm_resource_group.database_rg
  ]

  name                         = "${var.name_prefix}-sqlserver"
  resource_group_name          = "${var.name_prefix}-database-rg"
  location                     = var.location
  version                      = var.db_server.version
  minimum_tls_version          = var.db_server.minimum_tls_version
  administrator_login          = "${var.name_prefix}-SA"
  administrator_login_password = random_password.password.result

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  primary_user_assigned_identity_id = var.user_assigned_identity_id
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


resource "azurerm_mssql_firewall_rule" "container_app_firewall_rule" {

  depends_on = [azurerm_mssql_server.az_mssql_server]

  for_each = var.firewall_rules

  name             = "${each.key}-fw-rule"
  server_id        = azurerm_mssql_server.az_mssql_server.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
