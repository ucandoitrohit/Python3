$filepath='E:\python_repo\Python3\PowerShell Script\Powershell_Example\Name.txt'
$Names= Get-Content -Path $filepath
$Names
Write-Host "#########################################################"
Write-Host "ForEach"
foreach($Name in $Names){
    Get-Content -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Loop\$Name\Readfile.txt"
}

Write-Host "#########################################################"
Write-Host "ForEach-Object"
$Names | ForEach-Object -Process {
    Get-Content -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Loop\$_\Readfile.txt"
}
Write-Host "#########################################################"
Write-Host "ForEach"
$Names.ForEach({Get-Content -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Loop\$_\Readfile.txt" })


Write-Host "#########################################################"
Write-Host "For Loop"
for($i=0;$i -lt $Names.Length;$i++){
    Get-Content -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Loop\$($Names[$i])\Readfile.txt" 
}

Write-Host "#########################################################"
Write-Host "While"

while((Get-Date).Minute -eq 43){
    Get-Date
}
Write-Host "#########################################################"


