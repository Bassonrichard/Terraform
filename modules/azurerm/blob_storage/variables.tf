variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the blob storage resides in."
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

variable "company_short_code" {
  type        = string
  description = "(Required) The short code of the company."
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the environmnet the blob storage resides in."
}

variable "product" {
  type        = string
  description = "(Optional) The name of product."

  nullable = true
  default = null
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}