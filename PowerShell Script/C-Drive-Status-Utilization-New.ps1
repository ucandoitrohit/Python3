################ C Drive Status Utilization ##########################
$passwd = Get-Content "C:\pass.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username@domain.com",$passwd )

Connect-VIServer -Server vCenter-NAme   -Credential $credentials
[string] $dt2 = get-date
[string] $dt3 = get-date -Format dd/MM/yyyy
$OutputObj =@()
$vmname = Get-VM -Name VM-NAme

$ds = get-datastore -name Datastore-NAme | get-vm $vmname | where-object { (-not $_.Config.Template) }
$numdisk = $ds | Select *, @{N="NumDisks";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk = New-Object PSObject
$osdisk | Add-Member -Name VmName -Value $numdisk.name -MemberType NoteProperty
$index = 0
$newdisk = New-Object -Type PSObject
$newdisk = $numdisk.guest.disks | Where-Object {$_.Path -eq 'C:\' }

$OutputObj  = New-Object -Type PSObject
$OutputObj | Add-Member -Name "Drive Name" -MemberType NoteProperty -Value $newdisk.Path
$OutputObj | Add-Member -Name "Capacity(GB)" -MemberType NoteProperty -Value ([math]::Round($newdisk.CapacityGB,2))
$OutputObj | Add-Member -Name "FreeSpace(GB)" -MemberType NoteProperty -Value ([math]::Round($newdisk.FreeSpaceGB,2))
$OutputObj | Add-Member -Name "FreeSpace(%)" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk.FreeSpace))/ ($newdisk.Capacity)),2))

$drive = $OutputObj.'Drive Name'
$capacity = $OutputObj.'Capacity(GB)'
$freegb = $OutputObj.'FreeSpace(GB)'
$freep = $OutputObj.'FreeSpace(%)'

if($freep -gt 80){$htmlreport = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep  + '</font></b></td>'}
if($freep -gt 60 -and $freep -lt 80){$htmlreport = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep  + '</font></b></td>'}
if($freep -gt 30 -and $freep -lt 60 ){$htmlreport = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep  + '</font></b></td>'}
if($freep -lt 30){$htmlreport = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep  + '</font></b></td>'}

$head =@"
<table width='100%'>
    <tr bgcolor='#CCCCCC'>
    <td align='center'><font color='#000000' size='2' face='tahoma'><span style=background-color:Green><b><font color=white>HEALTHY</span></font></b> above 80%    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=background-color:Magenta><b><font color=white>WARNING</span></font></b> between 80%-60% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=background-color:Blue><b><font color=white>ALERT</span></font></b>  between 60%-30%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=background-color:Red><b><font color=white>CRITICAL</font></b></span> below 30% </font>
    </tr>
</table>
"@

$out1 = @"
<table style="width: 100%" ; border: 1px solid #008080;">
<tr>
    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">
        VM-NAme -'$dt2'
    </td>
<tr >
<td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Drive Name
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Capacity (GB)
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space (GB)
    </td>
   <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space %
    </td>
</tr>
<tr>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$drive</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb</b></td>
    $htmlreport
</tr>
</table>
"@

##########################################################################################################################################################
$vmname2 = Get-VM -Name VM-NAme
$OutputObj2 =@()
$ds2 = get-datastore -name Datastore-NAme | get-vm $vmname2 | where-object { (-not $_.Config.Template) }
$numdisk2 = $ds2 | Select *, @{N="NumDisks2";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk2 = New-Object PSObject
$osdisk2 | Add-Member -Name VmName -Value $numdisk2.name -MemberType NoteProperty
$index2 = 0
$newdisk2 = New-Object -Type PSObject
$newdisk2 = $numdisk2.guest.disks | Where-Object {$_.Path -eq 'C:\' }

$OutputObj2  = New-Object -Type PSObject
$OutputObj2 | Add-Member -Name "Drive Name2" -MemberType NoteProperty -Value $newdisk2.Path
$OutputObj2 | Add-Member -Name "Capacity(GB)2" -MemberType NoteProperty -Value ([math]::Round($newdisk2.CapacityGB,2))
$OutputObj2 | Add-Member -Name "FreeSpace(GB)2" -MemberType NoteProperty -Value ([math]::Round($newdisk2.FreeSpaceGB,2))
$OutputObj2 | Add-Member -Name "FreeSpace(%)2" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk2.FreeSpace))/ ($newdisk2.Capacity)),2))

$drive2 = $OutputObj2.'Drive Name2'
$capacity2 = $OutputObj2.'Capacity(GB)2'
$freegb2 = $OutputObj2.'FreeSpace(GB)2'
$freep2 = $OutputObj2.'FreeSpace(%)2'

if($freep2 -gt 80){$htmlreport2 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep2  + '</font></b></td>'}
if($freep2 -gt 60 -and $freep2 -lt 80){$htmlreport2 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep2  + '</font></b></td>'}
if($freep2 -gt 30 -and $freep2 -lt 60 ){$htmlreport2 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep2  + '</font></b></td>'}
if($freep2 -lt 30){$htmlreport2 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep2  + '</font></b></td>'}

 $out2 = @"
<table style="width: 100%" ; border: 1px solid #008080;">
<tr>
    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">
        VM-NAme -'$dt2'
    </td>
<tr >
<td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Drive Name
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Capacity (GB)
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space (GB)
    </td>
   <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space %
    </td>
</tr>
<tr>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$drive2</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity2</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb2</b></td>
    $htmlreport2
</tr>
</table>
"@

######################################################################################################################################################
$vmname3 = Get-VM -Name VM-NAme
$OutputObj3 =@()
$ds3 = get-datastore -name Datastore-NAme | get-vm $vmname3 | where-object { (-not $_.Config.Template) }
$numdisk3 = $ds3 | Select *, @{N="NumDisks3";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk3 = New-Object PSObject
$osdisk3 | Add-Member -Name VmName -Value $numdisk3.name -MemberType NoteProperty
$index3 = 0
$newdisk3 = New-Object -Type PSObject
$newdisk3 = $numdisk3.guest.disks | Where-Object {$_.Path -eq 'C:\' }
$OutputObj3  = New-Object -Type PSObject
 
$OutputObj3 | Add-Member -Name "Drive Name3" -MemberType NoteProperty -Value $newdisk3.Path
$OutputObj3 | Add-Member -Name "Capacity(GB)3" -MemberType NoteProperty -Value ([math]::Round($newdisk3.CapacityGB,2))
$OutputObj3 | Add-Member -Name "FreeSpace(GB)3" -MemberType NoteProperty -Value ([math]::Round($newdisk3.FreeSpaceGB,2))
$OutputObj3 | Add-Member -Name "FreeSpace(%)3" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk3.FreeSpace))/ ($newdisk3.Capacity)),2))

$drive3 = $OutputObj3.'Drive Name3'
$capacity3 = $OutputObj3.'Capacity(GB)3'
$freegb3 = $OutputObj3.'FreeSpace(GB)3'
$freep3 = $OutputObj3.'FreeSpace(%)3'

if($freep3 -gt 80){$htmlreport3 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep3  + '</font></b></td>'}
if($freep3 -gt 60 -and $freep3 -lt 80){$htmlreport3 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep3  + '</font></b></td>'}
if($freep3 -gt 30 -and $freep3 -lt 60 ){$htmlreport3 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep3  + '</font></b></td>'}
if($freep3 -lt 30){$htmlreport3 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep3  + '</font></b></td>'}

$out3 = @"
<table style="width: 100%" ; border: 1px solid #008080;">
<tr>
    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">
        SRV33625 -'$dt2'
    </td>
<tr >
<td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Drive Name
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Capacity (GB)
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space (GB)
    </td>
   <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space %
    </td>
</tr>
<tr>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$drive3</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity3</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb3</b></td>
        $htmlreport3
</tr>
</table>
"@
######################################################################################################################################################
$vmname5 = Get-VM -Name VM-NAme
$OutputObj5 =@()
$ds5 = get-datastore -name Datastore-NAme | get-vm $vmname5 | where-object { (-not $_.Config.Template) }
$numdisk5 = $ds5 | Select *, @{N="NumDisks5";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk5 = New-Object PSObject
$osdisk5 | Add-Member -Name VmName -Value $numdisk5.name -MemberType NoteProperty
$index5 = 0
$newdisk5 = New-Object -Type PSObject
$newdisk5 = $numdisk5.guest.disks | Where-Object {$_.Path -eq 'C:\' }

$OutputObj5  = New-Object -Type PSObject
$OutputObj5 | Add-Member -Name "Drive Name5" -MemberType NoteProperty -Value $newdisk5.Path
$OutputObj5 | Add-Member -Name "Capacity(GB)5" -MemberType NoteProperty -Value ([math]::Round($newdisk5.CapacityGB,2))
$OutputObj5 | Add-Member -Name "FreeSpace(GB)5" -MemberType NoteProperty -Value ([math]::Round($newdisk5.FreeSpaceGB,2))
$OutputObj5 | Add-Member -Name "FreeSpace(%)5" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk5.FreeSpace))/ ($newdisk5.Capacity)),2))
 
$drive5 = $OutputObj5.'Drive Name5'
$capacity5 = $OutputObj5.'Capacity(GB)5'
$freegb5 = $OutputObj5.'FreeSpace(GB)5'
$freep5 = $OutputObj5.'FreeSpace(%)5'

if($freep5 -gt 80){$htmlreport5 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep5  + '</font></b></td>'}
if($freep5 -gt 60 -and $freep5 -lt 80){$htmlreport5 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep5  + '</font></b></td>'}
if($freep5 -gt 30 -and $freep5 -lt 60 ){$htmlreport5 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep5  + '</font></b></td>'}
if($freep5 -lt 30){$htmlreport5 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep5  + '</font></b></td>'}

$out5 = @"
<table style="width: 100%" ; border: 1px solid #008080;">
<tr>
    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">
        VM-NAme -'$dt2'
    </td>
<tr >
<td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Drive Name
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Capacity (GB)
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space (GB)
    </td>
   <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space %
    </td>
</tr>
<tr>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$drive5</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity5</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb5</b></td>
        $htmlreport5
</tr>
</table>
"@
######################################################################################################################################################
Connect-VIServer -Server vCenter-NAme -Credential $credentials

[string] $dt2 = get-date
[string] $dt3 = get-date -Format dd/MM/yyyy
$OutputObj4 =@()
$vmname4 = Get-VM -Name VM-NAme

$ds4 = get-datastore -name Datastore-Name | get-vm $vmname4 | where-object { (-not $_.Config.Template) }
$numdisk4 = $ds4 | Select *, @{N="NumDisks4";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk4 = New-Object PSObject
$osdisk4 | Add-Member -Name VmName -Value $numdisk4.name -MemberType NoteProperty
$index4 = 0
$newdisk4 = New-Object -Type PSObject
$newdisk4 = $numdisk4.guest.disks | Where-Object {$_.Path -eq 'C:\' }

$OutputObj4  = New-Object -Type PSObject
$OutputObj4 | Add-Member -Name "Drive Name4" -MemberType NoteProperty -Value $newdisk4.Path
$OutputObj4 | Add-Member -Name "Capacity(GB)4" -MemberType NoteProperty -Value ([math]::Round($newdisk4.CapacityGB,2))
$OutputObj4 | Add-Member -Name "FreeSpace(GB)4" -MemberType NoteProperty -Value ([math]::Round($newdisk4.FreeSpaceGB,2))
$OutputObj4 | Add-Member -Name "FreeSpace(%)4" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk4.FreeSpace))/ ($newdisk4.Capacity)),2))

$drive4 = $OutputObj4.'Drive Name4'
$capacity4 = $OutputObj4.'Capacity(GB)4'
$freegb4 = $OutputObj4.'FreeSpace(GB)4'
$freep4 = $OutputObj4.'FreeSpace(%)4'

if($freep4 -gt 80){$htmlreport4 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep4  + '</font></b></td>'}
if($freep4 -gt 60 -and $freep4 -lt 80){$htmlreport4 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep4  + '</font></b></td>'}
if($freep4 -gt 30 -and $freep4 -lt 60 ){$htmlreport4 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep4  + '</font></b></td>'}
if($freep4 -lt 30){$htmlreport4 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep4  + '</font></b></td>'}

$out4 = @"
<table style="width: 100%" ; border: 1px solid #008080;">
<tr>
    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">
        VM-NAme -'$dt2'
    </td>
<tr >
<td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Drive Name
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Capacity (GB)
    </td>
    <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
        Free Space (GB)
    </td>
   <td bgcolor="gray" style="color: #FFFFFF; font-size: 20; height: 30px;text-align: center;">
            Free Space %
    </td>
</tr>
<tr>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$drive4</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity4</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb4</b></td>
        $htmlreport4
</tr>
</table>
"@
##########################################################################################################################################################
$sig =@"
<html> This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
##########################################################################################################################################################

Send-MailMessage -SmtpServer SMTP-SERVER -Port 25 -To EMAIL-ID -From EMAIL-ID -Subject "C: Drive Status -$dt3" -Body "$head `n $out1 `n $out2 `n $out3 `n $out4 `n  $out5 $sig" -BodyAsHtml

Disconnect-VIServer -Server vCenter-Name -Confirm:$false
Disconnect-VIServer -Server vCenter-Name -Confirm:$false

 