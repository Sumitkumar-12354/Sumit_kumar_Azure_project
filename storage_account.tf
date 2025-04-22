terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "storageaccount011"
  resource_group_name      = "storage-grp"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}