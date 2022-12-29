# In Key Vault by giving hard code here i want to provide password from key Vault
terraform {
  required_providers {
    azurerm ={
        source ="hashicorp/azurerm"
        version = "2.9.0"
    }
  }
}
provider "azurerm" {
  subscription_id ="Subscription ID"
  client_id       = "Application ID"
  client_secret   = "Client Secret ID"
  tenant_id       = "Tenant ID"
  features {}
}

locals {
  resource_group="app-grp"
  location="North Europe"
}


resource "azurerm_resource_group" "app_grp"{
  name=local.resource_group
  location=local.location
}

resource "azurerm_sql_server" "app_server_6008089" {
  name                          = "appserver6008089"
  resource_group_name           = local.azurerm_resource_group
  location                      = local.location
  version                       = "12.0"
  administrator_login           = "sqladmin"
  administrator_login_password  = "Azure@123"
}

resource "azurerm_sql_database" "app_db" {
  name                = "appdb"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = local.location
  server_name         = azurerm_sql_server.app_server_6008089.name
   depends_on = [
     azurerm_sql_server.app_server_6008089
   ]
}

# To connect from outside we need to pass rule
resource "azurerm_sql_firewall_rule" "app_server_firewall_rule" {
  name                = "app-server-firewall-rule"
  resource_group_name = azurerm_resource_group.app_grp.name
  server_name         = azurerm_sql_server.app_server_6008089.name
  start_ip_address    = "10.0.17.62" # put your ip address https://whatismyipaddress.com/
  end_ip_address      = "10.0.17.62" # put your ip address https://whatismyipaddress.com/
  depends_on = [
    azurerm_sql_server.app_server_6008089
  ]
}