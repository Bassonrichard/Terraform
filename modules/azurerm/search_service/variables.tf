variable "name" {
    type        = string
    description = "The name of the search service"
}

variable "resource_group_name" {
    type        = string
    description = "The name of the resource group"
}

variable "location" {
    type        = string
    description = "The location of the search service"
}

variable "sku" {
    type        = string
    description = "The SKU of the search service"

    default = "free"

    validation {
        condition     = contains(["free", "basic", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.sku)
        error_message = "The SKU must be either 'free', 'basic', 'standard', 'standard2', 'standard3', 'storage_optimized_l1', 'storage_optimized_l2'"
    }
}

variable "tags" {
  description = "(Optional) Specifies the tags of the resource"
  type        = map(any)
  default     = {}
}