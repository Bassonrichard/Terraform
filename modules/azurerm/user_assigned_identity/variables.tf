variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "name" {
  type        = string
  description = "(Required) Name of the identity."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group."
}

variable "location" {
  type        = string
  description = "(Required) location of the resource group."
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}