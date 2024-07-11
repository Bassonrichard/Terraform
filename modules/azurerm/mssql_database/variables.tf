variable "name_prefix" {
  description = "The prefix to use for all resources"
  type        = string

}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the mssql database."
}


variable "location" {
  type        = string
  description = "(Required) Specifies the location of the resource."
}

variable "db_server" {
  type = object({
    version             = optional(string, "12.0")
    minimum_tls_version = optional(string, "1.2")
    administrator_login = optional(string, "sa-admin")
  })

  default = {
    version             = "12.0"
    minimum_tls_version = "1.2"
    administrator_login = "sa-admin"
  }
}

variable "database" {
  type = object({
    collation            = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    max_size_gb          = optional(number, 32)
    sku_name             = optional(string, "GP_S_Gen5_2")
    zone_redundant       = optional(bool, false)
    storage_account_type = optional(string, "Local")
  })

  default = {
    collation            = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb          = 32
    sku_name             = "GP_S_Gen5_2"
    zone_redundant       = false
    storage_account_type = "Local"
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
}
