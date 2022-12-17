cls
$result = ''
Function Set-Option{
Write-Host "`nSELECT YOUR OPTION FROM BELOW MENU" -ForegroundColor DarkYellow
Write-Host "===========================================================================" -ForegroundColor Magenta
Write-Host ""

Write-Host " [0]:  Shutdown VMs " -ForegroundColor Magenta
Write-Host " [1]:  Power ON VMs " -ForegroundColor Magenta
Write-Host " [2]:  Reboot VMs " -ForegroundColor Magenta
Write-Host " [3]:  Upgrade HW Version " -ForegroundColor Magenta
Write-Host " [4]:  VMs Power State " -ForegroundColor Magenta 
Write-Host " [5]:  Uptime of VMs " -ForegroundColor Magenta
Write-Host " [6]: Information of VM Summary " -ForegroundColor Magenta
Write-Host " [7]: To Export Network Pre Or Post configuration " -ForegroundColor Magenta
Write-Host " [8]: Hardware Version" -ForegroundColor Magenta
Write-Host " [9]: Snapshot Creation" -ForegroundColor Magenta
Write-Host " [10]: Snapshot Deletion" -ForegroundColor Magenta
Write-Host " [11]: VMware Tools Version " -ForegroundColor Magenta
Write-Host " [12]: Family VMs " -ForegroundColor Magenta
Write-Host " [13]: Connect the vCenter " -ForegroundColor Magenta
Write-Host " [14]: Disconnect the vCenter " -ForegroundColor Magenta
Write-Host " [15]: To EXIT " -ForegroundColor RED

Write-Host ""

$result = switch (Read-Host "Please Select the Below option:-")
   {
        0 {Shutdown-VM}
        1 {PowerON-VM}
        2 {Reboot-VM}
        3 {Upgrade-VMHardware}
        4 {Powerstate-VM}
        5 {Uptime-VM}
        6 {VMStatus}
        7 {Pre_Network_Configuration}
        8 {HardwareVersion-VM}
        9 {Snapshot-Creation}
        10 {Snapshot-Deletion}
        11 {ToolsVersion-VM}
        12 {Family-VM}
        13 {Connect-vCenter}
        14 {Disconnect-vCenter}
        15 {Exit-Script}
        default { 'Invalid Choice !' }
    }
}
############# Power ON the VMs #######################
Function PowerON-VM{
    Write-Warning " You have selected the Option Powered ON All Power-Off VMs will be Start from the list"
    pause
    foreach($VM in $VMs)
    {
        $check= Get-VM -Name $VM | Select-Object Name, @{N="Powerstate"; E={$_.Powerstate}}
        if($check.Powerstate -like "poweredOff"){
            Write-Host $check.Name "VM is Powered OFF..... Script will Start"
            $off = $off + 1
            $VMstart = Start-VM $VM -Confirm:$false -RunAsync -Verbose:$false
            Sleep 2
            if($VMstart)
            {
                Write-Host "Please Wait VM is Starting.. " -ForegroundColor Gray
            }
            else
            {
               Write-Host $check.Name "VM is Already Powered ON..."
               $on = $on + 1
            }
         }
    }
    Write-Host " Total $off VM was PowerON by script from the list"
Set-Option
}
########### ShutDown the VMs #######################
Function Shutdown-VM{
    Write-Warning " You have selected the Option '$result' All VMs will be ShutDown from list "
       foreach($VM in $VMs)
       {
            Write-Host Shutting down $VM -ForegroundColor Green
            Stop-VMGuest -VM $VM -Confirm:$false -Verbose
        }
        Write-Host Please wait Work is in Progress..... -ForegroundColor Yellow
Write-Host DONE!! -ForegroundColor Green
Set-Option
    }

################ Verify the VMs Power State ##############
Function Powerstate-VM{
    foreach($VM in $VMs)
    {
       Write-Host Checking power state of $VM -ForegroundColor Green
       Get-VM -Name $VM|Select Name,Powerstate|Export-Csv -Path $path\Powerstate.csv -Append -NoTypeInformation -Verbose
    }
    Write-Host "Please wait Work is in Progress.....Check the CSV File at $path\Powerstate.csv" -ForegroundColor Yellow
    Write-Host DONE!! -ForegroundColor Green
}
################ Reboot the VMs##############
Function Reboot-VM{
        Write-Warning " You have selected the Option '$result' All VMs will be Reboot from list "
        foreach($VM in $VMs)
        {
            Write-Host Rebooting $VM -ForegroundColor Green
            Restart-VM -VM $VM -Confirm:$false
        }
    Write-Host Please wait Work is in Progress..... -ForegroundColor Yellow
    Write-Host DONE!! -ForegroundColor Green
Set-Option
}
################ Check the Uptime of VMs ##########################
Function Uptime-VM{
    Write-Host "Getting Uptime ..." -ForegroundColor Green
    foreach($VM in $VMs)
    {
       $check= Get-VM -Name $VM | Select-Object Name, @{N="Powerstate"; E={$_.Powerstate}}
        if($check.Powerstate -like "poweredOff")
        {
             Write-Host $check.Name "VM is Powered OFF....." -ForegroundColor Red
        }
        else
        {
        $up=Get-Stat -Entity $VM -Stat sys.uptime.latest -Realtime -MaxSamples 1
        $uptime=New-TimeSpan -Seconds $up.Value
         }
     }
Write-Host DONE!! -ForegroundColor Green
Set-Option
}
##########Snapshot Creation ############################
Function Snapshot-Creation{
    Write-Warning " You have selected the Option .Snapshot of VM's will Start... "
    $snapDate = Get-Date
    $outputCustom = @()
    foreach($VM in $VMs)
    {
        if(Get-VM $VM)
        {
             New-Snapshot -VM $VM -Name $VM
             if(Get-Snapshot -VM $VM -Name $VM)
             {
                Write-Host "Snapshot of the Server $VM created successfully"
                $status = "Created"
             }
             else
             {
                Write-Host "Snapshot of the Server $VM not Created. Something Wrong.."
                $status =" Not created"
             }
        }
        else
        {
            Write-Host "Invalid Server Name"
            $status ="Invalid status"
        }
     $outputCustom = [PSCustomObject]@{
       'ServerName' = $VM;
       'SnapshotName' = $snapName;
       'Status' = $status
        }
    }
$htmlreport=""
$htmlreport += "
                <html>
                <head>
                <title>Snapshot Report</title>
                <STYLE TYPE='text/css'>
                </style>
                </head>"
$htmlreport +=" <body>
                    <table-layout: fixed>
                    <table width='100%'>
                        <tr bgcolor='#00B624'>
                            <td colspan='7' height='25' align='center'><strong>
                            <font color='#000000' size='4' face='tahoma'>SnapShot of VMs staus</font>
                            <font color='#000000' size='4' face='tahoma'> ($(Get-Date))</font>
                            <font color='#000000' size='2' face='tahoma'> <BR>
                            <Br>
                        </tr>
                    </table>
                <table width='100%'>
                <table width='100%'><tbody>
                    <tr bgcolor=black>
                    <td width='10%' height='25' align='center'> <strong> <font color='white' size='2' face='tahoma' >Server Name</font></strong></td>
                    <td width='8%'  height='25' align='center'> <strong> <font color='white' size='2' face='tahoma' >Snapshot Name</font></strong></td>
                    <td width='10%' height='25' align='center'> <strong> <font color='white' size='2' face='tahoma' >Status</font></strong></td>
                       </tr>"
foreach($html in $outputCustom){
    $htmlreport +="<tr bgcolor=cyan>"
    $htmlreport +="<td width='10%' height='35' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.ServerName)</font></strong></td>"
    $htmlreport +="<td width='8%'  height='35' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.snapshotName)</font></strong></td>"
    if($html.status -match 'Created'){
        $htmlreport +="<td width='10%' height='35' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.status)</font></strong></td>"       
     }
     else
     {
        $htmlreport +="<td width='10%' height='35' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.status)</font></strong></td>"       
     }
}
$htmlreport +="</tr>"
$htmlreport +="</table>"
$htmlreport +="</body></html>"
$htmlreport | Out-File -FilePath $path\creationSnapshotReport.html
Invoke-Expression $path\creationSnapshotReport.html
}
##########Snapshot Deletion ############################
Function Snapshot-Deletion{
    Write-Warning " You have selected the Option .Snapshot of VM's will Delete... "
    $outputCustom = @()
    foreach($VM in $VMs){
        $VM = Get-VM $VM
        $snapList = Get-VM $VM | Get-Snapshot
        $snapCount = $VM | Get-Snapshot | Measure-Object
        $snapCount =$snapCount.Count
        foreach($snapshot in $snapList){
            Write-Host "Having $snapCount Snapshot of VMs $snapshot... Now Deleting All"
            Remove-Snapshot $snapshot -Confirn:$false
            $status = 'Deleted'
      }
    }
     $outputCustom += [PSCustomObject] @{
       'ServerName' = $VM
        'Status' = $status
        }
$htmlreport=""
$htmlreport += "
                <html>
                <head>
                <title>Snapshot Report</title>
                <STYLE TYPE='text/css'>
                </style>
                </head>"
$htmlreport +=" <body>
                    <table-layout: fixed>
                    <table width='100%'>
                        <tr bgcolor='#00B624'>
                            <td colspan='7' height='25' align='center'><strong>
                            <font color='#000000' size='4' face='tahoma'>SnapShot of VMs staus</font>
                            <font color='#000000' size='4' face='tahoma'> ($(Get-Date))</font>
                            <font color='#000000' size='2' face='tahoma'> <BR>
                            <Br>
                        </tr>
                    </table>
                <table width='100%'>
                <table width='100%'><tbody>
                    <tr bgcolor=black>
                    <td width='10%' height='15' align='center'> <strong> <font color='white' size='2' face='tahoma' >Server Name</font></strong></td>
                    <td width='10%' height='15' align='center'> <strong> <font color='white' size='2' face='tahoma' >Status</font></strong></td>
                       </tr>"
foreach($html in $outputCustom){
    $htmlreport +="<tr bgcolor=cyan>"
    $htmlreport +="<td width='10%' height='15' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.ServerName)</font></strong></td>"
    if($html.status -match 'Created'){
        $htmlreport +="<td width='10%' height='15' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.status)</font></strong></td>"       
     }
     else
     {
        $htmlreport +="<td width='10%' height='15' align='center'> <strong> <font color='white' size='2' face='tahoma' >$($html.status)</font></strong></td>"       
     }
}
$htmlreport +="</tr>"
$htmlreport +="</table>"
$htmlreport +="</body></html>"
$htmlreport | Out-File -FilePath $path\deletionSnapshotReport.html
Invoke-Expression $path\deletionSnapshotReport.html
}
############### VMware Tool Version##############################
Function ToolsVersion-VM{
    Write-Host Gathering Tools Version Info Please wait..... -ForegroundColor Green
    foreach($VM in $VMs){
        Get-VM -name $VM|get-view|`
        Select-object @{N=”VMName”;E={$_.Name}},
        @{Name=”VMwareTools”;E={$_.Guest.ToolsStatus}},
        @{Name="ToolsVersion";E={$_.Guest.ToolsVersion}},
        @{Name=”GuestToolsStatus”;E={$_.Guest.toolsRunningStatus}}
        }
    Write-Host Please wait Work is in Progress..... -ForegroundColor Yellow
    Write-Host DONE! -ForegroundColor Green
}
############## hardware Version##############################
Function HardwareVersion-VM{
    Write-Host Gathering Tools Version Info Please wait..... -ForegroundColor Green
    foreach($VM in $VMs){
            Get-VM -name $VM|get-view|select @{N=”VM Name”;E={$_.Name}}, @{Name="HW Version";expression={$_.config.version}}
       }
     Write-Host Please wait Work is in Progress..... -ForegroundColor Yellow
Write-Host DONE! -ForegroundColor Green
}
#################Upgrade VMware tools###################
Function Upgrade-VMHardware()
{
Foreach ($VM in ($VMs)) {
$input = Read-Host "Enter the Version you want to Upgrade"
$getVM = Get-View -VIObject $VM
$getVersion =$VM.config.version
     $v10 = "vmx-10"
     $v11 = "vmx-11"
     $v13 = "vmx-13"
     if ($getVersion -eq $v10)
{
Write-Host "Version $getVersion detected" -ForegroundColor Red
Write-Host "Upgrading Hardware on" $input -ForegroundColor Yellow
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.ScheduledHardwareUpgradeInfo = New-Object -TypeName VMware.Vim.ScheduledHardwareUpgradeInfo
$vmConfigSpec.ScheduledHardwareUpgradeInfo.UpgradePolicy = "always"
$vmConfigSpec.ScheduledHardwareUpgradeInfo.VersionKey = $input
$getVM.ReconfigVM($vmConfigSpec)
}
}
}
################Check Tool Status################
Function Check-ToolsStatus
{
    $custom =@()
    foreach($VM in $VMs){
        $getVM = Get-VM $VM
        $vmview = get-VM $vm | Get-View
        $status = $vmview.Guest.ToolsStatus
        if ($status -match "toolsOld")
        {
            $vmTools = "Old"
        }
        elseif($status -match "toolsNotRunning")
        {
            $vmTools = "NotRunning"
        }
        elseif($status -match "toolsNotInstalled")
        {
           $vmTools = "NotInstalled"
        }
        elseif($status -match "toolsOK")
        {
            $vmTools = "OK"
        }
        else
        {
         $vmTools = "ERROR"
        }
       $custom +=[PSCUstomObject]@{
        'Name' = $getvm
        'Tools' =$status
        'Status' =$vmtools
         }
    }
Foreach($Output in $custom){
    $Output
}
}
############### Family-VMs #################
Function Family-VM{
Get-VM | Sort-Object -Property Name |
Get-View -Property @("Name", "Config.GuestFullName", "Guest.GuestFullName", "Config.Version") |
Select -Property Name,
@{N = 'HWVersion'; E = {$_.Config.Version}},
@{N = "Configured OS"; E = {$_.Config.GuestFullName}},
@{N = "Running OS"; E = {$_.Guest.GuestFullName}} |
  Format-Table -AutoSize
  }
###############VM status Information #################################
Function VMStatus{
    foreach($VM in $VMs){
    $count=$Count+1
    Write-Host "Gathering Info from $VM : $count" -ForegroundColor DarkGreen
    Get-VM -name $VM|get-view|Select @{N=”VM Name”;E={$_.Name}},
                                 @{Name=”Hostname”;E={$_.Guest.hostname}},
                                 @{Name="GuestOS";E={$_.Guest.GuestFamily}}
                                 @{Name=”Total CPU”;E={$_.summary.config.numcpu}},
                                 @{Name=”Memory”;E={$_.summary.config.memorysizemb}},
                                 @{Name=”VMware Tools”;E={$_.Guest.ToolsStatus}},
                                 @{Name=”Folder”;E={(Get-VM -Name $VM).Folder.Name}},
                                 @{Name=”ToolsVersionstatus”;E={$_.Guest.ToolsVersionStatus}},
                                 @{Name=”ToolsRunningStatus”;E={$_.Guest.toolsRunningStatus}},
                                 @{Name=”ToolsVersion”;E={$_.Guest.ToolsVersion}},
                                 @{Name='ToolsUpgradePolicy';exp={(get-vm -name $VM).ExtensionData.Config.Tools.ToolsUpgradePolicy}},
                                 @{Name=”PowerState”;E={(Get-VM -Name $VM).Powerstate}},
                                 @{Name=”IP Adapter”;E={(Get-VM -Name $VM).Guest.IPAddress}},
                                 @{Name=”UUID”;E={Get-VM $VM|%{(Get-View $_.Id).config.uuid}}},
                                 @{Name=”OS Name”;E={(Get-VM -Name $VM).Guest.OSFullName}},
                                 @{Name="HW Version";expression={$_.config.version}},
                                 @{Name="Tools_Autoinstall_Disable";expression={(Get-AdvancedSetting -Entity $VM -Name isolation.tools.autoInstall.disable).value}}|Export-Csv $path\Pre_Post_Check.csv -NoTypeInformation -Append
<#
                @{Name = 'PowerState'; Expression = {$_.PowerState}},
                @{Name = 'vCenter'; Expression = {$vcent = $_.uid -replace ".+@"; $vcent = $vcent -replace ":.+"; Write-Output $vcent}},
                @{Name = 'Datacenter'; Expression = {$_.VMhost | Get-Datacenter | select -ExpandProperty Name}},
                @{Name = 'Cluster'; Expression = {$_.VMhost | Get-Cluster | select -ExpandProperty Name}},
                @{Name = 'VMHost'; Expression = {$_.VMHost}},
                @{Name = 'Datastore'; Expression = {($_ | Get-Datastore | select -ExpandProperty Name) -join ', '}},
                @{Name = 'Folder'; Expression = {$_.Folder}},
                @{Name = 'GuestOS'; Expression = {$_.ExtensionData.Config.GuestFullName}},
                @{Name = 'NetworkName'; Expression = {($_ | Get-NetworkAdapter | select -ExpandProperty NetworkName) -join ', '}},
                @{Name = 'IPAddress'; Expression = {($_.ExtensionData.Summary.Guest.IPAddress) -join ', '}},
                @{Name = 'MacAddress'; Expression = {($_ | Get-NetworkAdapter | select -ExpandProperty MacAddress) -join ', '}},
                @{Name = 'VMTools'; Expression = {$_.ExtensionData.Guest.ToolsVersionStatus2}}
#>
}
    Write-Host Please wait Work is in Progress..... -ForegroundColor Yellow
    Start-Sleep -s 10
    Write-Host DONE! -ForegroundColor Green
Set-Option
}
################ Disconnecting from vCenter ##############
function Disconnect-vCenter{
    Write-Host "Disconnecting from vCenter....." -ForegroundColor Green
    Disconnect-VIServer -Server * -Confirm:$false
    Start-Sleep -Seconds 5
}
############### Connect with vCenter#################
function Connecting-vCenter{
    $folder = "."
    $vcenters = Get-Content $folder\vcenter.txt
    $VMs=Get-Content $folder\servers.txt
    $username=Read-Host -Prompt "Enter Username"
    $password1=Read-Host -AsSecureString "Enter Password"
    $username = $user
    Write-Host "Hello $user - Find the list of VMs" -ForegroundColor Green
    $VMs
    Write-Host "Find the List of vCenter" -ForegroundColor Green
    $vcenters
    $mycreds = New-Object System.Management.Automation.PSCredential ("$username","$password1")
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -confirm:$false -Scope Session -DefaultVIServerMode Multiple|Out-Null
    Write-host "Please wait Connecting to vCenter..." -ForegroundColor Green
    foreach($vcent in $vcenters){
        Connect-ViServer  -Server $vcent -Credential $mycreds -SaveCredentials -Verbose
            }
} 
################ Exit from PowerShell Script ##############
Function Exit-Script {
    Write-Host "Exit from Script"
    }

 $on = 0
 $off =0
