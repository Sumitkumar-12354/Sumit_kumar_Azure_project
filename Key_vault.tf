terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

resource "azurerm_key_vault" "Key_vault" {
  name                        = "key-vault-01"
  location                    = "Central India"
  resource_group_name         = "key-vault-grp"
  enabled_for_disk_encryption = true
  tenant_id                   = "98d538d4-c6b3-4e25-ac80-b48b6eb97dba"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true

  sku_name = "standard"

  access_policy {
    tenant_id = "98d538d4-c6b3-4e25-ac80-b48b6eb97dba"
    object_id = "78f58076-2458-44f7-a4f3-f43ad50e9715"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}