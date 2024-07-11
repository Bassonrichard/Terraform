variable "name" {
  type        = string
  description = "(Required) The name of the resource group."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource group."
}

variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}