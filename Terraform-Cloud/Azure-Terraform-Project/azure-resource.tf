provider "azurerm" {
  features {}
  subscription_id = ""
  client_id = ""
  client_secret = ""
  tenant_id = ""

}

############### Create Resource Group if doesn't exist #####################
resource "azurerm_resource_group" "myterraformgroup" {
    name = "myResouceGroup"
    location = "eastus"

    tags ={
        environment ="Demo"
    }
}

################ Create Virtual Network #####################################
resource "azurerm_virtual_network" "myterraformnetwork" {
    name = "myVnet"
    address_space = ["10.0.0.0/16"]
    location = "eastus"
    resource_group_name = azure_resource_group.myterraformgroup.name

    tags ={
        environment ="Demo"
    }

}

################# Create Subnet ############################################
resource "azurerm_subnet" "myterraformsubnet" {
    name = "mySubnet"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azure_virtual_network.myterraformnetwork.name
    address_prefixes = ["10.0..1.0/24"]
}
################# Create Public IP ##########################################
resource "azurerm_public_ip" "myterraformpublic" {
    name = "myPublicIP"
    location = "eastsus"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    allocation_method = "Dynamic"
    tags ={
        environment = "Demo"
    }
}

############### Create Network Security Group and Rule #######################
resource "azurerm_network_security_group" "myterraformnsg" {

    name = "myNetworkSecurityGroup"
    location = "eastus"
    resource_group_name = azure_resource_group.myterraformgroup.name

    security_rule {
        name = "SSH"
        priority = 1001
        direction = "inbound"
        access = "Allow"
        protocol = "tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }
    tags = {
        environment = "Demo"
    }
}

############ Create Network Interface #################################
resource "azurerm_network_interface" "myterraformnic" {
    name = "myNIC"
    location = "eastus"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name = "myNicconfiguration"
        subnet_id = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.myterraformpublic.id
    }
    tags = {
        environment = "Demo"
    }
}

########## Connect the Security Group to Network Interface #########################
resource "azurerm_network_interface_security_group_association" "example"{
    network_interface_id = azurerm_network_interface.myterraformnic.id
    network_security_group_id = azurerm_network_security_group.myterraformnsg.id

}

############ Genrate Randon text for a unique Storage Account Name ################
resource "randon_id" "randonID" {
    keepers ={
        #Generate a new ID only  when  a new resource group is defined
        resource_group =  azurerm_resource_group.myterraformgroup.name
    }
    byte_length = 8
}

############# Create Storage Account for boot diagnostic ###########################
resource "azurerm_storage_account" "mystorageaccount" {
    name = "diag-${random_id.randomID.hex}"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    location = "eastus"
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = {
        environment = "Demo"
    }
}

############ Create and Display a SSH Key ########################
resource "tls_private_key" "ssh-key" {
    algorithm = "RSA"
    rsa_bits = 4096
}
  ##### Display SSH Key ##################
output "tls_priivate_key" {
    value = tls.private_key.ssh-key.private_key_pem
    sensitive = true
}

########### Create Virtual Machine ###################
resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name = "myVM"
    location = "eastus"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size = "Standard_DS1_v2"

    os_disk {
        name = "myosDisk"
        caching = "ReadWrite"
        storgae_account_type = "Premium_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"

    }
    computer_name = "myvm"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username = "azureuser"
        public_key = file("~/.ssh/id_rsa.pub")
    }
    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }
    tags = {
        enviroment = "Demo"
    }
}
