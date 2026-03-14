resource "azurerm_application_insights" "az_application_insights" {
  name                  = "${var.name_prefix}-appin"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_id = var.workspace_resource_id
  application_type      = var.application_type
  retention_in_days     = var.retention_in_days

  tags = var.tags
}
