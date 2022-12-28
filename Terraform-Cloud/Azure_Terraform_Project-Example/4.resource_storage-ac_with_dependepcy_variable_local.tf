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

variable "storage_account_name" {
  type = string 
  description = "Please enter the storage account name"
}

locals {
  resource_group_name = "app-grp"
  localtion = "North Europe"
}

#Resource
resource "azurerm_resource_group" "app-grp" {
  Name = locals.resource_group_name
  location = locals.localtion
} 

resource "azurerm_storage_account" "storage_account" {
  Name = var.storage_account_name
  resource_group_name = locals.resource_group_name
  location = locals.location
  access_tier = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
  depends_on = [
    azurerm_resource_group.app_grp
  ]
}

resource "azurerm_storage_container" "data" {
  name = "data"
  storage_account_name = var.storage_account_name
  container_access_type = "private"  # blob , container, private
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}

# this is used to upload a local file onto the container
resource "azurerm_storage_blob" "sample" {
    name ="sample"
    storage_account_name = var.storage_account_name
    storage_container_name = "data"
    type =  "Block"
    source = "./sample.txt"
    depends_on = [
      azurerm_storage_container.data
    ]
  
}

#terraform plan
#It will ask for storage account name 
#terraform apply
