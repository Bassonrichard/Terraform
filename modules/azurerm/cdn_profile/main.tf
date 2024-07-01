locals {
  name = var.product == null ? "${var.company_short_code}-${var.environment_name}-${var.name}-cdn" : "${var.company_short_code}-${var.product}-${var.environment_name}-${var.name}-cdn"
}


resource "azurerm_cdn_profile" "cdn_profile" {
  name                = local.name
  resource_group_name = var.resource_group_name

  location = var.location
  sku      = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = "${local.name}-endpoint"
  profile_name        = azurerm_cdn_profile.cdn_profile.name
  location            = var.location
  resource_group_name = var.resource_group_name

  origin {
    name      = var.origin.name
    host_name = var.origin.host_name
  }
}