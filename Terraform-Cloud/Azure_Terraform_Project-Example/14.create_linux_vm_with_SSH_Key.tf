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
  resource_group_name = "app_grp"
  location            = "North Europe"
}

resource "tls_private_key" "linux_key" {
  algorithm   = "RSA"
  rsa_bits    = 4096
}

# We want to save the private key to our machine
# We can then use this key to connect to our Linux VM

resource "local_file" "linuxkey" {
  filename      = "linuxkey.pem"  
  content       = tls_private_key.linux_key.private_key_pem 
}

#Resource
resource "azurerm_resource_group" "app_grp" {
  Name     = locals.resource_group_name
  location = locals.location
} 

resource "azurerm_virtual_network" "app_network" {
  name                = "app_network"
  location            = local.location
  resource_group_name = local.resource_group_name.Name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "SubnetA" {
  name                 = "SubnetA"
  resource_group_name  = local.resource_group_name.Name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.app_network
  ]
}
resource "azurerm_network_interface" "app_interface" {
  name                = "app_interface"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app_public_ip.id
  }
  depends_on = [
    azurerm_virtual_network.app_network,
    azurerm_public_ip.app_public_ip
  ]
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "linuxvm"
  resource_group_name = local.resource_group
  location            = local.location
  size                = "Standard_D2s_v3"
  admin_username      = "linuxusr"  
  network_interface_ids = [
    azurerm_network_interface.app_interface.id,
  ]
  admin_ssh_key {
    username   = "linuxusr"
    public_key = tls_private_key.linux_key.public_key_openssh
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher   = "Canonical"
    offer       = "UbuntuServer"
    sku         = "18.04-LTS"
    version     = "latest"
  }

  depends_on = [
    azurerm_network_interface.app_interface,
    tls_private_key.linux_key
  ]
}

resource "azurerm_public_ip" "app_public_ip" {
  name                = "app-public-ip"
  resource_group_name = local.resource_group
  location            = local.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.app_grp
  ]
}