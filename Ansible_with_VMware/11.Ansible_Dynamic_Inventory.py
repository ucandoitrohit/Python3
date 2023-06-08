# Ansible Dynamic Inventory for VMware

#You can automate listing the virtual machines in your VMware infrastructure using the vmware_vm_inventory Ansible #Inventory plugin. One of the advantages of this plugin is that you can use the dynamic listing as an Ansible inventory #for your execution. Inventory plugins allow you to expand the capabilities of your Ansible by creating a listing of the #target nodes on the fly from a specified data source. 

#Ansible vmware_vm_inventory
#   community.vmware.vmware_vm_inventory

#The Ansible Inventory Plugin queries your VMware infrastructure via the VMware APIs and returns to Ansible a list of #virtual machines that can be used as target nodes. The purpose is to get virtual machines as inventory hosts from the #Mware environment. In this way, you can execute your Ansible automation to all your virtual machines, for example. #Please note that the inventory YAML configuration file MUST end with vmware.yml, vmware.yaml, vmware_vm_inventory.yml, #or vmware_vm_inventory.yaml file names. The full name is community.vmware.vmware_vm_inventory, which means that it is #part of the collection of modules that interact with VMware and is community supported.


1. Step
In this example, you are going to list all the available virtual machines and specifically the myvm test machine created earlier in this book.

The first step is to specifically enable the vmware_vm_inventory Ansible Inventory Plugin in your configuration file. You can enable it via ansible.cfg in the current path or system-wide via /etc/ansible/ansible.cfg. Simply add the vmware_vm_inventory plugin name inside the key enable_plugins in the inventory section.

ansible.cfg


[inventory]
enable_plugins = vmware_vm_inventory

2. Step
The second step is to create the data source with your VMware infrastructure connection parameters. The following is a simple YAML data source to list all the virtual machines that connect to vmware.example.com VMware vSphere with a given username and password and to disable the SSL certificate validation (for self-signed certificates). It enables group mapping of the results by VMware virtual machines. It disables tags associated with the VMware virtual machines (requires vSphere Automation SDK Python library).

inventory.vmware.yml


plugin: vmware_vm_inventory
strict: False
hostname: vmware.example.com
username: username@vsphere.local
password: MySecretPassword123
validate_certs: False
with_tags: False
groups:
  VMs: True


The default view output shows all the available VMware properties associated with the VMware virtual machine. 
Specifying the properties parameter in the YAML data source, you can display only the ones needed, such as name,
 config.cpuHotAddEnabled, config.cpuHotRemoveEnabled, config.instanceUuid, config.hardware.numCPU, config.template,
  config.name, config.uuid, guest.hostName, guest.ipAddress, guest.guestId, guest.guestState, runtime.maxMemoryUsage,
   customValue, summary.runtime.powerState, and config.guestId. Here is an example of the properties parameter to 
   display only the power state and the name of the virtual machine:


properties:
  - 'runtime.powerState'
  - 'config.name'




Another useful parameter is filters, which allows you to search only for virtual machines in a particular state. Here is an example of the filters parameter to search only the virtual machine in a powered-on state:


filters:
  - runtime.powerState == "poweredOn"
Here is an example of the filters parameter to search only for the virtual machine with a specific operating system class:


filters:
  - config.guestId == "rhel7_64Guest"

  

