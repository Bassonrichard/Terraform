output "cdn_endpoint" {
  value       = "https://${var.sub_domain}.${var.domain_name}"
  description = "Id of the container registry."
}
