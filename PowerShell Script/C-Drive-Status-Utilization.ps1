################ C Drive Status Utilization ##########################

$passwd = Get-Content "C:\pass.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username@domain.com",$passwd )

Connect-VIServer -Server vcenter-Server -Credential $credentials
[string] $dt2 = get-date
[string] $dt3 = get-date -Format dd/MM/yyyy
$OutputObj =@()
$vmname = Get-VM -Name VM-Name
$ds = get-datastore -name Datastore-Name | get-vm $vmname | where-object { (-not $_.Config.Template) }
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
        VM-Name -'$dt2'
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
$vmname2 = Get-VM -Name VM-Name
$OutputObj2 =@()
$ds2 = get-datastore -name Datastore-Name | get-vm $vmname2 | where-object { (-not $_.Config.Template) }
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
        VM-Name -'$dt2'
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
$vmname3 = Get-VM -Name VM-Name
$OutputObj3 =@()
$ds3 = get-datastore -name DataStore-Name | get-vm $vmname3 | where-object { (-not $_.Config.Template) }
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
        VMName -'$dt2'
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
$OutputObj4 =@()
$vmname4 = Get-VM -Name VM-Name
$ds4 = get-datastore -name DataStore-Name | get-vm $vmname4 | where-object { (-not $_.Config.Template) }
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
        VM-Name -'$dt2'
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

######################################################################################################################################################
$vmname5 = Get-VM -Name VM-NAme
$OutputObj5 =@()
$ds5 = get-datastore -name Datastore-Name | get-vm $vmname5 | where-object { (-not $_.Config.Template) }
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
$vmname6 = Get-VM -Name VM-NAme
$OutputObj6 =@()
$ds6 = get-datastore -name Datastore-Name | get-vm $vmname6 | where-object { (-not $_.Config.Template) }
$numdisk6 = $ds6 | Select *, @{N="NumDisks6";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk6 = New-Object PSObject
$osdisk6 | Add-Member -Name VmName -Value $numdisk6.name -MemberType NoteProperty
$index6 = 0
$newdisk6 = New-Object -Type PSObject
$newdisk6 = $numdisk6.guest.disks | Where-Object {$_.Path -eq 'C:\' }

$OutputObj6  = New-Object -Type PSObject
$OutputObj6 | Add-Member -Name "Drive Name6" -MemberType NoteProperty -Value $newdisk6.Path
$OutputObj6 | Add-Member -Name "Capacity(GB)6" -MemberType NoteProperty -Value ([math]::Round($newdisk6.CapacityGB,2))
$OutputObj6 | Add-Member -Name "FreeSpace(GB)6" -MemberType NoteProperty -Value ([math]::Round($newdisk6.FreeSpaceGB,2))
$OutputObj6 | Add-Member -Name "FreeSpace(%)6" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk6.FreeSpace))/ ($newdisk6.Capacity)),2))

$drive6 = $OutputObj6.'Drive Name6'
$capacity6 = $OutputObj6.'Capacity(GB)6'
$freegb6 = $OutputObj6.'FreeSpace(GB)6'
$freep6 = $OutputObj6.'FreeSpace(%)6'
 
if($freep6 -gt 80){$htmlreport6 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep6  + '</font></b></td>'}
if($freep6 -gt 60 -and $freep6 -lt 80){$htmlreport6 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep6  + '</font></b></td>'}
if($freep6 -gt 30 -and $freep6 -lt 60 ){$htmlreport6 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep6  + '</font></b></td>'}
if($freep6 -lt 30){$htmlreport6 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep6  + '</font></b></td>'}

$out6 = @"
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
        <b>$drive6</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$capacity6</b></td>
    <td style="text-align: center; height: 35px; width: 233px;">
        <b>$freegb6</b></td>
       $htmlreport6
</tr>
</table>
"@

##########################################################################################################################################################
$vmname7 = Get-VM -Name VM-Name
$OutputObj7 =@()
$ds7 = get-datastore -name Datastore-NAme | get-vm $vmname7 | where-object { (-not $_.Config.Template) }
$numdisk7 = $ds7 | Select *, @{N="NumDisks7";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks
$osdisk7 = New-Object PSObject
$osdisk7 | Add-Member -Name VmName -Value $numdisk7.name -MemberType NoteProperty
$index7 = 0
$newdisk7 = New-Object -Type PSObject
$newdisk7 = $numdisk7.guest.disks | Where-Object {$_.Path -eq 'C:\' }
$OutputObj7  = New-Object -Type PSObject

$OutputObj7 | Add-Member -Name "Drive Name7" -MemberType NoteProperty -Value $newdisk7.Path
$OutputObj7 | Add-Member -Name "Capacity(GB)7" -MemberType NoteProperty -Value ([math]::Round($newdisk7.CapacityGB,2))
$OutputObj7 | Add-Member -Name "FreeSpace(GB)7" -MemberType NoteProperty -Value ([math]::Round($newdisk7.FreeSpaceGB,2))
$OutputObj7 | Add-Member -Name "FreeSpace(%)7" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk7.FreeSpace))/ ($newdisk7.Capacity)),2))

$drive7 = $OutputObj7.'Drive Name7'

$capacity7 = $OutputObj7.'Capacity(GB)7'

$freegb7 = $OutputObj7.'FreeSpace(GB)7'

$freep7 = $OutputObj7.'FreeSpace(%)7'

 

 

 

if($freep7 -gt 80){$htmlreport7 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep7  + '</font></b></td>'}

if($freep7 -gt 60 -and $freep7 -lt 80){$htmlreport7 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep7  + '</font></b></td>'}

if($freep7 -gt 30 -and $freep7 -lt 60 ){$htmlreport7 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep7  + '</font></b></td>'}

if($freep7 -lt 30){$htmlreport7 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep7  + '</font></b></td>'}

 

 

$out7 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33965 -'$dt2'

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

        <b>$drive7</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity7</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb7</b></td>

        $htmlreport7

</tr>

</table>

"@

 

####################################################################################################################################################

 

$vmname8 = Get-VM -Name srv33966

 

$OutputObj8 =@()

 

$ds8 = get-datastore -name VxRail-Virtual-SAN-Datastore-62e11d24-df97-4dfc-8f83-4eea349067c7 | get-vm $vmname8 | where-object { (-not $_.Config.Template) }

$numdisk8 = $ds8 | Select *, @{N="NumDisks8";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk8 = New-Object PSObject

$osdisk8 | Add-Member -Name VmName -Value $numdisk8.name -MemberType NoteProperty

$index8 = 0

$newdisk8 = New-Object -Type PSObject

$newdisk8 = $numdisk8.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj8  = New-Object -Type PSObject

 

$OutputObj8 | Add-Member -Name "Drive Name8" -MemberType NoteProperty -Value $newdisk8.Path

$OutputObj8 | Add-Member -Name "Capacity(GB)8" -MemberType NoteProperty -Value ([math]::Round($newdisk8.CapacityGB,2))

$OutputObj8 | Add-Member -Name "FreeSpace(GB)8" -MemberType NoteProperty -Value ([math]::Round($newdisk8.FreeSpaceGB,2))

$OutputObj8 | Add-Member -Name "FreeSpace(%)8" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk8.FreeSpace))/ ($newdisk8.Capacity)),2))

 

$drive8 = $OutputObj8.'Drive Name8'

$capacity8 = $OutputObj8.'Capacity(GB)8'

$freegb8 = $OutputObj8.'FreeSpace(GB)8'

$freep8 = $OutputObj8.'FreeSpace(%)8'

 

 

 

if($freep8 -gt 80){$htmlreport8 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep8  + '</font></b></td>'}

if($freep8 -gt 60 -and $freep8 -lt 80){$htmlreport8 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep8  + '</font></b></td>'}

if($freep8 -gt 30 -and $freep8 -lt 60 ){$htmlreport8 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep8  + '</font></b></td>'}

if($freep8 -lt 30){$htmlreport8 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep8  + '</font></b></td>'}

 

 

$out8 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33966 -'$dt2'

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

        <b>$drive8</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity8</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb8</b></td>

        $htmlreport8

</tr>

</table>

"@

 

 

####################################################################################################################################################

 

$vmname9 = Get-VM -Name srv35820

 

$OutputObj9 =@()

 

$ds9 = get-datastore -name VxRail-Virtual-SAN-Datastore-425158ff-879f-4d51-8bf3-7b8997229356 | get-vm $vmname9 | where-object { (-not $_.Config.Template) }

$numdisk9 = $ds9 | Select *, @{N="NumDisks9";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk9 = New-Object PSObject

$osdisk9 | Add-Member -Name VmName -Value $numdisk9.name -MemberType NoteProperty

$index9 = 0

$newdisk9 = New-Object -Type PSObject

$newdisk9 = $numdisk9.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj9  = New-Object -Type PSObject

 

$OutputObj9 | Add-Member -Name "Drive Name9" -MemberType NoteProperty -Value $newdisk9.Path

$OutputObj9 | Add-Member -Name "Capacity(GB)9" -MemberType NoteProperty -Value ([math]::Round($newdisk9.CapacityGB,2))

$OutputObj9 | Add-Member -Name "FreeSpace(GB)9" -MemberType NoteProperty -Value ([math]::Round($newdisk9.FreeSpaceGB,2))

$OutputObj9 | Add-Member -Name "FreeSpace(%)9" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk9.FreeSpace))/ ($newdisk9.Capacity)),2))

 

$drive9 = $OutputObj9.'Drive Name9'

$capacity9 = $OutputObj9.'Capacity(GB)9'

$freegb9 = $OutputObj9.'FreeSpace(GB)9'

$freep9 = $OutputObj9.'FreeSpace(%)9'

 

 

 

if($freep9 -gt 80){$htmlreport9 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep9  + '</font></b></td>'}

if($freep9 -gt 60 -and $freep9 -lt 80){$htmlreport9 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep9  + '</font></b></td>'}

if($freep9 -gt 30 -and $freep9 -lt 60 ){$htmlreport9 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep9  + '</font></b></td>'}

if($freep9 -lt 30){$htmlreport9 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep9  + '</font></b></td>'}

 

 

$out9 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33966 -'$dt2'

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

        <b>$drive9</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity9</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb9</b></td>

        $htmlreport9

</tr>

</table>

"@

 

 

 

####################################################################################################################################################

 

$vmname10 = Get-VM -Name srv33954

 

$OutputObj10 =@()

 

$ds10 = get-datastore -name VxRail-Virtual-SAN-Datastore-62e11d24-df97-4dfc-8f83-4eea349067c7 | get-vm $vmname10 | where-object { (-not $_.Config.Template) }

$numdisk10 = $ds10 | Select *, @{N="NumDisks10";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk10 = New-Object PSObject

$osdisk10 | Add-Member -Name VmName -Value $numdisk10.name -MemberType NoteProperty

$index10 = 0

$newdisk10 = New-Object -Type PSObject

$newdisk10 = $numdisk10.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj10  = New-Object -Type PSObject

 

$OutputObj10 | Add-Member -Name "Drive Name10" -MemberType NoteProperty -Value $newdisk10.Path

$OutputObj10 | Add-Member -Name "Capacity(GB)10" -MemberType NoteProperty -Value ([math]::Round($newdisk10.CapacityGB,2))

$OutputObj10 | Add-Member -Name "FreeSpace(GB)10" -MemberType NoteProperty -Value ([math]::Round($newdisk10.FreeSpaceGB,2))

$OutputObj10 | Add-Member -Name "FreeSpace(%)10" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk10.FreeSpace))/ ($newdisk10.Capacity)),2))

 

$drive10 = $OutputObj10.'Drive Name10'

$capacity10 = $OutputObj10.'Capacity(GB)10'

$freegb10 = $OutputObj10.'FreeSpace(GB)10'

$freep10 = $OutputObj10.'FreeSpace(%)10'

 

 

 

if($freep10 -gt 80){$htmlreport10 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep10  + '</font></b></td>'}

if($freep10 -gt 60 -and $freep10 -lt 80){$htmlreport10 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep10  + '</font></b></td>'}

if($freep10 -gt 30 -and $freep10 -lt 60 ){$htmlreport10 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep10  + '</font></b></td>'}

if($freep10 -lt 30){$htmlreport10 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep10  + '</font></b></td>'}

 

 

$out10 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33954 -'$dt2'

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

        <b>$drive10</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity10</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb10</b></td>

        $htmlreport10

</tr>

</table>

"@

 

 

 

 

####################################################################################################################################################

 

 

$vmname11 = Get-VM -Name srv34097   

 

$OutputObj11 =@()

 

$ds11 = get-datastore -name VxRail-Virtual-SAN-Datastore-62e11d24-df97-4dfc-8f83-4eea349067c7 | get-vm $vmname11 | where-object { (-not $_.Config.Template) }

$numdisk11 = $ds11 | Select *, @{N="NumDisks11";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk11 = New-Object PSObject

$osdisk11 | Add-Member -Name VmName -Value $numdisk11.name -MemberType NoteProperty

$index11 = 0

$newdisk11 = New-Object -Type PSObject

$newdisk11 = $numdisk11.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj11  = New-Object -Type PSObject

 

$OutputObj11 | Add-Member -Name "Drive Name11" -MemberType NoteProperty -Value $newdisk11.Path

$OutputObj11 | Add-Member -Name "Capacity(GB)11" -MemberType NoteProperty -Value ([math]::Round($newdisk11.CapacityGB,2))

$OutputObj11 | Add-Member -Name "FreeSpace(GB)11" -MemberType NoteProperty -Value ([math]::Round($newdisk11.FreeSpaceGB,2))

$OutputObj11 | Add-Member -Name "FreeSpace(%)11" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk11.FreeSpace))/ ($newdisk11.Capacity)),2))

 

$drive11 = $OutputObj11.'Drive Name11'

$capacity11 = $OutputObj11.'Capacity(GB)11'

$freegb11 = $OutputObj11.'FreeSpace(GB)11'

$freep11 = $OutputObj11.'FreeSpace(%)11'

 

 

 

if($freep11 -gt 80){$htmlreport11 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep11  + '</font></b></td>'}

if($freep11 -gt 60 -and $freep11 -lt 80){$htmlreport11 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep11  + '</font></b></td>'}

if($freep11 -gt 30 -and $freep11 -lt 60 ){$htmlreport11 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep11  + '</font></b></td>'}

if($freep11 -lt 30){$htmlreport11 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep11  + '</font></b></td>'}

 

 

$out11 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV34097 -'$dt2'

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

        <b>$drive11</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity11</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb11</b></td>

        $htmlreport11

</tr>

</table>

"@

 

 

 

 

 

####################################################################################################################################################

 

 

$vmname12 = Get-VM -Name srv34098   

 

$OutputObj12 =@()

 

$ds12 = get-datastore -name VxRail-Virtual-SAN-Datastore-62e11d24-df97-4dfc-8f83-4eea349067c7 | get-vm $vmname12 | where-object { (-not $_.Config.Template) }

$numdisk12 = $ds12 | Select *, @{N="NumDisks12";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk12 = New-Object PSObject

$osdisk12 | Add-Member -Name VmName -Value $numdisk12.name -MemberType NoteProperty

$index12 = 0

$newdisk12 = New-Object -Type PSObject

$newdisk12 = $numdisk12.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj12  = New-Object -Type PSObject

 

$OutputObj12 | Add-Member -Name "Drive Name12" -MemberType NoteProperty -Value $newdisk12.Path

$OutputObj12 | Add-Member -Name "Capacity(GB)12" -MemberType NoteProperty -Value ([math]::Round($newdisk12.CapacityGB,2))

$OutputObj12 | Add-Member -Name "FreeSpace(GB)12" -MemberType NoteProperty -Value ([math]::Round($newdisk12.FreeSpaceGB,2))

$OutputObj12 | Add-Member -Name "FreeSpace(%)12" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk12.FreeSpace))/ ($newdisk12.Capacity)),2))

 

$drive12 = $OutputObj12.'Drive Name12'

$capacity12 = $OutputObj12.'Capacity(GB)12'

$freegb12 = $OutputObj12.'FreeSpace(GB)12'

$freep12 = $OutputObj12.'FreeSpace(%)12'

 

 

 

if($freep12 -gt 80){$htmlreport12 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep12  + '</font></b></td>'}

if($freep12 -gt 60 -and $freep12 -lt 80){$htmlreport12 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep12  + '</font></b></td>'}

if($freep12 -gt 30 -and $freep12 -lt 60 ){$htmlreport12 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep12  + '</font></b></td>'}

if($freep12 -lt 30){$htmlreport12 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep12  + '</font></b></td>'}

 

 

$out12 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV34098 -'$dt2'

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

        <b>$drive12</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity12</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb12</b></td>

        $htmlreport12

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

 

Connect-VIServer -Server 172.23.6.220 -Credential $credentials

 

 

$vmname13 = Get-VM -Name srv33957   

 

$OutputObj13 =@()

 

$ds13 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname13 | where-object { (-not $_.Config.Template) }

$numdisk13 = $ds13 | Select *, @{N="NumDisks13";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk13 = New-Object PSObject

$osdisk13 | Add-Member -Name VmName -Value $numdisk13.name -MemberType NoteProperty

$index13 = 0

$newdisk13 = New-Object -Type PSObject

$newdisk13 = $numdisk13.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj13  = New-Object -Type PSObject

 

$OutputObj13 | Add-Member -Name "Drive Name13" -MemberType NoteProperty -Value $newdisk13.Path

$OutputObj13 | Add-Member -Name "Capacity(GB)13" -MemberType NoteProperty -Value ([math]::Round($newdisk13.CapacityGB,2))

$OutputObj13 | Add-Member -Name "FreeSpace(GB)13" -MemberType NoteProperty -Value ([math]::Round($newdisk13.FreeSpaceGB,2))

$OutputObj13 | Add-Member -Name "FreeSpace(%)13" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk13.FreeSpace))/ ($newdisk13.Capacity)),2))

 

$drive13 = $OutputObj13.'Drive Name13'

$capacity13 = $OutputObj13.'Capacity(GB)13'

$freegb13 = $OutputObj13.'FreeSpace(GB)13'

$freep13 = $OutputObj13.'FreeSpace(%)13'

 

 

 

if($freep13 -gt 80){$htmlreport13 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep13  + '</font></b></td>'}

if($freep13 -gt 60 -and $freep13 -lt 80){$htmlreport13 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep13  + '</font></b></td>'}

if($freep13 -gt 30 -and $freep13 -lt 60 ){$htmlreport13 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep13  + '</font></b></td>'}

if($freep13 -lt 30){$htmlreport13 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep13  + '</font></b></td>'}

 

 

$out13 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33957 -'$dt2'

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

        <b>$drive13</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity13</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb13</b></td>

        $htmlreport13

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

 

$vmname14 = Get-VM -Name srv33959

 

$OutputObj14 =@()

 

$ds14 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname14 | where-object { (-not $_.Config.Template) }

$numdisk14 = $ds14 | Select *, @{N="NumDisks14";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk14 = New-Object PSObject

$osdisk14 | Add-Member -Name VmName -Value $numdisk14.name -MemberType NoteProperty

$index14 = 0

$newdisk14 = New-Object -Type PSObject

$newdisk14 = $numdisk14.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj14  = New-Object -Type PSObject

 

$OutputObj14 | Add-Member -Name "Drive Name14" -MemberType NoteProperty -Value $newdisk14.Path

$OutputObj14 | Add-Member -Name "Capacity(GB)14" -MemberType NoteProperty -Value ([math]::Round($newdisk14.CapacityGB,2))

$OutputObj14 | Add-Member -Name "FreeSpace(GB)14" -MemberType NoteProperty -Value ([math]::Round($newdisk14.FreeSpaceGB,2))

$OutputObj14 | Add-Member -Name "FreeSpace(%)14" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk14.FreeSpace))/ ($newdisk14.Capacity)),2))

 

$drive14 = $OutputObj14.'Drive Name14'

$capacity14 = $OutputObj14.'Capacity(GB)14'

$freegb14 = $OutputObj14.'FreeSpace(GB)14'

$freep14 = $OutputObj14.'FreeSpace(%)14'

 

 

 

if($freep14 -gt 80){$htmlreport14 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep14  + '</font></b></td>'}

if($freep14 -gt 60 -and $freep14 -lt 80){$htmlreport14 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep14  + '</font></b></td>'}

if($freep14 -gt 30 -and $freep14 -lt 60 ){$htmlreport14 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep14  + '</font></b></td>'}

if($freep14 -lt 30){$htmlreport14 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep14  + '</font></b></td>'}

 

 

$out14 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33959 -'$dt2'

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

        <b>$drive14</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity14</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb14</b></td>

        $htmlreport14

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

$vmname15 = Get-VM -Name srv33960   

 

$OutputObj15 =@()

 

$ds15 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname15 | where-object { (-not $_.Config.Template) }

$numdisk15 = $ds15 | Select *, @{N="NumDisks15";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk15 = New-Object PSObject

$osdisk15 | Add-Member -Name VmName -Value $numdisk15.name -MemberType NoteProperty

$index15 = 0

$newdisk15 = New-Object -Type PSObject

$newdisk15 = $numdisk15.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj15  = New-Object -Type PSObject

 

$OutputObj15 | Add-Member -Name "Drive Name15" -MemberType NoteProperty -Value $newdisk15.Path

$OutputObj15 | Add-Member -Name "Capacity(GB)15" -MemberType NoteProperty -Value ([math]::Round($newdisk15.CapacityGB,2))

$OutputObj15 | Add-Member -Name "FreeSpace(GB)15" -MemberType NoteProperty -Value ([math]::Round($newdisk15.FreeSpaceGB,2))

$OutputObj15 | Add-Member -Name "FreeSpace(%)15" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk15.FreeSpace))/ ($newdisk15.Capacity)),2))

 

$drive15 = $OutputObj15.'Drive Name15'

$capacity15 = $OutputObj15.'Capacity(GB)15'

$freegb15 = $OutputObj15.'FreeSpace(GB)15'

$freep15 = $OutputObj15.'FreeSpace(%)15'

 

 

 

if($freep15 -gt 80){$htmlreport15 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep15  + '</font></b></td>'}

if($freep15 -gt 60 -and $freep15 -lt 80){$htmlreport15 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep15  + '</font></b></td>'}

if($freep15 -gt 30 -and $freep15 -lt 60 ){$htmlreport15 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep15  + '</font></b></td>'}

if($freep15 -lt 30){$htmlreport15 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep15  + '</font></b></td>'}

 

 

$out15 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33960 -'$dt2'

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

        <b>$drive15</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity15</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb15</b></td>

        $htmlreport15

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

$vmname16 = Get-VM -Name srv33956   

 

$OutputObj16 =@()

 

$ds16 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname16 | where-object { (-not $_.Config.Template) }

$numdisk16 = $ds16 | Select *, @{N="NumDisks16";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk16 = New-Object PSObject

$osdisk16 | Add-Member -Name VmName -Value $numdisk16.name -MemberType NoteProperty

$index16 = 0

$newdisk16 = New-Object -Type PSObject

$newdisk16 = $numdisk16.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj16  = New-Object -Type PSObject

 

$OutputObj16 | Add-Member -Name "Drive Name16" -MemberType NoteProperty -Value $newdisk16.Path

$OutputObj16 | Add-Member -Name "Capacity(GB)16" -MemberType NoteProperty -Value ([math]::Round($newdisk16.CapacityGB,2))

$OutputObj16 | Add-Member -Name "FreeSpace(GB)16" -MemberType NoteProperty -Value ([math]::Round($newdisk16.FreeSpaceGB,2))

$OutputObj16 | Add-Member -Name "FreeSpace(%)16" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk16.FreeSpace))/ ($newdisk16.Capacity)),2))

 

$drive16 = $OutputObj16.'Drive Name16'

$capacity16 = $OutputObj16.'Capacity(GB)16'

$freegb16 = $OutputObj16.'FreeSpace(GB)16'

$freep16 = $OutputObj16.'FreeSpace(%)16'

 

 

 

if($freep16 -gt 80){$htmlreport16 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep16  + '</font></b></td>'}

if($freep16 -gt 60 -and $freep16 -lt 80){$htmlreport16 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep16  + '</font></b></td>'}

if($freep16 -gt 30 -and $freep16 -lt 60 ){$htmlreport16 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep16  + '</font></b></td>'}

if($freep16 -lt 30){$htmlreport16 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep16  + '</font></b></td>'}

 

 

$out16 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33956 -'$dt2'

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

        <b>$drive16</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity16</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb16</b></td>

        $htmlreport16

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

$vmname17 = Get-VM -Name srv33958

 

$OutputObj17 =@()

 

$ds17 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname17 | where-object { (-not $_.Config.Template) }

$numdisk17 = $ds17 | Select *, @{N="NumDisks17";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk17 = New-Object PSObject

$osdisk17 | Add-Member -Name VmName -Value $numdisk17.name -MemberType NoteProperty

$index17 = 0

$newdisk17 = New-Object -Type PSObject

$newdisk17 = $numdisk17.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj17  = New-Object -Type PSObject

 

$OutputObj17 | Add-Member -Name "Drive Name17" -MemberType NoteProperty -Value $newdisk17.Path

$OutputObj17 | Add-Member -Name "Capacity(GB)17" -MemberType NoteProperty -Value ([math]::Round($newdisk17.CapacityGB,2))

$OutputObj17 | Add-Member -Name "FreeSpace(GB)17" -MemberType NoteProperty -Value ([math]::Round($newdisk17.FreeSpaceGB,2))

$OutputObj17 | Add-Member -Name "FreeSpace(%)17" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk17.FreeSpace))/ ($newdisk17.Capacity)),2))

 

$drive17 = $OutputObj17.'Drive Name17'

$capacity17 = $OutputObj17.'Capacity(GB)17'

$freegb17 = $OutputObj17.'FreeSpace(GB)17'

$freep17 = $OutputObj17.'FreeSpace(%)17'

 

 

 

if($freep17 -gt 80){$htmlreport17 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep17  + '</font></b></td>'}

if($freep17 -gt 60 -and $freep17 -lt 80){$htmlreport17 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep17  + '</font></b></td>'}

if($freep17 -gt 30 -and $freep17 -lt 60 ){$htmlreport17 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep17  + '</font></b></td>'}

if($freep17 -lt 30){$htmlreport17 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep17  + '</font></b></td>'}

 

 

$out17 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33958 -'$dt2'

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

        <b>$drive17</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity17</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb17</b></td>

        $htmlreport17

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

$vmname18 = Get-VM -Name srv33961   

 

$OutputObj18 =@()

 

$ds18 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname18 | where-object { (-not $_.Config.Template) }

$numdisk18 = $ds18 | Select *, @{N="NumDisks18";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk18 = New-Object PSObject

$osdisk18 | Add-Member -Name VmName -Value $numdisk18.name -MemberType NoteProperty

$index18 = 0

$newdisk18 = New-Object -Type PSObject

$newdisk18 = $numdisk18.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj18  = New-Object -Type PSObject

 

$OutputObj18 | Add-Member -Name "Drive Name18" -MemberType NoteProperty -Value $newdisk18.Path

$OutputObj18 | Add-Member -Name "Capacity(GB)18" -MemberType NoteProperty -Value ([math]::Round($newdisk18.CapacityGB,2))

$OutputObj18 | Add-Member -Name "FreeSpace(GB)18" -MemberType NoteProperty -Value ([math]::Round($newdisk18.FreeSpaceGB,2))

$OutputObj18 | Add-Member -Name "FreeSpace(%)18" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk18.FreeSpace))/ ($newdisk18.Capacity)),2))

 

$drive18 = $OutputObj18.'Drive Name18'

$capacity18 = $OutputObj18.'Capacity(GB)18'

$freegb18 = $OutputObj18.'FreeSpace(GB)18'

$freep18 = $OutputObj18.'FreeSpace(%)18'

 

 

 

if($freep18 -gt 80){$htmlreport18 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep18  + '</font></b></td>'}

if($freep18 -gt 60 -and $freep18 -lt 80){$htmlreport18 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep18  + '</font></b></td>'}

if($freep18 -gt 30 -and $freep18 -lt 60 ){$htmlreport18 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep18  + '</font></b></td>'}

if($freep18 -lt 30){$htmlreport18 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep18  + '</font></b></td>'}

 

 

$out18 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33961 -'$dt2'

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

        <b>$drive18</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity18</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb18</b></td>

        $htmlreport18

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

$vmname19 = Get-VM -Name srv33962

 

$OutputObj19 =@()

 

$ds19 = get-datastore -name VxRail-Virtual-SAN-Datastore-0e1d2792-5b4d-42d3-a5ba-0b2dead8adbc | get-vm $vmname19 | where-object { (-not $_.Config.Template) }

$numdisk19 = $ds19 | Select *, @{N="NumDisks19";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk19 = New-Object PSObject

$osdisk19 | Add-Member -Name VmName -Value $numdisk19.name -MemberType NoteProperty

$index19 = 0

$newdisk19 = New-Object -Type PSObject

$newdisk19 = $numdisk19.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj19  = New-Object -Type PSObject

 

$OutputObj19 | Add-Member -Name "Drive Name19" -MemberType NoteProperty -Value $newdisk19.Path

$OutputObj19 | Add-Member -Name "Capacity(GB)19" -MemberType NoteProperty -Value ([math]::Round($newdisk19.CapacityGB,2))

$OutputObj19 | Add-Member -Name "FreeSpace(GB)19" -MemberType NoteProperty -Value ([math]::Round($newdisk19.FreeSpaceGB,2))

$OutputObj19 | Add-Member -Name "FreeSpace(%)19" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk19.FreeSpace))/ ($newdisk19.Capacity)),2))

 

$drive19 = $OutputObj19.'Drive Name19'

$capacity19 = $OutputObj19.'Capacity(GB)19'

$freegb19 = $OutputObj19.'FreeSpace(GB)19'

$freep19 = $OutputObj19.'FreeSpace(%)19'

 

 

 

if($freep19 -gt 80){$htmlreport19 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep19  + '</font></b></td>'}

if($freep19 -gt 60 -and $freep19 -lt 80){$htmlreport19 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep19  + '</font></b></td>'}

if($freep19 -gt 30 -and $freep19 -lt 60 ){$htmlreport19 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep19  + '</font></b></td>'}

if($freep19 -lt 30){$htmlreport19 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep19  + '</font></b></td>'}

 

 

$out19 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV33962 -'$dt2'

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

        <b>$drive19</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity19</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb19</b></td>

        $htmlreport19

</tr>

</table>

"@

 

 

##########################################################################################################################################################

 

 

 

Connect-VIServer -Server 172.23.9.171 -Credential $credentials

 

$vmname20 = Get-VM -Name srv34045

 

$OutputObj20 =@()

 

$ds20 = get-datastore -name HM_300_vsanDatastore | get-vm $vmname20 | where-object { (-not $_.Config.Template) }

$numdisk20 = $ds20 | Select *, @{N="NumDisks20";E={@($_.Guest.Disks.Length)}} | Sort-Object -Descending NumDisks

$osdisk20 = New-Object PSObject

$osdisk20 | Add-Member -Name VmName -Value $numdisk20.name -MemberType NoteProperty

$index20 = 0

$newdisk20 = New-Object -Type PSObject

$newdisk20 = $numdisk20.guest.disks | Where-Object {$_.Path -eq 'C:\' }

 

$OutputObj20  = New-Object -Type PSObject

 

$OutputObj20 | Add-Member -Name "Drive Name20" -MemberType NoteProperty -Value $newdisk20.Path

$OutputObj20 | Add-Member -Name "Capacity(GB)20" -MemberType NoteProperty -Value ([math]::Round($newdisk20.CapacityGB,2))

$OutputObj20 | Add-Member -Name "FreeSpace(GB)20" -MemberType NoteProperty -Value ([math]::Round($newdisk20.FreeSpaceGB,2))

$OutputObj20 | Add-Member -Name "FreeSpace(%)20" -MemberType NoteProperty -Value ([math]::Round(((100* ($newdisk20.FreeSpace))/ ($newdisk20.Capacity)),2))

 

$drive20 = $OutputObj20.'Drive Name20'

$capacity20 = $OutputObj20.'Capacity(GB)20'

$freegb20 = $OutputObj20.'FreeSpace(GB)20'

$freep20 = $OutputObj20.'FreeSpace(%)20'

 

 

 

if($freep20 -gt 80){$htmlreport20 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Green"><b >' + $freep20  + '</font></b></td>'}

if($freep20 -gt 60 -and $freep20 -lt 80){$htmlreport20 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Magenta"><b >' + $freep20  + '</font></b></td>'}

if($freep20 -gt 30 -and $freep20 -lt 60 ){$htmlreport20 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Blue"><b >' + $freep20  + '</font></b></td>'}

if($freep20 -lt 30){$htmlreport20 = '<td style="text-align: center; height: 35px; width: 233px;"> <font color = "Red"><b >' + $freep20  + '</font></b></td>'}

 

 

$out20 = @"

<table style="width: 100%" ; border: 1px solid #008080;">

<tr>

    <td colspan ="4" bgcolor="#008080" style="color: Pink; font-size: 25; height: 40px;text-align: center; font-weight:bold">

        SRV34045 -'$dt2'

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

        <b>$drive20</b></td>

 

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$capacity20</b></td>

    <td style="text-align: center; height: 35px; width: 233px;">

        <b>$freegb20</b></td>

        $htmlreport20

</tr>

</table>

"@

 

##########################################################################################################################################################

$sig =@"

<html> This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>

"@

##########################################################################################################################################################

 

#$tot = @('dlhclsapwintel@hm.com','sachin.verma@hm.com', 'prabal.verma@hm.com')

#Send-MailMessage -SmtpServer 10.60.95.11 -Port 25 -To $tot -From rohit.vishwakarma@hm.com -Subject "C: Drive Status -$dt3" -Body "$head `n $out1 `n $out2 `n $out3 `n $out4 `n  $out5 `n  $out6 `n  $out7 `n  $out8 `n  $out9 `n  $out10 `n  $out11 `n  $out12 `n  $out13 `n  $out14 `n  $out15 `n  $out16 `n  $out17 `n  $out18 `n  $out19 `n  $out20 $sig" -BodyAsHtml

 

 

 

#Send-MailMessage -SmtpServer 10.60.95.11 -Port 25 -To rohit.vishwakarma@hm.com -From rohit.vishwakarma@hm.com -Subject "C: Drive Status -$dt3" -Body "$head `n $out1 `n $out2 `n $out3 `n $out4 `n  $out5 `n  $out6 `n  $out7 `n  $out8 `n  $out9 `n  $out10 `n  $out11 `n  $out12 `n  $out13 `n  $out14 `n  $out15 `n  $out16 `n  $out17 `n  $out18 `n  $out19 `n  $out20 $sig" -BodyAsHtml

 

#Send-MailMessage -SmtpServer 10.60.95.11 -Port 25 -To rohit.vishwakarma@hm.com -From rohit.vishwakarma@hm.com -Subject "C: Drive Status Other VMs -$dt3" -Body "$head `n $out1 `n $out3 `n $out4 `n $out5 `n  $out6 `n  $out10 `n  $out2 `n  $out7 `n  $out8 `n  $out11 `n  $out12 `n  $out9 `n`n`n  $out16 `n  $out13 `n  $out17 `n  $out14 `n  $out15 `n  $out18 `n  $out19 `n  $out20  $sig" -BodyAsHtml

Send-MailMessage -SmtpServer 10.60.95.11 -Port 25 -To dlhclsapwintel@hm.com -From rohit.vishwakarma@hm.com -Subject "C: Drive Status Other VMs -$dt3" -Body "$head `n $out1 `n $out3 `n $out4 `n $out5 `n  $out6 `n  $out10 `n  $out2 `n  $out7 `n  $out8 `n  $out11 `n  $out12 `n  $out9 `n`n`n  $out16 `n  $out13 `n  $out17 `n  $out14 `n  $out15 `n  $out18 `n  $out19 `n  $out20  $sig" -BodyAsHtml

 

 

 

   

 

 

 

Disconnect-VIServer -Server 172.23.6.219 -Confirm:$false

Disconnect-VIServer -Server 172.23.6.220 -Confirm:$false

Disconnect-VIServer -Server 172.23.9.171 -Confirm:$false


 