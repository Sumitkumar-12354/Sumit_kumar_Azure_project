terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "virtual-network-01"
  location            = "Central India"
  resource_group_name = "virtual-netwok-grp"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet01"
    address_prefixes = ["10.0.1.0/24"]
  }

}


