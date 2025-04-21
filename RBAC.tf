terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

resource "azuread_user" "UserA" {
  user_principal_name = "UserA@sumitkumar71864gmail.onmicrosoft.com"
display_name        = "UserA"
  password            = "Azure@123"
}

resource "azurerm_role_assignment" "Reader_Role" {
  scope                = azurerm_resource_group.app_grp.id
  role_definition_name = "Reader"
  principal_id         = azuread_user.UserA.object_id

depends_on = [
    azurerm_resource_group.app_grp,
    azuread_user.UserA,
  ]
}