variable "name_prefix" {
  type        = string
  description = "(Required) The prefix to use for all resources."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the Application Insights instance resides in."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "workspace_resource_id" {
  type        = string
  description = "(Required) The resource ID of the Log Analytics Workspace."
}

variable "application_type" {
  type        = string
  description = "(Optional) The application type. Defaults to 'web'."
  default     = "web"
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) Retention period in days. Defaults to 90."
  default     = 90
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Specifies the tags of the resource."
  default     = {}
}
