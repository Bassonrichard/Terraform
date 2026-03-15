variable "server_id" {
  type        = string
  description = "(Required) The resource ID of the SQL Server to set the Entra admin for."
}

variable "login_username" {
  type        = string
  description = "(Required) The login username of the Azure AD Administrator."
  default     = "aad-admin"
}
