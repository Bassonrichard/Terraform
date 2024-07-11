resource "azurerm_mssql_firewall_rule" "container_app_firewall_rule" {

  depends_on = [azurerm_mssql_server.az_mssql_server]

  for_each = var.firewall_rules

  name             = "${each.key}-fw-rule"
  server_id        = azurerm_mssql_server.az_mssql_server.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}