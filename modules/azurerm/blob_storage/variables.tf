variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the blob storage resides in."
}

variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "name" {
  type        = string
  description = "(Required) The name of the blob storage."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the blob storage."
}

variable "storage_containers" {
  type       = list(object({
    name                  = string
    container_access_type = string
  }))
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}