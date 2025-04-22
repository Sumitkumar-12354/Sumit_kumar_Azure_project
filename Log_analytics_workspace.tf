terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "a62a480a-62d9-4e21-822b-77b73bd248e4"
  features {}
}

resource "azurerm_resource_group" "app_grp" {
  name     = "app-grp"
  location = "Central India"
}

resource "azurerm_log_analytics_workspace" "vm_workspace" {
  name                = "vm-workspace0377"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.vm_workspace.workspace_id
}

resource "azurerm_log_analytics_datasource_windows_event" "collect_event" {
  name                = "collect-event"
  resource_group_name = azurerm_resource_group.app_grp.name
  workspace_name      = azurerm_log_analytics_workspace.vm_workspace.name
  event_log_name      = "Application"
  event_types         = ["Error"]
}
