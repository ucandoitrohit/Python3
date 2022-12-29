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

resource "azurerm_app_service_plan" "app_plan1000" {
  name                = "app-plan1000"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "webapp2530050"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name
  app_service_plan_id = azurerm_app_service_plan.app_plan1000.id
     source_control {
    repo_url           = ""
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }
  depends_on=[azurerm_app_service_plan.app_plan1000]
}

resource "azurerm_sql_server" "app_server_6008089" {
  name                         = "appserver6008089"
  resource_group_name          = azurerm_resource_group.app_grp.name
  location                     = "North Europe"  
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Azure@123"
}

resource "azurerm_sql_database" "app_db" {
  name                = "appdb"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = "North Europe"  
  server_name         = azurerm_sql_server.app_server_6008089.name
   depends_on = [
     azurerm_sql_server.app_server_6008089
   ]
}

resource "azurerm_sql_firewall_rule" "app_server_firewall_rule_Azure_services" {
  name                = "app-server-firewall-rule-Allow-Azure-services"
  resource_group_name = azurerm_resource_group.app_grp.name
  server_name         = azurerm_sql_server.app_server_6008089.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
  depends_on=[
    azurerm_sql_server.app_server_6008089
  ]
}

resource "azurerm_sql_firewall_rule" "app_server_firewall_rule_Client_IP" {
  name                = "app-server-firewall-rule-Allow-Client-IP"
  resource_group_name = azurerm_resource_group.app_grp.name
  server_name         = azurerm_sql_server.app_server_6008089.name
  start_ip_address    = "2.49.123.3"
  end_ip_address      = "2.49.123.3"
  depends_on=[
    azurerm_sql_server.app_server_6008089
  ]
}

resource "null_resource" "database_setup" {
  provisioner "local-exec" {
      command = "sqlcmd -S appserver6008089.database.windows.net -U sqladmin -P Azure@123 -d appdb -i init.sql"
  }
  depends_on=[
    azurerm_sql_server.app_server_6008089
  ]
}