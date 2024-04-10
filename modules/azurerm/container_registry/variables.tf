variable "name" {
  type        = string
  description = "(Required) The name of the container registry."

  validation {
    condition     = length(var.name) < 47 || length(var.name) > 5
    error_message = "The name of the container registry must be between 5 and 47 characters in length."
  }
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the container registry."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "sku" {
  type        = string
  description = "(Optional) Specifies the sku of the container registry. Default is Basic. Possible values are Basic, Standard, and Premium."

  default = "Basic"

  validation {
    condition     = contains(var.sku, ["Basic", "Standard", "Premium"])
    error_message = "The sku value must be one of Basic, Standard, or Premium."
  }
}

variable "admin_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."

  default = false
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}
