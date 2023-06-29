function Split-CSVFile{
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory)]
    [string]$FilePath,
    [Parameter()]
    [string]$Delimeter,
    [Parameter(Mandatory)]
    [string]$TargetFolder,
    [Parameter(Mandatory)]
    [string]$Name,
    [Parameter(Mandatory)]
    [string]$NumberofFiles
    )


    $CsvData=Import-Csv -Path $FilePath -Delimiter $Delimeter
    $startRow=0
    $numberOfRowsPerFile=$CsvData.count/$NumberofFiles
    $counter=1

    while($startRow -lt $CsvData.count){
        $CsvData | Select-Object -Skip $startRow -First $NumberofFiles | Export-Csv -path "$TargetFolder\$name-$counter.csv" -NoTypeInformation -NoClobber
        $startRow+=$numberOfRowsPerFile
        $counter++
    }


}

Split-CSVFile -FilePath "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Split-CSV\Splitcsv.csv" -Delimeter ',' -TargetFolder "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Split-CSV" -Name "Split-function" -NumberofFiles 6