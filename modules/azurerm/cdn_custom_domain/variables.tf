variable "domain_name" {
  type        = string
  description = "(Required) The name of the custom domain."
}

variable "sub_domain" {
  type        = string
  description = "(Required) The subdomain of the custom domain."
}

variable "cdn_endpoint_id" {
  type        = string
  description = "(Required) The name of the CDN Profile."
}