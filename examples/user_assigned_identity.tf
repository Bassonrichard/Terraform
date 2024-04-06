module "user_assigned_identity" {
  source = ""

  depends_on = [
    module.resource_groups
  ]

  identities = {
    container_app_identity = {
      name                = local.container_apps_uai_name
      resource_group_name = local.identity_resource_group_name
      location            = var.location
    },
    application_gw_identity = {
      name                = local.application_gw_uai_name
      resource_group_name = local.identity_resource_group_name
      location            = var.location
    }
  }

  tags = var.tags

}

#module "role_assignments" {
#  source = ""
#
#  depends_on = [
#    module.resource_groups
#  ]

#  role_assignment = {
#    container_registry_pull_identity = {
#      scope                = data.azurerm_container_registry.container_registry.id
#      role_definition_name = "AcrPull"
#      principal_id         = module.user_assigned_identity.principal_ids[local.container_apps_uai_name]
#    }
#  }

#  tags = var.tags
#}