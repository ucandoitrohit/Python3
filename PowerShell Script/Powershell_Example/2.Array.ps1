
# Array

$Name=@()
$Name.GetType()
$Name.IsFixedSize

$Name1=@('a','3','f')
$Name1.GetType()
$Name1.IsFixedSize

$Name
Write-Host "##############"
$Name1

$Name1+='d'
Write-Host "##############"

$Name1[0]   
$Name1[1]   
$Name1[2]   
$Name1[3]   
Write-Host "##############"

###############################
#Array List
$NameList=[System.Collections.ArrayList]@()
$NameList.GetType()
$NameList.IsFixedSize

$NameList1=[System.Collections.ArrayList]@('aa','bb','cc',45)
$NameList1.GetType()
$NameList1.IsFixedSize

$NameList
Write-Host "##############"
$NameList1

Write-Host "##############"
$NameList1.Add('asda')
Write-Host "##############"

Write-Host "##############"
$null = $NameList1.Add('asda')
Write-Host "##############"

$NameList1[0]
$NameList1[1]
$NameList1[2]
$NameList1[3]
$NameList1[4]
Write-Host "##############"

$NameList1.Remove('cc')
$NameList1
Write-Host "##############"

$NameList1.RemoveAt('1')
$NameList1
Write-Host "##############"
Write-Host "##############"

$Array=@()
$ArrayList=[System.Collections.ArrayList]@()

Measure-Command -Expression {@(0..5000).ForEach({$Array+=$_})}
Measure-Command -Expression {@(0..5000).ForEach({$ArrayList.Add($_)})}