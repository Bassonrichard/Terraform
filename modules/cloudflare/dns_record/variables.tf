variable "zone_name" {
  type        = string
  description = "The name of the DNS zone."
}

variable "record" {
  type = object({
    name    = string
    content = string
    type    = string
    comment = optional(string)
    proxied = optional(bool, false)
    tags    = optional(list(string))
  })
  description = "Details of the DNS record."

  validation {
    condition     = can(regex("^(A|AAAA|CNAME|TXT|MX|NS|SRV|LOC|SPF|CERT|DNSKEY|DS|KEY|NSEC|RRSIG|TLSA|SMIMEA|URI)$", var.record.type))
    error_message = "Invalid record type."
  }
}