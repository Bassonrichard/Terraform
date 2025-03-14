variable "secrets" {
  type        = map(object({
    secret           = string
    expiration_date = optional(string)
  }))
  description = "(Required) The list of secrets."
}

variable "key_vault" {
  type = object({
    name                = string
    resource_group_name = string
  })
  description = "(Required) Key vault configuration variables."
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}