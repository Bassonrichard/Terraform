resource "azurerm_cdn_endpoint_custom_domain" "custom_domain" {
  name            = var.sub_domain
  cdn_endpoint_id = var.cdn_endpoint_id
  host_name       = "${var.sub_domain}.${var.domain_name}"

  cdn_managed_https {
    certificate_type = "Shared"
    protocol_type = "ServerNameIndication"
  }
}