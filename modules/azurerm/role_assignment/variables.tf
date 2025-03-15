variable "resource_scope_id" {
    type        = string
    description = "The ID of the resource scope where the role assignment will be applied."
}

variable "role_definition_name" {
    type        = string
    description = "The name of the role definition to assign."
}

variable "principal_id" {
    type        = string
    description = "The ID of the user-assigned identity to assign the role to."
}