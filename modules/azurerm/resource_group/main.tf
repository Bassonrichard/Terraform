locals {
  name = "${name_prefix}-${var.name}-rg"
}

resource "azurerm_resource_group" "az_rg" {

  name     = local.name
  location = var.location
  tags     = var.tags
}
