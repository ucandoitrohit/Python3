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
  client_id = "Application ID"
  client_secret = "Client Secret ID"
  tenant_id = "Tenant ID"
  features {}
}

locals {
  resource_group_name = "app_grp"
  location = "North Europe"
}

#Resource
resource "azurerm_resource_group" "app_grp" {
  Name = locals.resource_group_name
  location = locals.location
} 

resource "azurerm_virtual_network" "app_network" {
  name = "app_network"
  location = local.location
  resource_group_name = local.resource_group_name.Name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "SubnetA" {
  name = "SubnetA"
  resource_group_name = local.resource_group_name.Name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.app_network
  ]
}



resource "azurerm_network_interface" "app_interface" {
  name = "app_interface"
  location = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.app_public_ip.id
  }
  depends_on = [
    azurerm_virtual_network.app_network,
    azurerm_subnet.SubnetA,
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
  availability_set_id = azurerm_availability_set.app_set.id
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
    azurerm_network_interface.app_interface,
    azurerm_availability_set.app_set
  ]
  
}

resource "azurerm_public_ip" "app_public_ip" {
  name = "app-public_ip"
  resource_group_name = local.resource_group_name
  location = local.location
  allocation_method = "Static"
}

resource "azurerm_managed_disk" "data_disk" {
  name ="data-disk"
  resource_group_name = local.resource_group_name
  location = local.location
  storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = 16
}

# We need to attach the data disk to azure vm appvm
resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  managed_disk_id = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.appvm.id
  lun = "0"
  caching = "ReadWrite"
  depends_on = [
    azurerm_windows_virtual_machine.appvm,
    azurerm_managed_disk.data_disk

  ]
  
}

resource "azurerm_availability_set" "app_set" {
  name = "app-set"
  resource_group_name = local.resource_group_name
  location = local.location
  platform_fault_domain_count = 3
  platform_update_domain_count = 3
  depends_on = [
    azurerm_resource_group.app_grp
  ]
 }


resource "azurerm_storage_account" "appstore" {
  Name = "appstore"
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
  storage_account_name = "appstore"
  container_access_type = "blob"  # blob , container, private
  depends_on = [
    azurerm_storage_account.appstore
  ]
}

# Here we are uploading out IIS configuration script as a blob to azure storage account
resource "azurerm_storage_blob" "IIS_Config" {
    name ="IIS_Config"
    storage_account_name = "appstore"
    storage_container_name = "data"
    type =  "Block"
    source = "./IIS_Config.ps1"
    depends_on = [
      azurerm_storage_container.data
    ]
  
}

resource "azurerm_virtual_machine_extension"  "vm_extension" { 
  name ="appvm-extension"
  virtual_machine_id = azurerm_windows_virtual_machine.appvm.id
  publisher = "Microsoft.Compute"
  type = "CustomScriptExtension"
  type_handler_version = "1.10"
  depends_on = [
    azurerm_storage_blob.IIS_Config
  ]

  settings = <<SETTINGS
  {
    "fileUris": ["https://${azurerm_storage_account.appstore.name}.blob.core.windows.net/data/IIS_Config.ps1"],
    "commandToExecute":"powershell -ExecutionPolicy Unrestricted -file IIS_Config.ps1"
  }
  SETTINGS
}