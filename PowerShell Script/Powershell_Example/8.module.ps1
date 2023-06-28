$env:PSModulePath
#Get-Module
#Get-Module -ListAvailable
Import-Module -Name WindowsSearch
Import-Module -Name WindowsSearch -Force
Get-Command -Module WindowsSearch
Get-WindowsSearchSetting
Remove-Module -Name WindowsSearch

New-ModuleManifest -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\ModuleConfig\ModuleConfig.psd1" -Author "Rohit Vishwakarma" -Description "Example for Creating Module" -RootModule "ModuleConfig.psm1"

#Copy the ModuleConfig Folder and paste at $env:PSModulePath (C:\Program Files\WindowsPowerShell\Modules)


Get-Module -Name ModuleConfig -ListAvailable
Import-Module -Name ModuleConfig

Get-Configuration
Set-Configuration
Remove-Configuration


Remove-Module -Name ModuleConfig


Find-Module -Name AzureAD
Install-Module -Name AzureAD
Import-Module -Name AzureAD

Get-Command -Module AzureAD




