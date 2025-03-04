resource "azurerm_role_assignment" "role_assignment" {

  scope                = var.resource_scope_id
  role_definition_name = var.role_definition_name
  principal_id         = var.user_assigned_identity_id

}