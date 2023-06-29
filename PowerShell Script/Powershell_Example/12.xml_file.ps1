#CSV 
$XLMPath="E:\python_repo\Python3\PowerShell Script\Powershell_Example\"

$XMLFile="E:\python_repo\Python3\PowerShell Script\Powershell_Example\SampleXMLFile.xml"

[xml]$Data=Get-Content -Path $XMLFile

#$Data
$nData=$Data.employees.details
$nData
foreach($DData in $nData){
Write-Host $DData

}


