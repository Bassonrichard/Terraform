resource "cloudflare_dns_record" "record" {

  depends_on = [
    data.cloudflare_zone.zone
  ]

  zone_id = data.cloudflare_zone.zone.id
  name    = var.record.name
  content = var.record.content
  type    = var.record.type
  comment = var.record.comment
  proxied = var.record.proxied 
  ttl     = var.record.ttl 


  tags = var.record.tags
}