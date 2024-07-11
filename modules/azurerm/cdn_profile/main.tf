locals {
  name = "${var.name_prefix}-${var.name}-cdn"
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

  origin_host_header = var.origin.host_name
  origin {
    name      = var.origin.name
    host_name = var.origin.host_name
  }
}