resource "cloudflare_ruleset" "origin_rule" {
  zone_id = data.cloudflare_zone.zone.zone_id
  name    = var.name
  phase   = "http_request_origin"
  kind    = "zone"

  rules = [
    {
      description = "Rewrite Host header for ${var.hostname}"
      expression  = "(http.host eq \"${var.hostname}\")"
      action      = "route"
      action_parameters = {
        host_header = var.origin_host
      }
      enabled = true
    }
  ]
}
