Import-Module ServerManager
Add-Windowsfeature Web-Server -includeallsubfeature
Add-Windowsfeature Web-Asp-Net45
Add-Windowsfeature NET-Framework-features