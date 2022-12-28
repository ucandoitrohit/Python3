terraform {
  required_providers {
    azurerm ={
        source ="hashicorp/azurerm"
        version = "2.9.0"
    }
  }
}

provider "azurerm" {
  subscription_id =""
  client_id = ""
  client_secret = ""
  tenant_id = ""
  features {}
}

locals {
  resource_group_name = "app-grp"
  location = "North Europe"
}

#Resource
resource "azurerm_resource_group" "app-grp" {
  Name = locals.resource_group_name
  location = locals.location
} 

resource "azurerm_virtual_network" "app-network" {
  name = "app-network"
  location = local.location
  resource_group_name = local.resource_group_name
  address_space = ["10.0.0.0/16"]

  subnet = {
    name = "SubnetA"
    address_prefix = ["10.0.1.0/24"]
  }
}

