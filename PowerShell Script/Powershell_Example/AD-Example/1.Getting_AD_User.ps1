Get-ADUser -Identity admrohit -Server "hostweb.ca" -Properties *

##############################################################

#1.Load the csv file for employee
$EmpDetailCSVFile="E:\python_repo\Python3\PowerShell Script\Powershell_Example\AD-Example\EmpDetail.csv"

function Get-EmployeeFromCSV{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$FilePath,
        [Parameter(Mandatory)]
        [string]$Delimeter,
        [Parameter(Mandatory)]
        [hastable]$SyncFieldMap
    )
    try{
        $SyncProperties=$SyncFieldMap.GetEnumerator()
        $Properties=ForEach($Property in $SyncProperties){
            @{Name=$Property.Value;Expression=[scriptblock]::Create("`$_.$($Property.Key)")}
        
        }
        Import-Csv -Path $FilePath -Delimiter $Delimeter | Select-Object -Property $Properties
    }
    catch{
        Write-Error $_.Exception.Message
    }
}

#2. Load the employees alerady in AD

Function Get-EmployeesFromAD{
    [CmdletBinding()]
    Param(
        [Paramter(Mandatory)]
        [hastable]$SyncFieldMap,
        [Paramter(Mandatory)]
        [string]$Domain,
        [Paramter(Mandatory)]
        [string]$UniqueID
        
    )
    try{
        Get-ADUser -Filter {$UniqueID -like "*" } -Server $Domain -Properties @($SyncFieldMap.Values)
    }
    catch{
        Write-Error -Message $_.Exception.Message
    }
}



# New-ADUser -GivenName "test" -Surname "test" -UserPrincipalName "test@hostweb.ca" -SamAccountName "test" -Office "test" -EmployeeID "000000"
# Get-ADUser -Identity test -Server "hostweb.ca" -Properties *
# Get-ADUser -Filter { employeeid -like "*" } -Server "hostweb.ca"
# Get-ADUser -Filter -Server "hostweb.ca"

#3. Compare those

$SyncFieldMap=@{
    EmployeeID="EmployeeID"
    FirstName="GivenName"
    LastName="SurName"
    Title="Title"
    Department="Department"
    Office="PhysicalOffice"

}

$UniqueId="EmployeeID"

Get-EmployeeFromCSV -FilePath  $EmpDetailCSVFile -Delimeter ","  -SyncFieldMap $SyncFieldMap
Get-EmployeesFromAD -SyncFieldMap $SyncFieldMap -UniqueID $UniqueId -Domain "hostweb.ca"
