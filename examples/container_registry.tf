module "container_registry" {
  source = ""

  depends_on = [
    module.resource_groups
  ]

  container_registries = {
    container_registry = {
      name                = local.container_registry_name
      resource_group_name = local.container_registry_resource_group_name
      location            = var.location
      sku                 = "Standard"
      admin_enabled       = false

      tags = var.tags
    }
  }
}