locals {
  name = var.product == null ? "${var.company_short_code}-${var.environment_name}-${var.name}-rg" : "${var.company_short_code}-${var.product}-${var.environment_name}-${var.name}-rg"
}

resource "azurerm_resource_group" "az_rg" {

  name     = local.name
  location = var.location
  tags     = var.tags
}
