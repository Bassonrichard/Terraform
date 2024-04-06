variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the log analytics workspace is created."
}

variable "location" {
  type        = string
  description = "(Required) The location of the log analytics workspace."
}

variable "name" {
  type        = string
  description = "(Required) Name of the log analytics workspace"
}

variable "sku" {
  type        = string
  description = "(Optional) The SKU of the log analytics workspace. Default is PerGB2018."

  default = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) The retention in days of the log analytics workspace. Default is 30 days."

  default = 30
}

variable "daily_quota_gb" {
  type        = number
  description = "(Optional) The daily quota in GB of the log analytics workspace. Default is 1 GB."

  default = 1
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "(Optional) Is internet ingestion enabled for the log analytics workspace. Default is false."

  default = false
}

variable "internet_query_enabled" {
  type        = bool
  description = "(Optional) Is internet query enabled for the log analytics workspace. Default is true."

  default = true
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = "(Optional) The reservation capacity in GB per day of the log analytics workspace. Default is 0."

  nullable = true
  default  = null
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}
