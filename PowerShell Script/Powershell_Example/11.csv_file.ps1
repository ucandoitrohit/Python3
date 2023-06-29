#CSV 
$CSvPath="E:\python_repo\Python3\PowerShell Script\Powershell_Example\"

$CSvFile="E:\python_repo\Python3\PowerShell Script\Powershell_Example\SampleCSVFile.csv"
#Get-Content -Path $CSvFile

#Import-Csv -Path $CSvFile

$Files=Import-Csv -Path $CSvFile -Delimiter ' '

foreach($File in $Files){
    Write-Host "$($File.Base)------------------> $($File.'MacIntyre,3,-213.25,38.94,35,Nunavut,Storage')"

}


Get-Service | Select-Object -Property Status,Name,DisplayName,@{Name='Time';Expression={Get-Date -Format 'MM-dd-yy hh:mm:ss' }} | Export-Csv -Path "$CSvPath\SampleCSVFile3.csv" -NoTypeInformation

Get-Content -Path "$CSvPath\SampleCSVFile2.csv"

