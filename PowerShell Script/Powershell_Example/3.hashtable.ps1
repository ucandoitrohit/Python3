#Hashtables and Custom Object

$Users=@{
    Name='Rohit Sharma'
    ID='43565'
    Address='Delhi India'
}

Write-Host "#####################"
$Users.GetType()
Write-Host "#####################"
$Users
Write-Host "#####################"
$Users.Keys
Write-Host "#####################"
$Users.Values
Write-Host "#####################"
$Users['ID']
Write-Host "#####################"
$Users.ID
Write-Host "#####################"
$Users.Add('Social','Facebook')
$Users

Write-Host "##############################"
#Hashtables

#$Work=New-Object -TypeName System.Management.Automation.PSCustomObject
$work=New-Object -TypeName PSCustomObject
Add-Member -InputObject $Work -MemberType NoteProperty -Name 'Company' -Value 'Amazon'
Add-Member -InputObject $Work -MemberType NoteProperty -Name 'Location' -Value 'Peru'

$work

Write-Host "##############################"
Get-Member -InputObject $work
$work | Get-Member

Write-Host "##############################"
$Service=New-Object -TypeName PSCustomObject
Add-Member -InputObject $Service -MemberType NoteProperty -Name 'Name' -Value 'spooler'
Add-Member -InputObject $Service -MemberType NoteProperty -Name 'ComputerName' -Value 'ansible-server'

$Service | Get-Service

Write-Host "##############################"

$Sunny=[PSCustomObject]@{
    Name='Rohit';
    City='Delhi'
}
$Sunny
Write-Host "##############################"



