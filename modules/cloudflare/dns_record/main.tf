resource "cloudflare_record" "record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.record_name
  value   = var.record_value
  type    = var.record_type
}