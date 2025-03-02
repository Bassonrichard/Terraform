resource "cloudflare_record" "record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.record.name
  content = var.record.content
  type    = var.record.type
  comment = var.record.comment
  proxied = var.record.proxied 


  tags = var.record.tags
}