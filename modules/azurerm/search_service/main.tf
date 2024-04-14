resource "azurerm_search_service" "search_service" {
  name                = "${var.name}-search"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  authentication_failure_mode = "http403"
}