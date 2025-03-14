resource "azurerm_key_vault_secret" "secrets" {

  depends_on = [
    data.azurerm_key_vault.key_vault
  ]
  
  for_each = var.secrets

  name            = each.value.name
  value           = each.value.secret
  expiration_date = each.value.expiration_date

  key_vault_id = data.azurerm_key_vault.key_vault.id
}