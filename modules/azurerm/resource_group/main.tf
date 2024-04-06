resource "azurerm_resource_group" "az_rg" {

  name     = "${var.company_short_code}-${var.product}-${var.environment_name}-${var.name}-rg"
  location = var.location
  tags     = var.tags
}
