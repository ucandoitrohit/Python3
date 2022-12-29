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
   site_config {    
    dotnet_framework_version = "v6.0"
  }
   source_control {
    repo_url           = ""
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }
}
