variable "zone_name" {
  type        = string
  description = "The name of the DNS zone."
}

variable "name" {
  type        = string
  description = "Name of the ruleset."
}

variable "hostname" {
  type        = string
  description = "The hostname to match on (e.g. assets.recipe-nook.com)."
}

variable "origin_host" {
  type        = string
  description = "The Host header value to send to the origin."
}
