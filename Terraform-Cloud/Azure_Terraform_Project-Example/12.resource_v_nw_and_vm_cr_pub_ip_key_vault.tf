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
data "azurerm_client_config" "current" {
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
    azurerm_subnet.SubnetA,
    azurerm_public_ip.app_public_ip
  ]
}
resource "azurerm_windows_virtual_machine" "appvm" {
  name                  = "appvm"
  resource_group_name   = local.resource_group_name
  location              = local.location
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = azurerm_key_vault_secret.vmpassword.value # In Key Vault by giving hard code here i want to provide password from key Vault
  availability_set_id   = azurerm_availability_set.app_set.id
  network_interface_ids = [
    azurerm_network_interface.app_interface.id,
  ]
  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }
  source_image_reference {
    publisher             = "MicrosoftWindowsServer"
    offer                 = "WindowsServer"
    sku                   = "2019-Datacenter"
    version               = "latest"
  }
  depends_on = [
    azurerm_network_interface.app_interface,
    azurerm_key_vault_secret.vmpassword
  ] 
}

resource "azurerm_public_ip" "app_public_ip" {
  name                = "app-public_ip"
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"
}

# os user and password given in code only now i want to pass the password from key vault

resource "azurerm_key_vault" "app_vault" {
  name                        = "appvault"
  location                    = local.location
  resource_group_name         = local.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "Standard"
  access_policy {
    tenant_id                 = data.azurerm_client_config.current.tenant_id
    object_id                 = data.azurerm_client_config.current.object_id
    key_permissions           = ["get",]
    secret_permissions        = ["get","backup","delete","list","purge","recover","restore","set",]
    storage_permissions       = ["get",]
  }
  depends_on = [
    azurerm_resource_group.app_grp
  ]
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name          = "vmpassword"
  value         = "Azure@123"
  key_vault_id  = azurerm_key_vault.app_vault.id
  depends_on = [
    azurerm_key_vault.app_vault
  ]
}