variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the container app resides in."
}

variable "product" {
  type        = string
  description = "(Required) The name of product container app."
}

variable "company_short_code" {
  type        = string
  description = "(Required) The short code of the company."
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the environmnet the container app is in."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "container_registry_name" {
  type        = string
  description = "(Required) The name for the container registry"
}

variable "container_registry_login_server" {
  type        = string
  description = "(Required) The login server for the container registry"
}

variable "container_apps" {
  description = "(Required) Specifies the container apps in the managed environment."
  type = map(object({
    name          = string
    revision_mode = optional(string, "Single")
    registry = optional(object({
      server               = string
      identity             = optional(string)
      password_secret_name = optional(string)
      username             = optional(string)
    }))

    template = object({
      containers = list(object({
        name   = string
        image  = string
        cpu    = optional(number)
        memory = optional(string)
        env = optional(list(object({
          name        = optional(string)
          value       = optional(string)
          secret_name = optional(string)
        })))

        liveness_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })))

          host                             = optional(string)
          initial_delay                    = optional(number)
          interval_seconds                 = optional(number)
          path                             = optional(string)
          port                             = optional(number)
          termination_grace_period_seconds = optional(number)
          timeout                          = optional(number)
          transport                        = optional(string)
        })))

        readiness_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })))

          host                    = optional(string)
          interval_seconds        = optional(number)
          path                    = optional(string)
          port                    = optional(number)
          success_count_threshold = optional(number)
          timeout                 = optional(number)
          transport               = optional(string)
        })))
        startup_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })))
          host                             = optional(string)
          interval_seconds                 = optional(number)
          path                             = optional(string)
          port                             = optional(number)
          termination_grace_period_seconds = optional(number)
          timeout                          = optional(number)
          transport                        = optional(string)
        })))
      }))

      azure_queue_scale_rules = optional(list(object({
        name         = string
        queue_name   = string
        queue_length = number
        authentication = optional(object({
          secret_name       = string
          trigger_parameter = string
        }))
      })))

      custom_scale_rules = optional(list(object({
        name             = string
        custom_rule_type = string
        metadata         = map(string)
        authentication = optional(object({
          secret_name       = string
          trigger_parameter = string
        }))
      })))

      http_scale_rules = optional(list(object({
        name                = string
        concurrent_requests = number
        authentication = optional(object({
          secret_name       = string
          trigger_parameter = string
        }))
      })))

      tcp_scale_rules = optional(list(object({
        name                = string
        concurrent_requests = number
        authentication = optional(object({
          secret_name       = string
          trigger_parameter = string
        }))
      })))

      max_replicas = optional(number, 1)
      min_replicas = optional(number, 0)
    })
    ingress_enabled = optional(bool, false)
    ingress = optional(object({
      external_enabled = optional(bool, true)
      target_port      = optional(number, 80)
      transport        = optional(string, "auto")
      traffic_weight = optional(object({
        percentage      = optional(number, 100)
        latest_revision = optional(bool, true)
      }))
    }))
    secrets = optional(list(object({
      name  = optional(string)
      value = optional(string)
    })))
  }))
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}
