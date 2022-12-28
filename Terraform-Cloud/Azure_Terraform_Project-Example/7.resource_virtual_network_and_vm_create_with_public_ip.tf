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

data "azurerm_subnet" "SubnetA" {
  name = "SubnetA"
  virtual_network_name = "app-network"
  resource_group_name = local.resource_group_name
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


resource "azurerm_network_interface" "app_interface" {
  name = "app_interface"
  location = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.app_public_ip.id
  }
  depends_on = [
    azurerm_virtual_network.app-network,
    azurerm_public_ip.app_public_ip
  ]
}

resource "azurerm_windows_virtual_machine" "appvm" {
  name = "appvm"
  resource_group_name = local.resource_group_name
  location = local.location
  size = "Standard_D2s_v3"
  admin_username = "adminuser"
  admin_password = "Password"
  network_interface_ids = [
    azurerm_network_interface.app_interface.id,
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2019-Datacenter"
    version = "latest"
 
  }
  depends_on = [
    azurerm_network_interface.app_interface
  ]
  
}

resource "azurerm_public_ip" "app_public_ip" {
  name = "app-public_ip"
  resource_group_name = local.resource_group_name
  location = local.location
  allocation_method = "Static"
}
