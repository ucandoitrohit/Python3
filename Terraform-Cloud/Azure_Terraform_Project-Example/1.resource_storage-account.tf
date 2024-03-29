terraform {
  required_providers {
    azurerm = {
        source ="hashicorp/azurerm"
        version = "2.9.0"
    }
  }
}

provider "azurerm" {
  subscription_id =""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

resource "azurerm_resource_group" "app-grp" {
  Name      ="app-grp"
  location  = "North Europe"
}

resource "azurerm_storage_account" "storage_account" {
  Name                      ="terraformstorage"
  resource_group_name       = "app-grp"
  location                  = "North Europe"
  access_tier               = "Standard"
  account_replication_type  = "LRS"
  allow_blob_public_access  = true
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "terraformstorage"
  container_access_type = "private"  # blob , container, private
}

# this is used to upload a local file onto the container
resource "azurerm_storage_blob" "sample" {
    name                    = "sample"
    storage_account_name    =  "terraformstorage"
    storage_container_name  = "data"
    type                    = "Block"
    source                  = "./sample.txt"
  }