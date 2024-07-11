variable "name_prefix" {
  description = "The prefix to use for all resources"
  type        = string

}

variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}


variable "user_assigned_identity_id" {
  type        = string
  description = "The ID of the user assigned identity to use for the database server"
}

variable "db_server" {
  type = object({
    version             = optional(string, "12.0")
    minimum_tls_version = optional(string, "1.2")
  })

  nullable = true
}

variable "database" {
  type = object({
    collation    = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    license_type = optional(string, "LicenseIncluded")
    max_size_gb  = optional(number, 32)
    sku_name     = optional(string, "GP_S_Gen5")
  })
}

variable "firewall_rules" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
}
