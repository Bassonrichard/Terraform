resource "azurerm_user_assigned_identity" "az_user_assigned_identity" {
  name                = "${var.name_prefix}-${var.name}-uaid"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}