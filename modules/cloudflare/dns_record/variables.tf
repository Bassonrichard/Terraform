variable "zone_name" {
  type        = string
  description = "The name of the DNS zone."
}

variable "record_name" {
  type        = string
  description = "The name of the DNS record."
}

variable "record_value" {
  type        = string
  description = "The value of the DNS record."
}

variable "record_type" {
  type        = string
  description = "The type of the DNS record."

  validation {
    condition     = can(regex("^(A|AAAA|CNAME|TXT|MX|NS|SRV|LOC|SPF|CERT|DNSKEY|DS|KEY|NSEC|RRSIG|TLSA|SMIMEA|URI)$", var.record_type))
    error_message = "Invalid record type."
  }
}