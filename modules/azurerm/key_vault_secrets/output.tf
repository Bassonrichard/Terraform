output "resource_id"{
   value = {
    for secret in azurerm_key_vault_secret.secrets :
    "${secret.name}" => secret.resource_id
  }
  description = "- The (Versioned) ID for this Key Vault Secret. This property points to a specific version of a Key Vault Secret, as such using this won't auto-rotate values if used in other Azure Services."
}

output "resource_versionless_id"{
  value = {
    for secret in azurerm_key_vault_secret.secrets :
    "${secret.name}" => secret.resource_versionless_id
  }
  description = "The Versionless ID of the Key Vault Secret. This property allows other Azure Services (that support it) to auto-rotate their value when the Key Vault Secret is updated."
}