variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the cdn profile resides in."
}

variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "name" {
  type        = string
  description = "(Required) The name of the bcdn profile."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the cdn profile."
}

variable "origin" {
  type = object({
    name      = string
    host_name = string
  })
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}
