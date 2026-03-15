data "azurerm_client_config" "current" {}

resource "azurerm_mssql_server_microsoft_entra_admin" "mssql_aad_admin" {
  server_id      = var.server_id
  login_username = var.login_username
  object_id      = data.azurerm_client_config.current.object_id
  tenant_id      = data.azurerm_client_config.current.tenant_id
}
