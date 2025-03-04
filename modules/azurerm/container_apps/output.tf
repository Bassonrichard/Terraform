output "latest_revision_fqdns" {
  value = {
    for container_app in azurerm_container_app.az_container_app : "${container_app.name}" => container_app.latest_revision_fqdn
  }
  description = "The FQDN of the Latest Revision of the Container App."
}

output "fqdn" {
  value = {
    for container_app in azurerm_container_app.az_container_app :
    "${container_app.name}" =>
    length(container_app.ingress) > 0 ? container_app.ingress[0].fqdn : "Ingress Not Enabled"
  }
  description = "The FQDN of the Container App. Returns 'Ingress Not Enabled' if ingress is not configured."
}

output "principal_id"{
   value = {
    for container_app in azurerm_container_app.az_container_app :
    "${container_app.name}" =>
    length(container_app.identity) > 0 ? container_app.identity[0].principal_id: "Identity Not Enabled"
  }
  description = "The Principal ID of the Container App's identity. Returns 'Identity Not Enabled' if identity is not configured."
}W