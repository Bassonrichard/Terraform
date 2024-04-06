module "container_app_environments" {
  source = ""

  depends_on = [
    module.subnets,
    module.cosmosdb,
    module.storage_account
  ]

  container_app_environments = {
    container_app_environment = {
      name                           = local.container_apps_environment_name
      location                       = var.location
      resource_group_name            = local.compute_resource_group_name
      log_analytics_workspace_id     = module.log_analytics_workspaces.ids[local.law_name]
      infrastructure_subnet_id       = module.subnets.ids["${local.subnet_name}-container"]
      internal_load_balancer_enabled = true
      tags                           = var.tags
    }
  }
}

module "container_apps" {
  source = ""

  depends_on = [
    module.container_app_environments,
    module.servicebus_namespace,
    #   module.key_vaults
  ]

  resource_group_name          = local.compute_resource_group_name
  container_app_environment_id = module.container_app_environments.ids[local.container_apps_environment_name]

  for_each = var.container_apps
  container_apps = {
    "${each.key}" = {
      name          = "${local.container_app_name_prefix}-${each.value.name}"
      revision_mode = "Single"
      identity = {
        type = "UserAssigned"
        identity_ids = [
          module.user_assigned_identity.ids[local.container_apps_uai_name]
        ]
      }
      registry = {
        server   = data.azurerm_container_registry.container_registry.login_server
        identity = module.user_assigned_identity.ids[local.container_apps_uai_name]
      }
      template = {
        containers = [{
          name   = each.value.container_name
          image  = "${local.container_registry_name}.azurecr.io/${each.value.image}:${each.value.tag}"
          cpu    = each.value.cpu
          memory = each.value.memory
          env    = try(concat(each.value.env, local.container_app_env), local.container_app_env)
          # startup_probe = each.value.ingress_enabled? local.container_app_startup_probe: []
          # liveness_probe = each.value.ingress_enabled? local.container_app_liveness_probe: []
          # readiness_probe = each.value.ingress_enabled? local.container_app_readiness_probe: []
        }]

        azure_queue_scale_rules = try(each.value.azure_queue_scale_rules, [])
        custom_scale_rules = local.container_app_scaling_rules
        http_scale_rules   = each.value.ingress_enabled ? local.container_app_http_scaling_rules : []
        tcp_scale_rules         = try(each.value.tcp_scale_rules, [])

        max_replicas = each.value.max_replicas
        min_replicas = each.value.min_replicas
      }

      ingress = each.value.ingress_enabled ? {
        external_enabled = true
        target_port      = 80
        transport        = "auto"
        traffic_weight = {
          percentage      = 100
          latest_revision = true
        }
      } : null

      secrets = try(concat(each.value.secrets, local.container_app_secrets), local.container_app_secrets)

      tags = var.tags
    }
  }
}