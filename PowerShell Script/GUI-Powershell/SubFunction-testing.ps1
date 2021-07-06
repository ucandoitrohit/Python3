#
# Global Variable
#
Function Get-globalVariable {
    $Global:con = ''
    $Global:VCStatus = ''
    $Global:tgserver =   "$tserver.Text"
    $Global:tgusername = "$tusername.Text"
    $Global:tgpasword =  "$tpassword.Text"
    $Global:HTMLFormat = ''
    $Global:HTMLFormat2 = ''
    $Global:Username = "$env:USERPROFILE\Documents"
#    $Global:filename = 'C:\Users\rovis\Documents\VC-Form'
    $Global:filename = "$Username\VC-Form"
    $Global:datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
    $Global:mailvmtool = ''
    $Global:mailSubject = ''
    $Global:VCName = ''
    $Global:EmailSubject  = $textBox4.Text
    $Global:EmailSendTo   = $textBox5.Text
    $Global:EmailSendFrom = $textBox6.Text
    $Global:VMCountValue  = $vmcount.Checked
    $Global:HostSensorLabel = $HostSensorLabel.Text
 
 
}
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#Connection
#
Function get-Connectionvc{
#if ($global:DefaultVIServers.Count -lt 1) {
    if(-NOT ([string]::IsNullOrEmpty($tserver))){
        try{
#            Disconnect-VIServer -Confirm:$false
            $Global:con = Connect-VIServer -Server $tserver.Text -User $tusername.Text -Password $tpassword.Text -ErrorAction SilentlyContinue
            $lcon = $con.IsConnected
                if($lcon){
                    $Global:VCName = $Global:con.Name
                    $lcon = $true
                    $lconnected.BackColor = "Transparent"
                    $lconnected.ForeColor = "lime"
                    $lconnected.Text ="Connected"
                    $bConnect.Visible = $false
                    $ddisconnect.Visible = $true
                    $button3.Visible = $true
                    $objStatusBar.Text = "Connected.."
                    $tusername.ReadOnly = $true
                    $tpassword.ReadOnly = $true
                }
                else
                {
                    $lcon = $false
                    $lconnected.ForeColor = "Red"
                    $lconnected.Text = "Not Connect"
                    $objStatusBar.Text = "Not Connected"
                    [System.Windows.Forms.MessageBox]::Show("Invalid Credentials...")
                    $tusername.ReadOnly = $false
                    $tpassword.ReadOnly = $false
                }
            }
          Catch [VMware.VimAutomation.Sdk.Types.V1.ErrorHandling.VimException.VimException] {
              if($error[0].Exception.ErrorCategory -eq 'objectNotFound'){
                     $objStatusBar.Text = "Not Connected"
                    [System.Windows.Forms.MessageBox]::Show("Please select the vCenter...")
            }
         }
    }
  #}
  #else
  #{
#  Disconnect-VIServer -Confirm:$false
#  }
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# HTML Report
#
Function Get-HtmlReport{
$Heading = "<h1>Daily Health Check Report</h1>"
$Global:HTMLFormat = @"
    <style>
        body {background-color: white;font-family: Arial; font-size: 12pt;}
        h1 {color: orage; text-align: center;font-size: 20px;display: block;font-family: "Arial Black", Times, serif;}
        h2 {color: green; font-family: "Arial Black"}
        TABLE{border-style: solid;border-color: black;}
        TH{border-style: solid;border-color: Black;background-color:     #4682B4; color: white;padding: 8px}
        TD{background-color:#d3d3d3;padding: 8px;}
        table { border-collapse: collapse;width: 100%; }
        table, th, td {
            border: 1px solid black;height: 25px;text-align: Center;font-weight: 14px;
        }
        </style>
"@
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-HtmlReport2{
$Global:HTMLFormat2 = @"
<style>
     body{ font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; }
     table{ border-collapse: collapse; border: none; font: 10pt Verdana, Geneva, Arial, Helvetica, sans-serif; color: black;
     margin-bottom: 10px; }
     table td{  font-size: 10px; padding-left: 0px;padding-right: 20px;  text-align: left; }
     table th{  font-size: 10px;  font-weight: bold;  padding-left: 0px;  padding-right: 20px;  text-align: left; }
     h1 {color:     orage; text-align: center;font-size: 20px;display: block;font-family: "Arial Black", Times, serif;}
     h2{  clear: both; font-size: 130%;color:#00134d; }
     p{  margin-left: 10px; font-size: 12px; }
     table.list{  float: left; }
     table tr:nth-child(even){background: #e6f2ff;}
     table tr:nth-child(odd) {background: #FFFFFF;}
     div.column {width: 320px; float: left;}
     div.first {padding-right: 20px; border-right: 1px grey solid;}
     div.second {margin-left: 30px;}
    table{ margin-left: 10px;}
</style>
"@
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Daily Health Check
#
Function Get-DailyHealth{
    $VCServer = "$tserver.Text"
    $newdate = $Global:datefile
    [string] $dt3 = get-date -Format dd/MM/yyyy
    $ReportExport = "C:\Users\rovis\Documents\VC-Form"
    $filename = "$ReportExport\$VCServer-DailyReport-" + $datefile + ".html"
    $snapshotdays = "3"
    $Snapshotdate = (Get-Date).AddDays(-$snapshotdays)
    $VCEventDate = (Get-Date).AddDays(-1)
    $datastorePrecFree = "20"
    $VMwareToolsReport = ""
    Write-Host "Checking vCenter "$VCServer" Connection" -ForegroundColor Green
        if($Global:VCStatus){
                $VCConnect = $Global:vc | Select-Object Name,@{N="Vcenter Server Available";E={$VCStatus}},Port,version | ConvertTo-HTML -Fragment -PreContent "<h2>vCenter Responding..</h2>"
#
#
#############################################################################################################################################################################################
#
# Check vCenter Certifcation
#
$VCName = $Global:vc.Name
$VCURL = "HTTPS://$VCName/ui"
add-type @"
            using System.Net;
            using System.Security.Cryptography.X509Certificates;
            public class TrustAllCertsPolicy : ICertificatePolicy {
                public bool CheckValidationResult(
                    ServicePoint srvPoint, X509Certificate certificate,
                    WebRequest request, int certificateProblem) {
                    return true;
                }
            }
"@
        [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
            try {
                    $VCWebCheck = Invoke-WebRequest -Uri $VCURL -UseBasicParsing
                 }
                 catch {
                    $ErrorException = $_.Exception
                    $ErrorResponse = $_.Exception.Response
                    }
    if ($VCWebCheck.StatusCode -eq "200") {
        $VCResponseStatus = $VCWebCheck| Select-Object @{N="VC Web URL";E={$VCURL}},StatusCode,@{N="StatusDescription";E={"OK"}} | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Connection Response</h2>"
    }
    Else
    {
        $VCResponseStatus = $ErrorResponse | Select-Object @{N="VC Web URL";E={$_.ResponseUri}},StatusCode,@{N="StatusDescription";E={$ErrorException.Message}} | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Connection Response</h2>"
    }
#
#
#############################################################################################################################################################################################
#
# VMWare Tools
#
        Write-Host "Checking for out of date VMware tools" -ForegroundColor Green
        $VMwareToolsReport = Get-VM | get-view | Select-Object Name,
                @{N="HW Version";E={$_.Config.Version}}, @{N="ToolsVersion";E={$_.Config.tools.ToolsVersion}},
                @{N="VMToolsStatus";E={$_.Guest.ToolsStatus}},@{N="ToolsVersionStatus";E={$_.Guest.ToolsVersionStatus}},@{N="VMPowerstatus";E={$_.runtime.PowerState}} |
                Where-Object {$_.VMToolsStatus -Notlike "toolsOK" -and $_.VMPowerstatus -eq "poweredOn"}
        if ($VMwareToolsReport) {
                $vmToolsReport = $VMwareToolsReport | ConvertTo-HTML -Fragment -PreContent "<h2>VMwareTools Report</h2>"
                $vmToolsReport = $vmToolsReport | Foreach {
                    $_ -replace "<td>toolsNotRunning</td>","<td style=`"color:red`">toolsNotRunning</td>"
                    }
            }
            else
            {
                $vmToolsReport = "No VM's With Out Of Date VMware Tools"
            }
#
#
#############################################################################################################################################################################################
#
# Snapshot
#
        Write-Host "Checking for Snapshots older than $($snapshotdays) days" -ForegroundColor Green
        $Snapshot  = get-vm | get-snapshot
        $SnapshotReport = $Snapshot | Select-Object vm, name,created,description | Where-Object {$_.created -lt $Snapshotdate}
        if ($SnapshotReport) {
                $SnapReport = $SnapshotReport | ConvertTo-HTML -Fragment -PreContent "<h2>Snapshot Report</h2>"
            }
            else
            {
               $SnapReport = "<h2>Snapshot Report</h2>" + "No Snapshots older than $($snapshotdays)"
            }
#
#
#############################################################################################################################################################################################
#
# VMware Host Alarms
#
        Write-Host "Checking for active VMware host alarms new" -ForegroundColor Green
        $VMHAlarmReport = @()
        $HostAlert = @()
        $ServiceInstance = get-view ServiceInstance
        $alarmMgr = get-view $ServiceInstance.Content.alarmManager
 
        $valarms = $alarmMgr.GetAlarm($null) | Select-Object value, @{N="name";E={(Get-View -Id $_).Info.Name}}
 
        $HostsViews = Get-View -ViewType hostsystem
 
 
        foreach ($HostsView in ($HostsViews | Where-Object {$_.TriggeredAlarmState} | Sort-Object Name)){
           Foreach ($hostsTriggeredAlarm in $HostsView.TriggeredAlarmState){
             $HostAlert = New-Object PSObject -Property @{
                 "Object" = $HostsView.name;
                 "Alarm" = ($valarms | Where-Object {$_.value -eq ($hostsTriggeredAlarm.alarm.value)}).name;
                 "Status" = $hostsTriggeredAlarm.OverallStatus;
                 "Time" = $hostsTriggeredAlarm.time.ToLocalTime()
              }
              $VMHAlarmReport  += $HostAlert
           }
        }
        if($VMHAlarmReport)
        {
            $VMHAlarms = $VMHAlarmReport | Select-Object Object, Alarm, Status, Time | Sort-Object Time  | ConvertTo-HTML -Fragment -PreContent "<h2>ESXi Host Alerts</h2>"
                $VMHAlarms = $VMHAlarms | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                    }
            
           }
            else
            {
            $VMHAlarms = "<h2>VMHost Alerts</h2>" + "No active alarms for VMware host's"
            }
#
#
##############################################################################################################################################################################################
#
#
        Write-Host "Checking for Critical events for the last 12 hours" -ForegroundColor Green
        $start = (Get-Date).AddHours(-12)
        $VCAlerts = Get-VIEvent -Start $start -MaxSamples ([int]::MaxValue) | Where-Object {$_ -is [VMware.Vim.AlarmStatusChangedEvent] -and ($_.To -match "red|yellow") -and ($_.FullFormattedMessage -notlike "*Virtual machine*") -and ($_.CreatedTime -gt $VCEventDate)}
       
        if ($VCAlerts) {
            $ActiveVCAlert = $VCAlerts | Select-Object @{N="VM"; E={$_.VM.Name}},@{N="vCenter Events";E={$_.FullFormattedMessage}}, @{N="Status";E={$_.To}}, CreatedTime | Sort-Object CreatedTime | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Alerts last 12 hr</h2>"
            $ActiveVCAlert = $ActiveVCAlert | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
            $ActiveVCAlert = $ActiveVCAlert | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }
 
            }
            else
        {
            $ActiveVCAlert = "<h2>vCenter Alerts</h2>" + "No Active Alerts For The Last 12 Hours"
        }
 
#
#
#############################################################################################################################################################################################
#
# VM Alarms
#
        Write-Host "Checking for active VM alarms" -ForegroundColor Green
        $ServiceInstance = get-view ServiceInstance
        $alarmMgr = get-view $ServiceInstance.Content.alarmManager
 
        $valarms = $alarmMgr.GetAlarm($null) | Select-Object value, @{N="name";E={(Get-View -Id $_).Info.Name}}
        $FullVM = Get-View -ViewType VirtualMachine | Where-Object {-not $_.Config.Template}
        $vmsalarms = @()
        $VMAlarms = @()
        foreach ($VMView in ($FullVM | Where-Object {$_.TriggeredAlarmState})){
           Foreach ($VMsTriggeredAlarm in $VMView.TriggeredAlarmState){
             $vmsalarms = New-Object -TypeName PSObject -Property @{
                 Object = $VMView.name
                 Alarm = ($valarms |Where-Object {$_.value -eq ($VMsTriggeredAlarm.alarm.value)}).name
                 Status = $VMsTriggeredAlarm.OverallStatus
                 Time = $VMsTriggeredAlarm.time
              }
              $VMAlarms += $vmsalarms
           }
        }
        if ($VMAlarms){
        $VMAlarmReport = $VMAlarms | ConvertTo-HTML -Fragment -PreContent "<h2>VM Alerts</h2>"
        $VMAlarmReport = $VMAlarmReport | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
        
        }
        else
        {
        $VMAlarmReport = "<h2>VM Alerts</h2>" + "No active alarms for VM"
        }
#
#
#############################################################################################################################################################################################
#
#
        Write-Host "Checking for vCenter Events Overall" -ForegroundColor Green
        $si = Get-View ServiceInstance
        $alarmMgr = Get-View -Id $si.Content.AlarmManager
        $vCenterEventsAlarm = Get-Inventory | %{
            $alarmMgr.GetAlarmState($_.ExtensionData.MoRef) |
                where{[VMware.Vim.ManagedEntityStatus]::yellow,[VMware.Vim.ManagedEntityStatus]::red -contains $_.OverallStatus} |
                Select-Object @{N='Entity';E={(Get-View -Id $_.Entity).Name}},
                    @{N='Alarm';E={(Get-View -Id $_.Alarm).Info.Name}},
                    OverallStatus,Time
        }
        if ($vCenterEventsAlarm) {
            $VCEventsAlarmsReport = $vCenterEventsAlarm | Sort-Object Time  | ConvertTo-HTML -Fragment -PreContent "<h2>vCenter Events Status Overall</h2>"
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }
            }
            else
        {
            $VCEventsAlarmsReport = "<h2>vCenter Events Alerts</h2>" + "No Alerts on vCenter"
        }
 
#
#
#############################################################################################################################################################################################
#
# DataStore
#
        Write-Host "Checking for datastores below $($datastorePrecFree)% free space" -ForegroundColor Green
        $DSReport = Get-Datastore | Select-Object Name,@{N="UsedSpaceGB";E={[math]::Round(($_.CapacityGB),2)}},
                @{N="FreeSpaceGB";E={[math]::Round(($_.FreeSpaceGB),2)}},
                @{N="%Free";E={[math]::Round(($_.FreeSpaceGB)/($_.CapacityGB)*100,2)}}
               
        $DSBelow = $DSReport | Where-Object {$_."%Free" -lt $($datastorePrecFree)}
 
        if ($DSBelow) {
            $DSExport = $DSBelow | ConvertTo-HTML -Fragment -PreContent "<h2>DataStore Under $($datastorePrecFree)% Free Space</h2>"
        }
        else
        {
            $DSExport = "<h2>DataStore Under $($datastorePrecFree)% Free Space</h2>" + "No DataStores below $($datastorePrecFree)% free space"
        }
#
#
#############################################################################################################################################################################################
#
#  VC Connection End
#
    }
    Else
    {
           $VCConnect  = "<h2>vCenter Response</h2>" + "Cannot Connect to $($VCStatus.Name)"
    }
Write-Host "Done" -ForegroundColor Yellow
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$Heading $VCConnect $VCResponseStatus $vmToolsReport $SnapReport $VMHAlarms $VMAlarmReport $ActiveVCAlert $VCEventsAlarmsReport $DSExport"  | Out-String) -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\daily-report-$newdate.html"
 
 
Invoke-Item "$Global:filename\daily-report-$newdate.html"
$Global:mailvmtool = Get-Content "$Global:filename\daily-report-$newdate.html"
#daily-report-06-15-2021-094845-.html
 
}
#
# End Health Check Report
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# RVTool Reports
#
Function Get-RvTools{
 
    $VCName = $Global:vc.Name
    $VCPasswd = $tpassword.Text
    Write-Host "Generating  RvTools Report "-ForegroundColor Green
    $VCUser = $Global:vc.User
    [string] $RVToolsPath = "C:\Program Files (x86)\Robware\RVTools"
    [string] $dt = get-date -Format ddMMyyyy
    [string] $dt2 = get-date
    [string] $dt3 = get-date -Format dd/MM/yyyy
#    [string] $EncryptedPassword = "_RVToolsPWDLnzfCgGqME/OikoR6Oiwu6I1MlL1cNge8AVe09qYW/0="
    [string] $EncryptedPassword = $VCPasswd
    [string] $XlsxDir1 = "C:\Users\rovis\Documents\VC-Form"
    [string] $XlsxFilesap1 = "rvtool.xlsx"
    Write-Host "Start export for vCenter $VCName" -ForegroundColor DarkYellow
    $Arguments1 = "-u $VCUser -p $EncryptedPassword -s $VCName -c ExportAll2xlsx -d $XlsxDir1 -f $XlsxFilesap1 -DBColumnNames -ExcludeCustomAnnotations"
    Write-Host $Arguments
    $Process = Start-Process -FilePath "$RVToolsPath\RVTools.exe" -ArgumentList $Arguments1 -NoNewWindow -Wait -PassThru
    $OutputFile1 = "C:\Users\rovis\Documents\VC-Form\rvtool.xlsx"
    Write-Host "File save at location $OutputFile1"
    Write-Host "Done..`n" -ForegroundColor Yellow
 
}
#
#sp1secc1t-infra-vc
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Snapshot Report
#
Function Get-SnapshotReport{
    $Headings = "<h1> Snapshot Report </h1>"
    $newdate = $Global:datefile
    Write-Host "Checking VMs for for snapshots" -ForegroundColor Blue
    if($Global:VCStatus){
        $ssvora = Get-vm | Get-Snapshot
        $reportsnap = $ssvora | Select-Object vm, name,description,
                @{Label="Size";Expression={"{0:N2} GB" -f ($_.SizeGB)}} ,Created,
                @{Name="Ageing";Expression={ (New-TimeSpan -End (Get-Date) -Start $_.Created).Days }},
                @{Name="User"; Expression = { (Get-VIEvent -Entity $_.VM -MaxSamples 4000 -Start $_.Created.AddSeconds(-10) | Where {$_.Info.DescriptionId -eq "VirtualMachine.createSnapshot"} | Sort-Object CreatedTime | Select-Object -First 1).UserName}}
        if((($ssvora.vm).count) -gt 0 ){
            Write-Host "Snapshot Found" -ForegroundColor Green
            [System.Windows.Forms.MessageBox]::Show("Snapshot Found.. Generating Report")
            if ($reportsnap) {
                $convertreportsnap = $reportsnap | ConvertTo-HTML -Fragment -PreContent "<h2>Snapshot Report</h2>"
                Write-Host "Generating VM snapshot report" -ForegroundColor Green
                Write-Host "Your snapshot report has been saved to:" $filename -ForegroundColor Green
                Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $convertreportsnap =  "<h2>Snapshot Report</h2>" + "No Snapshots older than $($snapshotdays)"
                [System.Windows.Forms.MessageBox]::Show("No Snapshot Found !")
                Write-Host " No Snapshot Found" -ForegroundColor Red
                Write-Host "Done" -ForegroundColor Yellow
            }
        }
        else
        {
            [System.Windows.Forms.MessageBox]::Show("No Snapshot Found")
            Write-Host " No Snapshot Found" -ForegroundColor Red
            Write-Host "Done" -ForegroundColor Yellow
        }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$Headings $convertreportsnap"  | Out-String) -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\snapshot-$newdate-.html"
    Invoke-Item "$Global:filename\snapshot-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\snapshot-$newdate-.html"
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# VMware Tools
#
Function Get-vmToolsReport{
    $vmwaretoolhading = "<h1> VMwareTools Report </h1>"
    $newdate = $Global:datefile
    if($Global:VCStatus){
        Write-Host "Checking for out of date VMware tools" -ForegroundColor Blue
        $VMwareToolsReport = Get-VM | get-view | Select-Object Name,
                @{N="HW Version";E={$_.Config.Version}}, @{N="ToolsVersion";E={$_.Config.tools.ToolsVersion}},
                @{N="VMToolsStatus";E={$_.Guest.ToolsStatus}},@{N="ToolsVersionStatus";E={$_.Guest.ToolsVersionStatus}},@{N="VMPowerstatus";E={$_.runtime.PowerState}} |
                Where-Object {$_.VMToolsStatus -Notlike "toolsOK" -and $_.VMPowerstatus -eq "poweredOn"}
            if ($VMwareToolsReport) {
                [System.Windows.Forms.MessageBox]::Show("Found VMwareTools are Out of date.. Need to Update!")
                $vmToolsReport = $VMwareToolsReport | ConvertTo-HTML -Fragment -PreContent "<h2>VMwareTools Report</h2>"
                $vmToolsReport = $vmToolsReport | Foreach {
                    $_ -replace "<td>toolsNotRunning</td>","<td style=`"color:red`">toolsNotRunning</td>"
                    }
                Write-Host "Generating VMwareTools Report" -ForegroundColor Green
                Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $vmToolsReport = "No VM's With Out Of Date VMware Tools"
                [System.Windows.Forms.MessageBox]::Show("All VMwareTools are Up-to-date")
                 Write-Host "No VM's With Out Of Date VMware Tools" -ForegroundColor Red
                 Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$vmwaretoolhading $vmToolsReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\vmwaretools-$newdate-.html"
    Invoke-Item "$Global:filename\vmwaretools-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\vmwaretools-$newdate-.html"
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Clear-Output{
    $outputcluster.Text = "NA"
    $outputdatacenter.Text = "NA"
    $outputlogon.Text = "NA"
    $outputhost.Text = "NA"
    $outputservername.Text = "NA"
 
    $ovCenterName.Text = 'NA'
    $oUserConnect.Text = 'NA'
    $oDomainName.Text = 'NA'
    $oVersionName.Text = 'NA'
    $oBuildversion.Text = 'NA'
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# OS Name
#
Function Get-OSType {
$Global:daily = $Global:con.IsConnected
$Global:vc = $Global:con
$Global:VCStatus = $daily
 
$vCenterName = $Global:vc.Name
$vVersionNumber =  $Global:vc.Version
$vBuildVersion = $Global:vc.Build
 
 
$Name = $Global:vc.User
$split = $Name.Split("\")
$vDomain = $split[0]
$vUsers = $split[1]
 
 
$ovCenterName.Text = $vCenterName
$oUserConnect.Text = $vUsers
$oDOmainName.Text = $vDomain
$oVersionName.Text = $vVersionNumber
$oBuildversion.Text = $vBuildVersion
 
 
}
#
#
#
#############################################################################################################################################################################################
#
# vCenter Details
#
Function Get-VcenterType{
 
    $vm = @(Get-VM)
    $vmc = $vm.count
    $outputservername.Text = $vmc
 
    $hosthost =Get-VMHost
    $hostc = $hosthost.count
    $outputhost.Text = $hostc
 
    $ds = Get-Datastore
    $dsc = $ds.count
    $outputlogon.Text = $dsc
 
    $dc = Get-Datacenter
    $dcc = $dc.count
    $outputdatacenter.Text = $dcc
 
    $cc = Get-Cluster
    $ccc = $cc.count
    $outputcluster.Text = $ccc
 
   
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# ESXi CPU Utilization
#
Function Get-CPUEsxiUtiization {
    $newdate = $Global:datefile
    $VCServer = "$tserver.Text"
    $cpuhead = "<h1> CPU Utilization Report </h1>"
    if($Global:VCStatus){
            Write-Host "Checking for CPU Utilization" -ForegroundColor Blue
            $esxicppu = Get-VMHost | Select Name, Parent, ConnectionState, PowerState, NumCpu,
                @{N='CPU GHz Capacity';E={[math]::Round($_.CpuTotalMhz/1000,2)}},
                @{N='CPU GHz Used';E={[math]::Round($_.CpuUsageMhz/1000,2)}},
                @{N='CPU GHz Free';E={[math]::Round(($_.CpuTotalMhz - $_.CpuUsageMhz)/1000,2)}},
                Version, Build, Model, ProcessorType
    if($esxicppu) {
            $cpuutilization = $esxicppu | ConvertTo-HTML -Fragment -PreContent "<h2>ESXi CPU Utilization Report</h2>"
            Write-Host "Generating ESXi CPU Utilization Report" -ForegroundColor Green
            Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $cpuutilization =  "<h2> No Report</h2>"
                Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$cpuhead $cpuutilization"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\esxi-cpu-$newdate-.html"
    Invoke-Item "$Global:filename\esxi-cpu-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\esxi-cpu-$newdate-.html"
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Memory Utilization
#
Function Get-MemoryEsxiUtiization{
    $newdate = $Global:datefile
    $VCServer = "$tserver.Text"
    $memoryhead = "<h1> Memory Utilization Report </h1>"
    if($Global:VCStatus){
            Write-Host "Checking for ESXi Memory Utilization" -ForegroundColor Blue
            $esxiram = Get-VMHost | Select Name, Parent, ConnectionState, PowerState,
                    @{N='MemoryCapacityGB';E={[math]::Round($_.MemoryTotalGB,2)}},
                    @{N='MemoryUsedGB';E={[math]::Round($_.MemoryUsageGB,2)}},
                    @{N='MemoryFreeGB';E={[math]::Round(($_.MemoryTotalGB - $_.MemoryUsageGB),2)}},
                    @{N='FreeP';E={[math]::Round(((100*($_.MemoryTotalGB - $_.MemoryUsageGB))/($_.MemoryTotalGB)),2)}} | sort -Property "FreeP"
    if($esxiram) {
            $ramutilization = $esxiram | ConvertTo-HTML -Fragment -PreContent "<h2>ESXi Memory Utilization Report</h2>"
            Write-Host "Generating ESXi Memory Utilization Report" -ForegroundColor Green
            Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $ramutilization =  "<h2> No Report</h2>"
                Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$memoryhead $ramutilization"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\esxi-ram-$newdate-.html"
    Invoke-Item "$Global:filename\esxi-ram-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\esxi-ram-$newdate-.html"
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# License Utilization
#
Function Get-LicenseReport{
    $newdate = $Global:datefile
    $VCServer = "$tserver.Text"
    $licensehead = "<h1> License Usage Report </h1>"
    if($Global:VCStatus){
        $lmlist = Get-View LicenseManager
        $dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
        $licenseObj1 =@()
        $Report1 =@()
            foreach ($lmview in $lmlist)
            {
                $vcs1 = ([System.uri]$lmview.Client.ServiceUrl).Host
   
                foreach ($license in $lmview.Licenses)
                {
                    $licenseProp = $license.Properties
                    $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
                    if ($license.Name -eq 'Product Evaluation'){$expirationDate = 'Evaluation'}
                    elseif ($null -eq $licenseexpiry){$expirationDate = 'Never'} else {$expirationDate = $licenseexpiry }
   
                    if ($license.Total -eq 0){$totalLicenses = 'Unlimited'} else {$totalLicenses = $license.Total }
   
                    if($license.Used -eq $null){$usedLicense = '0' } else {$usedLicense = $license.Used }
       
                    $licenseObj1 = [PSCustomObject][ordered]@{
                        Name =$license.Name
                        ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                        ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                        LicenseKey = $license.LicenseKey
                        ExpirationDate = $expirationDate
                        Total = $totalLicenses
                        Used = $usedLicense
                        }
                    $Report1 += $licenseObj1
                }
             }
    }
    if($Report1) {
            $licensereport = $Report1 | ConvertTo-HTML -Fragment -PreContent "<h2>License Usage Report</h2>"
            Write-Host "Generating License Usage Report" -ForegroundColor Green
            Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $cpuutilization =  "<h2> No Report</h2>"
                Write-Host "Done" -ForegroundColor Yellow
            }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$licensehead $licensereport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\license-$newdate-.html"
    Invoke-Item "$Global:filename\license-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\license-$newdate-.html"
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Ping-Response{
    $dataGridView1.DataSource=$Null
    $computers = Get-Content $Filename2.Text
    if($computers){
        Write-Debug "Create `$griddata"
        Write-Host  "Create `$griddata"
        $griddata=@()
        foreach($computer in $computers){
   
            $obj=New-Object PSobject
            $obj | Add-Member Noteproperty Computername $computer.ToUpper()
 
            $pingResult=Get-WmiObject -query "Select * from Win32_PingStatus where address='$computer'"
             Write-Debug "Pinged status code is $($pingResult.Statuscode)"
             Write-Host  "Pinged status code is $($pingResult.Statuscode)"
              if ($pingResult.StatusCode -eq 0) {
                   $obj | Add-Member Noteproperty Pinged "Yes"
                   Write-Debug "Adding $($pingresult.ProtocolAddress)"
                   Write-Host  "Adding $($pingresult.ProtocolAddress)"
                   $obj | Add-Member Noteproperty IP $pingResult.ProtocolAddress
              }
              else
              {
                Write-Debug "Ping failed"
                Write-Debug "Setting properties to N/A"
                $obj | Add-Member Noteproperty Pinged "No"
                $obj | Add-Member Noteproperty IP "N/A"
                $obj | Add-Member Noteproperty OS "N/A"
                $obj | Add-Member Noteproperty ServicePack "N/A"
                $obj | Add-Member Noteproperty Uptime "N/A"
                $obj | Add-Member Noteproperty LastBoot "N/A"
                }
            Write-Debug "Adding `$obj to `$griddata"
            $griddata+=$obj
 
            }
        Write-Debug "Creating ArrayList"  
        $array= New-Object System.Collections.ArrayList
        Write-Debug "Adding `$griddata to `$arry"
        Write-Host  "Adding `$griddata to `$arry"
        $array.AddRange($griddata)
        $dataGridView1.DataSource = $array
        #find unpingable computer rows
        Write-Debug "Searching for non-pingable computers"
        for ($x=0;$x -lt $c;$x++) {
            for ($y=0;$y -lt $dataGridView1.Rows[$x].Cells.Count;$y++) {
                $value = $dataGridView1.Rows[$x].Cells[$y].Value
                if ($value -eq "No") {
                #if Pinged cell = No change the row font color
                Write-Debug "Changing color on row $x"
                $dataGridView1.rows[$x].DefaultCellStyle.Forecolor=[System.Drawing.Color]::FromArgb(255,255,0,0)
                }
            }
        }
    }
}
 
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function OSType-Response{
    $dataGridView1.DataSource=$Null
    $computers = Get-Content $Filename2.Text
    if($computers){
        Write-Debug "Create `$griddata"
        $griddata=@()
        foreach($computer in $computers){
            Write-Host "foreach "$computer
            $obj=New-Object PSobject
           $obj | Add-Member Noteproperty Computername $computer.ToUpper()
            $pingResult=Get-WmiObject -query "Select * from Win32_PingStatus where address='$computer'"
            $os = Get-WmiObject Win32_OperatingSystem -computername $computer -ea stop
            Write-Debug "Pinged status code is $($pingResult.Statuscode)"
                if ($pingResult.StatusCode -eq 0) {
                   $obj | Add-Member Noteproperty Pinged "Yes"
                   $obj | Add-Member Noteproperty IP $pingResult.ProtocolAddress
 
                    if ($os) {
                        $lastboot=$os.ConvertToDateTime($os.lastbootuptime)
                        Write-Debug "Adding $lastboot"
                        $uptime=((get-date) - ($os.ConvertToDateTime($os.lastbootuptime))).tostring()
                        Write-Debug "Adding $uptime"
                        $osname=$os.Caption
                        Write-Debug "Adding $osname"
                        $servicepack=$os.CSDVersion
                        Write-Debug "Adding $servicepack"
 
                        $obj | Add-Member Noteproperty OS $osname
                        $obj | Add-Member Noteproperty ServicePack $servicepack
                        $obj | Add-Member Noteproperty Uptime $uptime
                        $obj | Add-Member Noteproperty LastBoot $lastboot
                    }
                    else
                    {
                        Write-Debug "Setting properties to N/A"
                        $obj | Add-Member Noteproperty OS "N/A"
                        $obj | Add-Member Noteproperty ServicePack "N/A"
                        $obj | Add-Member Noteproperty Uptime "N/A"
                        $obj | Add-Member Noteproperty LastBoot "N/A"
                   }
 
              }
              else
              {
                Write-Debug "Ping failed"
                Write-Debug "Setting properties to N/A"
                $obj | Add-Member Noteproperty Pinged "No"
                $obj | Add-Member Noteproperty IP "N/A"
                $obj | Add-Member Noteproperty OS "N/A"
                $obj | Add-Member Noteproperty ServicePack "N/A"
                $obj | Add-Member Noteproperty Uptime "N/A"
                $obj | Add-Member Noteproperty LastBoot "N/A"
                }
            Write-Debug "Adding `$obj to `$griddata"
            $griddata+=$obj
 
            }
        Write-Debug "Creating ArrayList"  
        $array= New-Object System.Collections.ArrayList
        Write-Debug "Adding `$griddata to `$arry"
        $array.AddRange($griddata)
        $dataGridView1.DataSource = $array
        #find unpingable computer rows
        Write-Debug "Searching for non-pingable computers"
        for ($x=0;$x -lt $c;$x++) {
            for ($y=0;$y -lt $dataGridView1.Rows[$x].Cells.Count;$y++) {
                $value = $dataGridView1.Rows[$x].Cells[$y].Value
                if ($value -eq "No") {
                #if Pinged cell = No change the row font color
                Write-Debug "Changing color on row $x"
                $dataGridView1.rows[$x].DefaultCellStyle.Forecolor=[System.Drawing.Color]::FromArgb(255,255,0,0)
                }
            }
        }
    }
}
 
#
# 
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMbyOS{
$VMOSCount = "<h1> VMs By OS Count Report </h1>"
$newdate = $Global:datefile
if($Global:VCStatus){
    Write-Host "Checking for VMs Count by OS Type" -ForegroundColor Blue
    $FullVM = Get-View -ViewType VirtualMachine | Where-Object {-not $_.Config.Template}
    $VMOSversions = @{ }
    $FullVM | % {
    if ($_.Config.AlternateGuestName) { $VMOSversion = $_.Config.AlternateGuestName }
        if ($_.Guest.GuestFullName) { $VMOSversion = $_.Guest.GuestFullName }
            if (!($VMOSversion)) {
                if (!($_.Guest.ToolsStatus.Value__ )) {
                    $VMOSversion = "Unknown - no VMTools"
                } else {
                    $toolsversion = $_.Config.Tools.ToolsVersion
                    $VMOSversion = "Unknown - tools version $toolsversion"
                }
            }
            $VMOSversions.$VMOSversion++
        }
}
    $myCol = @()
    foreach ( $gosname in $VMOSversions.Keys | sort) {
          $MyDetails = "" | Select-Object OS, Count
          $MyDetails.OS = $gosname
          $MyDetails.Count = $VMOSversions.$gosname
          $myCol += $MyDetails
        }
    $newOS = $myCol
          if ($newOS) {
                [System.Windows.Forms.MessageBox]::Show("Found VM with OS Name and Count.. !")
                $vmOSbyname = $newOS | Sort-Object Count -desc | ConvertTo-HTML -Fragment -PreContent "<h2>VMs By OS Count Report</h2>"
                Write-Host "Found VM with OS Name and Count" -ForegroundColor Green
                Write-Host "Done" -ForegroundColor Yellow
            }
            else
            {
                $vmOSbyname = "No VM's Found"
                [System.Windows.Forms.MessageBox]::Show("No Record Found")
                 Write-Host "No VM's Found" -ForegroundColor Red
                 Write-Host "Done" -ForegroundColor Yellow
            }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VMOSCount $vmOSbyname"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\vmOSname-$newdate-.html"
    Invoke-Item "$Global:filename\vmOSname-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\vmOSname-$newdate-.html"
 
    Remove-Variable VMOSversions
 
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-DatastoreUtilization{
$DSReportHeading = "<h1> Datastore Usage Report </h1>"
$newdate = $Global:datefile
if($Global:VCStatus){
 
 
        Write-Host "Checking for datastores below Usage"-ForegroundColor Green
        $DSReportUtilization = Get-Datastore | Select-Object Name, State, Type,
                    @{N="UsedSpaceGB";E={[math]::Round(($_.CapacityGB),2)}},
                    @{N="FreeSpaceGB";E={[math]::Round(($_.FreeSpaceGB),2)}},
                    @{N="%Free";E={[math]::Round(($_.FreeSpaceGB)/($_.CapacityGB)*100,2)}}
               
        $DSUtilization = $DSReportUtilization
 
        if ($DSUtilization) {
            $DSUtilizationReport = $DSUtilization| Sort-Object Name | ConvertTo-HTML -Fragment -PreContent "<h2>DataStore Usage Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
        }
        else{
            $DSUtilizationReport = "No DataStores Found"
            Write-Host "Done" -ForegroundColor Yellow
            }
 
}
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$DSReportHeading $DSUtilizationReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\dsutilization-$newdate-.html"
    Invoke-Item "$Global:filename\dsutilization-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\dsutilization-$newdate-.html"
 
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-vSANDatastoreUsagae{
 
$ClusterHeading =    "<h1>vSAN Datstore Report</h1>"
$newdate = $Global:datefile
 
if($Global:VCStatus){
     Write-Host "Generating  vSAN Datastore "-ForegroundColor Green
     $Clus3 = Get-Cluster
     $Clus2 = $Clus3.Name
     $clusname = Get-Cluster -Name $Clus2
     foreach ($clus in $clusname){
     $ClusterName1 = $Clus
     }
        if ($ClusterName1) {
            $ClusterNameReport1 = $ClusterName | ConvertTo-HTML -Fragment -PreContent "<h2>vSAN Datastore Usage</h2>"
        }
        else{
            $ClusterNameReport1 = "No DataStores Found"
            }
 
#-----------------------------------------------------------------------------------------------------
    Write-Host "Generating vSAN Datastore Details" -ForegroundColor Green
    $vSANInfoCheck = @()
    $vSANInfo = @()
    #$vSANDS2 = (Get-Datastore | Where-Object {$_.Type -eq "vsan"} | Select-Object Name)
    $vSANDS2 = (Get-Datastore | Where-Object {$_.Type -eq "vsan"} | Select-Object Name)
    $vSANDS1 = $vSANDS2.Name
    $vSANDSall = Get-Datastore -Name $vSANDS1
    #$dc1 = Get-Datastore -Name VxRail-Atlas-Infra-Test-SAN-Datastore    | Select Name, @{N="Cluster"; E={(Get-VMHost -Datastore $_ | Get-Cluster).Name}}, FreeSpaceGB, CapacityGB
 
#    $vSANDSallw = Get-Datastore -Name VxRail-Virtual-SAN-Datastore-06add746-890b-421f-8755-9ff92e770527  | Select  @{N="Cluster"; E={(Get-VMHost -Datastore $_ | Get-Cluster).Name}}
   
    foreach($vSANDS in $vSANDSall){
 
    $vSANInfo = New-Object -TypeName PSObject -Property @{
        "VSAN Name" = $vSANDS.Name
        "State"     = $vSANDS.State 
        "ID"        = $vSANDS.Id
        "Capacity"  = $vSANDS.CapacityGB
        "Free"      = $vSANDS.FreeSpaceGB
        "Free%"     = ([math]::Round(($vSANDS.FreeSpaceGB)/($vSANDS.CapacityGB)*100,2))
       
        }
        $vSANInfoCheck += $vSANInfo
    }
        if ($vSANInfoCheck){
            $vSANInfoReport = $vSANInfoCheck | Select-Object "VSAN Name","State", "ID", "Capacity", "Free", "Free%" | ConvertTo-HTML -Fragment -PreContent "<h2>vSAN Datastore Details </h2>"
        }
        else
        {
            $vSANInfoReport = "No Information"
        }
 
#-----------------------------------------------------------------------------------------------------
   Write-Host "General Information" -ForegroundColor Green
    $GenInfoCheck = @()
    $GenInfo = @()
    $Clus9 = Get-Cluster
    $Clus8 = $Clus9.Name
    $clusname7 = Get-Cluster -Name $Clus8
    $vSanDisks = Get-VSanDisk
    $vSanDGroups = Get-VsanDiskGroup
    foreach($clusname6 in $clusname7){
        $GenInfo = New-Object -TypeName PSObject -Property @{
            "Cluster Name"     = $clusname6.Name
            "vSAN Enable"  = $clusname6.VsanEnabled
            "Disk Group"   = ($vSanDGroups).count
            "SSD Disk"     = (($vSanDisks | where {$_.IsSSD -eq "True"}).count)
            "Non-SSD Disk" = (($vSanDisks | where {$_.IsSSD -ne "True"}).count)
            "Disk Claim Mode" = $clusname6.VsanDiskClaimMode
        }
        $GenInfoCheck += $GenInfo
    }
    if ($GenInfoCheck){
        $GenInfoReport = $GenInfoCheck | Sort-Object "Cluster Name" | ConvertTo-HTML -Fragment -PreContent "<h2>General Information</h2>"
        }
        else
        {
            $GenInfoReport = "No Information"
        }
#>
 
#------------------------------------------------------------------------------------
 
   Write-Host "Generating vSAN Storage Policy.." -ForegroundColor Green
    $vSANPolicyInfo = @()
    $vSANPolicyReport = @()
    $vSANPolicyCheck = @()
    $vSANPolicy2 = Get-SpbmStoragePolicy -Namespace VSAN
    #$vSANPolicy2 = (Get-SpbmStoragePolicy | Where-Object {$_.name -like "*san*"} | Select-Object Name)
    $vSANPolicy1all = $vSANPolicy2.Name
   
    foreach($vSANPolicy1 in $vSANPolicy1all){
    $vSANPolicy = (Get-SpbmStoragePolicy -Name $vSANPolicy1).AnyOfRuleSets.allofrules
#    foreach($vSANPolicy in $vSANPolicyall){
    $vSANPolicyInfo = New-Object -TypeName PSObject -Property @{
        "vSAN Policy Name"            = $vSANPolicy1
 
        "VSAN.hostFailuresToTolerate" = $vSANPolicy.Value[0]
        "VSAN.stripeWidth" = $vSANPolicy.Value[1]
        "VSAN.forceProvisioning" = $vSANPolicy.Value[2]
        "VSAN.proportionalCapacity" = $vSANPolicy.Value[3]
        "VSAN.cacheReservation" = $vSANPolicy.Value[4]
    }
    $vSANPolicyCheck += $vSANPolicyInfo
#}
}
        if ($vSANPolicyCheck){
            $vSANPolicyReport = $vSANPolicyCheck | ConvertTo-HTML -Fragment -PreContent "<h2>vSAN Storage Policy </h2>"
        }
        else
        {
            $vSANPolicyReport = "No Information"
        }
        #>
 
#---------------------------------------------------------------------------------------------------------------------------------
 
 
 
    Write-Host "Generating vSAN Disk Details.." -ForegroundColor Green
    $Obj  = @()
    $Objs =  @()
    $vSanDisks23 = Get-VSanDisk
    Foreach($vSanDiskOri32 in $vSanDisks23){
 
    $Obj += [pscustomobject] @{
           "Name"     = $vSanDiskOri32.CanonicalName
            "SSD"     = $vSanDiskOri32.IsSsd
            "Vendor"  = $vSanDiskOri32.ExtensionData.Vendor
            "Model"   = $vSanDiskOri32.ExtensionData.Model
            "Size"    = [math]::Round($vSanDiskOri32.CapacityGB,2)
            "Used%"   = [math]::Round($vSanDiskOri32.UsedPercent,2)
            "Depth"   = $vSanDiskOri32.ExtensionData.QueueDepth
            "Version" = $vSanDiskOri32.ExtensionData.VsanDiskInfo.FormatVersion
            "UUID"    = $vSanDiskOri32.ExtensionData.VsanDiskInfo.VsanUuid
            "Host"    = $vSanDiskOri32.VsanDiskGroup.VMHost
            "Disks Group" = $vSanDiskOri32.VsanDiskGroup.Name
            }
        }
        if ($Obj){
            $vSanDisksReport = $Obj  | ConvertTo-HTML -Fragment -PreContent "<h2>vSAN Storage Policy </h2>"
            Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
            $vSanDisksReport = "No Information"
            Write-Host "Done" -ForegroundColor Yellow
        }
}
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$ClusterNameReport1 $GenInfoReport $vSANInfoReport $vSANPolicyReport $vSanDisksReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\clusteeer-$newdate-.html"
    Invoke-Item "$Global:filename\clusteeer-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\clusteeer-$newdate-.html"
}
 
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Set-SnapshotCreation{
    $newdate = $Global:datefile
    $VCServer = "$tserver.Text"
    $SnapshotCretateHeading = "<h1> Snapshot Creation </h1>"
    $StatusCreate = ''
    $ResultCreate = @()
    $ResultReportCreate = @()
 
    Write-Host "You are looking to take Snapshot..." -ForegroundColor Green
    $SnapshotVMNameCreate = Get-Content $ip.text
    Foreach($SnapVMCreate in $SnapshotVMNameCreate){
        $SnapVMfoundCreate = Get-VM $SnapVMCreate
        if($SnapVMfoundCreate){
        try{
            Write-Host "VM Found.. Creating the Snapshot of VMs- $SnapVMfoundCreate.Name " -ForegroundColor Green
            $SnapTake = Get-Vm $SnapVMfoundCreate | New-Snapshot -Name "$SnapVMfoundCreate-Snap"  -description "Created" -memory:$false -quiesce:$false -confirm:$false -runasync:$true
#            $SnapTakeName = Get-Vm $SnapVMfoundCreate | Get-Snapshot
            $StatusCreate = "Created"
 
           Write-Host "Done" -ForegroundColor Yellow
           
            }
            catch
            {
            Write-Host -foregroundcolor RED -backgroundcolor BLACK "Error creating new snapshot. See VCenter log for details."
            }
        }
        else
        {
         Write-Host "VM Not Found.. Snapshot not created "  
         $StatusCreate = "Not Created"
        }
              $ResultCreate += [PSCustomObject] @{ 
                           Server      = $SnapVMfoundCreate
                Description = $SnapTake.Description
                TakeON      = $SnapTake.StartTime
                Status      = $StatusCreate
                     }
    }
 
 
        if ($ResultCreate){
            $ResultReportCreate = $ResultCreate  | ConvertTo-HTML -Fragment -PreContent "<h2>Snapshot Creation Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
            $ResultReportCreate = "No Information"
        }
            Write-Host "Done" -ForegroundColor Yellow
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$SnapshotCretateHeading $ResultReportCreate"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\snapshot-taken-$newdate-.html"
Invoke-Item "$Global:filename\snapshot-taken-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\snapshot-taken-$newdate-.html"
 
}
#
#
#
 
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
 
Function Set-SnapshotDeletion{
    $newdate = $Global:datefile
    $SnapshotDeleteHeading = "<h1> Snapshot Deletion </h1>"
    $StatusDel = ''
    $ResultDel = @()
    $ResultReportDelete = @()
    Write-Host "You are looking to take Snapshot..." -ForegroundColor Green
    $SnapshotVMNameDel = Get-Content $ip.text
    Foreach($SnapVMDel in $SnapshotVMNameDel){
        $SnapVMfoundDel = Get-VM $SnapVMDel
        $SnapDelete = Get-VM -Name $SnapVMfoundDel | Get-Snapshot
        if($SnapVMfoundDel -and $SnapDelete)
        {
        try
            {
                Write-Host "VM Found.. Deleting the Snapshot of VMs- $SnapVMfoundDel.Name" -ForegroundColor Green
                $SnapDel   = Get-VM -Name $SnapVMfoundDel | Get-Snapshot | Remove-Snapshot -Confirm:$false -runasync:$true
                $StatusDel = "Deleted"
                Write-Host "Done" -ForegroundColor Yellow
            }
        catch
            {
                Write-Host -foregroundcolor RED -backgroundcolor BLACK "Error creating new snapshot. See VCenter log for details."
            }
        }
        else
        {
            Write-Host "No snapshot found... already Deleted "  
            $StatusDel = "Already Deleted"
            Write-Host "Done" -ForegroundColor Yellow
        }
   
    $ResultDel += [PSCustomObject] @{ 
            Server = $SnapVMfoundDel
            Status =  $StatusDel
            DeletedOn = $SnapDel.StartTime
            }
}
 
 
 
        if ($ResultDel){
            $ResultReportDelete = $ResultDel  | ConvertTo-HTML -Fragment -PreContent "<h2>Snapshot Deletion Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
            $ResultReportDelete = "No Information"
            Write-Host "Done" -ForegroundColor Yellow
 
        }
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$SnapshotDeleteHeading $ResultReportDelete"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\snapshot-delete-$newdate-.html"
Invoke-Item "$Global:filename\snapshot-delete-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\snapshot-delete-$newdate-.html"
 
 
}
 
 
 
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
##11-June
Function Get-HALogsStatus{
        $newdate = $Global:datefile
        $HAheading = "<h1>VMware High Availability</h1>"
        $HAResult = @()
        $HAResultReport = @()
        Write-Host "Generating the HA logs Report for 4 days..." -ForegroundColor Green
 
        $out = Get-VIEvent -MaxSamples 100000 -Start (Get-Date).AddDays(-4) -Type Warning | Where {$_.FullFormattedMessage -match "vSphere HA restarted virtual machine"} |`
        Select-Object ObjectName, CreatedTime,FullFormattedMessage, @{ Name="VM"; Expression={$_.Vm.Name}}|  sort CreatedTime –Descending
            foreach ( $HAstatus in $out)
            {
            $HAResult += [PSCustomObject] @{
                SourceVM  = $HAstatus.ObjectName
                Time    = $HAstatus.CreatedTime
                Trigger = $HAstatus.FullFormattedMessage
                DestinationVM = $HAstatus.VM
                }
            }
           
 
        if ($HAResult){
            $HAResultReport = $HAResult  | ConvertTo-HTML -Fragment -PreContent "<h2>VMware High Availability Logs</h2>"
            Write-Host "Done" -ForegroundColor Yellow
 
        }
        else
        {
            $HAResultReport = "No Information"
            Write-Host "Done" -ForegroundColor Yellow
 
        }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$HAheading $HAResultReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\halog-$newdate-.html"
    Invoke-Item "$Global:filename\halog-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\halog-$newdate-.html"
 
 
}
#
#
#
 
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VCEventsAlarms{
$newdate = $Global:datefile
$VCEventsAlarmsHeading = "<h1>vCenter Events</h1>"
 
if($Global:VCStatus){
        Write-Host "Checking for vCenter Events Overall" -ForegroundColor Green
        $si = Get-View ServiceInstance
        $alarmMgr = Get-View -Id $si.Content.AlarmManager
        $vCenterEventsAlarm = Get-Inventory | %{
            $alarmMgr.GetAlarmState($_.ExtensionData.MoRef) |
                where{[VMware.Vim.ManagedEntityStatus]::yellow,[VMware.Vim.ManagedEntityStatus]::red -contains $_.OverallStatus} |
                Select-Object @{N='Entity';E={(Get-View -Id $_.Entity).Name}},
                    @{N='Alarm';E={(Get-View -Id $_.Alarm).Info.Name}},
                    OverallStatus,Time
        }
        if ($vCenterEventsAlarm) {
            $VCEventsAlarmsReport = $vCenterEventsAlarm | Sort-Object Time  | ConvertTo-HTML -Fragment -PreContent "<h2>vCenter Events Status Overall</h2>"
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }
            }
            else
        {
            $VCEventsAlarmsReport = "<h2>vCenter Events Alerts</h2>" + "No Alerts on vCenter"
        }
 
}
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VCEventsAlarmsHeading $VCEventsAlarmsReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\VCEventsAlarmsReport-$newdate-.html"
    Invoke-Item "$Global:filename\VCEventsAlarmsReport-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\VCEventsAlarmsReport-$newdate-.html"
 
   
    
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-CDPDetails{
    $newdate = $Global:datefile
    $CDPHeading = "<h1>Cisco Discovery Protocol</h1>"
    $alldc = Get-Datacenter | Sort
    $CDPDetails =@()
    $CDPResult =@()
    foreach($dc in $alldc){
        $allCluster = Get-Cluster -Location $dc | Sort
        if ($($allCluster | Measure-Object).count -gt 0){
            foreach($Cluster in $allCluster){
                $vmhosts = Get-VMHost -Location $Cluster | Sort Name  | Get-View
                foreach ($vmhost in $vmhosts){
                    $networkSystem = Get-view $vmhost.ConfigManager.NetworkSystem
                    foreach($pnic in $networkSystem.NetworkConfig.Pnic | Sort Device){
                        $pnicInfo = $networkSystem.QueryNetworkHint($pnic.Device)
                        $CDPValue =  [ordered]@{
                            'ESXi Host Name' = $vmhost.Name
                            'Host NIC' = $PnicInfo.Device
                            'Physical Switch IP' = $PnicInfo.ConnectedSwitchPort.MgmtAddr
                            'Switch Port No' = $PnicInfo.ConnectedSwitchPort.PortId
                           }
                         $CDPDetails = New-Object PSObject -Property $CDPValue
                         $CDPResult += $CDPDetails
                    }
                }
            }
 
        }
    }
 
 
        if ($CDPResult){
            $CDPResultReport = $CDPResult  | ConvertTo-HTML -Fragment -PreContent "<h2>Cisco Discovery Protocol Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
 
        }
        else
        {
            $CDPResultReport = "No Information"
            Write-Host "Done" -ForegroundColor Yellow
 
        }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$CDPHeading $CDPResultReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\cdp-$newdate-.html"
    Invoke-Item "$Global:filename\cdp-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\cdp-$newdate-.html"
 
 }
 #
#
#
 
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
function Set-CreateDirectory {
$testfile = $Global:filename
if (-not (Test-Path -Path $testfile)) {
    try {
        New-Item -Path $testfile -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$testfile'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$testfile'."
}
else {
    "Directory already existed"
}            }
 
 
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Send-MailTabButton{
 
    $Subject = $Global:EmailSubject
    $MailTo  = $Global:EmailSendTo
        $Global:EmailSendFrom = $textBox6.Text
 
  $Subject = $Global:Subject
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMCountperHost{
    $VMCountperHostHeading  = "<h1>VMs Count per Host Report</h1>"
    $newdate = $Global:datefile
    if($Global:VCStatus){
        Write-Host "Generating  VMs Count per Host"-ForegroundColor Green
        $VMCountInfo = Get-VMHost | Select @{N=“Cluster“;E={Get-Cluster -VMHost $_}}, Name,
                        @{N=“NumVM“;E={($_ | Get-VM).Count}}
        if ($VMCountInfo) {
            $VMCountReport = $VMCountInfo | Sort Cluster, Name  | ConvertTo-HTML -Fragment -PreContent "<h2>VMs Count per Host Report</h2>"
             Write-Host "Done" -ForegroundColor Yellow
            }
       else
       {
          $VMCountReport = "No Record Found"
       }
  }
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VMCountperHostHeading $VMCountReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\vmcountperhost-$newdate-.html"
Invoke-Item "$Global:filename\vmcountperhost-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\vmcountperhost-$newdate-.html"
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMCountperDatastore{
 
$VMCountperDSHeading = "<h1>VMs Count per Datastore</h1>"
$newdate = $Global:datefile
 
if($Global:VCStatus){
        Write-Host "Generating  VMs Count per Datastore"-ForegroundColor Green
        $VMCountDSInfo = Get-Datastore | Select Name, @{N="NumVM";E={@($_ | Get-VM).Count}}
 
      
        if ($VMCountDSInfo) {
            $VMCountDSReport = $VMCountDSInfo | Sort Name  | ConvertTo-HTML -Fragment -PreContent "<h2>VMs Count per Datastore Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $VMCountDSReport = "No Record Found"
            }
}
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VMCountperDSHeading $VMCountDSReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\vmcountperds-$newdate-.html"
Invoke-Item "$Global:filename\vmcountperds-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\vmcountperds-$newdate-.html"
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VirtualSwitchInfo{
    $NetworkSwitchHeading = "<h1>Network switch Details</h1>"
    $newdate = $Global:datefile
    [array] $results = $null
    [array] $NetworkSwitchInfo = $null
    if($Global:VCStatus){
        Write-Host "Generating  Virtual switch Details"-ForegroundColor Green
        Get-VirtualSwitch | ForEach-Object {
        $Output = "" | Select-Object Datacenter, Host, Type, vSwitch, Portgroup, NumPortsAvailable, Mtu, AllowPromiscuous, ForgedTransmits, MacChanges
        if ($_.ExtensionData.Summary -ne $null) {
            $Output.Type = "vDS"
            $Output.Host = "*"
            $Output.Datacenter =  $_.Datacenter
        }
        else {
            $Output.Type = "vSS"
            $Output.Host = $_.VMHost
            $Output.Datacenter =  $_.Datacenter
        }
 
        $Output.vSwitch = $_.Name
        $Output.Portgroup = $_.NumPorts
        $Output.NumPortsAvailable = $_.NumPortsAvailable
        $Output.Mtu = $_.Mtu
        $Output.AllowPromiscuous = ($_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.AllowPromiscuous.Value -or $_.ExtensionData.Spec.Policy.Security.AllowPromiscuous)
        $Output.ForgedTransmits = ($_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.ForgedTransmits.Value -or $_.ExtensionData.Spec.Policy.Security.ForgedTransmits)
        $Output.MacChanges = ($_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.MacChanges.Value -or $_.ExtensionData.Spec.Policy.Security.MacChanges)
        $results += $Output
    }
    $NetworkSwitchInfo +=  $results
  
           if ($NetworkSwitchInfo) {
            $NetworkSwitchReport = $NetworkSwitchInfo | ConvertTo-HTML -Fragment -PreContent "<h2>Network Switch Details Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $NetworkSwitchReport = "No Record Found"
            }
 
}
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$NetworkSwitchHeading $NetworkSwitchReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\networkswitch-$newdate-.html"
Invoke-Item "$Global:filename\networkswitch-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\networkswitch-$newdate-.html"
 
 
 
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VirualPortGroupsInfo{
    $VirualPortGroupsHeading = "<h1>Virtual Portgroups Details</h1>"
    $newdate = $Global:datefile
    [array] $VirtualPGResult = $null
    [array] $VirtualPGInfo = $null
    if($Global:VCStatus){
        Write-Host "Generating  Virual  Portgroups Details"-ForegroundColor Green
        Get-VDPortGroup | ForEach-Object {
        $OutputPG = "" | Select-Object Host, Type, vSwitch, Portgroup, AllowPromiscuous, ForgedTransmits, MacChanges
       
        $OutputPG.Host = "*"
        if ($_.ExtensionData.Config.Uplink -eq $true) {
            $OutputPG.Type = "vDS Uplink Port Group"
        }
        else {
            $OutputPG.Type = "vDS Port Group"
        }
       
 
        $OutputPG.vSwitch = $_.VDSwitch
        $OutputPG.Portgroup = $_.Name
        $OutputPG.AllowPromiscuous = $_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.AllowPromiscuous.Value
        $OutputPG.ForgedTransmits = $_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.ForgedTransmits.Value
        $OutputPG.MacChanges = $_.ExtensionData.Config.DefaultPortConfig.SecurityPolicy.MacChanges.Value
        $VirtualPGResult += $OutputPG
    }
    $VirtualPGInfo +=  $VirtualPGResult
  
           if ($VirtualPGInfo) {
            $VirtualPGReport = $VirtualPGInfo | ConvertTo-HTML -Fragment -PreContent "<h2>Virtual Portgroups Details Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $VirtualPGReport = "No Record Found"
            }
}
 
Set-CreateDirectory
Get-HtmlReport      
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VirualPortGroupsHeading $VirtualPGReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\virtualportgroup-$newdate-.html"
Invoke-Item "$Global:filename\virtualportgroup-$newdate-.html"
$Global:mailvmtool = Get-Content "$Global:filename\virtualportgroup-$newdate-.html"
 
 
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# vSan Storage Details with VM
#
Function Get-vSANStoragePolicywithVM{
$newdate = $Global:datefile
if($Global:VCStatus){
    Write-Host "Generating vSan Storage Policy with VM Details"-ForegroundColor Green
    $DiskPolicyReport = @()
    $vms = Get-VM
    foreach ($vm in $vms){
        $vmCluster = Get-Cluster -VM $vm
        $vmDatastore = Get-Datastore -VM $vm
        $VMHome = $vm | get-SpbmEntityConfiguration
            Foreach ($VMH in $VMHome){
                $DiskPolicyReport += New-Object PSObject -Property @{
                VM = $vm
                Cluster = $vmCluster
                Datastore = $vmDatastore
                Entity = 'VMHome'
                Policy = $VMH.StoragePolicy
                Status = $VMH.ComplianceStatus
                DateTime = $VMH.TimeOfCheck
                }
                    Remove-Variable VMH -Force -ErrorAction SilentlyContinue
            }
        $VMDisks = $vm | get-harddisk
            Foreach ($disk in $VMDisks){
                $VMDisk = $disk | get-SpbmEntityConfiguration
                $DiskPolicyReport += New-Object PSObject -Property @{
                VM = $vm
                Cluster = $vmCluster
                Datastore = [regex]::match($disk.Filename,'\[(.*?)\]').Groups[1].Value
                Entity = $VMDisk.Entity
                CapacityGB   = $disk.CapacityGB
                Policy = $VMDisk.StoragePolicy
                Status = $VMDisk.ComplianceStatus
                DateTime = $VMDisk.TimeOfCheck
                }
                    Remove-Variable disk -Force -ErrorAction SilentlyContinue
            }
    }
 
 
$DiskPolicyReport | select VM,Cluster,Datastore,Entity,CapacityGB,Policy,Status,DateTime | export-csv "C:\Users\rovis\Documents\VC-Form\vsanstoragepolicyvm-$newdate.csv" -NoTypeInformation
Write-Host "Done" -ForegroundColor Yellow
 
}
 
    $OutputFile1 = "C:\Users\rovis\Documents\VC-Form\vsanstoragepolicyvm-$newdate.csv"
    Write-Host "File save at location $OutputFile1"
    Invoke-Item $OutputFile1
    Write-Host "Done..`n" -ForegroundColor Yellow
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMsDeatilsFull{
 
$VMsDeatilsFullHeading = "<h1>VMs Information</h1>"
$newdate = $Global:datefile
$VMAllInfo = @()
$VMAllInfoCheck= @()
if($Global:VCStatus){
Write-Host "Generating Virtual Machine Report"-ForegroundColor Green
$View = Get-View -viewtype VirtualMachine
foreach ($vm in $view){
  $ips=$vm.guest.net.ipaddress
  $macs=$vm.guest.net.MacAddress
  if ($vm.Runtime.PowerState -eq "poweredOn") {$state="ON"}
   elseif ($vm.Runtime.PowerState -eq "poweredOff") {$state="OFF"}
    else {$state="n/a"}
 
  if ($vm.summary.guest.ToolsRunningStatus -eq "guestToolsRunning") {$vmtools="Running"}
   elseif ($vm.summary.guest.ToolsRunningStatus -eq "guestToolsNotRunning") {$vmtools="Not running"}
    else {$vmtools="n/a"}
  if ($ips.count -gt 1)
  {$ips=$vm.guest.net.ipaddress[0] + " " + $vm.guest.net.ipaddress[1]}
 
  if ($macs.count -gt 1)
   {$macs=$vm.guest.net.macaddress[0] + " " + $vm.guest.net.macaddress[1]}
 
$VMAllInfo = New-Object -TypeName PSObject -Property @{
  "Name" = $vm.Name
  "OS" = $vm.Guest.GuestFullName
  "Hostname" = $vm.summary.guest.hostname
  "vCPUs" = $vm.Config.hardware.NumCPU
  "Cores" = $vm.Config.Hardware.NumCoresPerSocket
  "RAM Alloc" = $vm.Config.Hardware.MemoryMB
  "RAM Host" = $vm.summary.QuickStats.HostMemoryUsage
  "RAM guest" = $vm.summary.QuickStats.GuestMemoryUsage
  "NICS" = $vm.Summary.config.NumEthernetCards
  "IPs" = $ips
  "MACs" = $macs
  "vmTools" = $vmtools
  "State" = $state
  "UUID" = $vm.Summary.config.Uuid
  "VM ID" = $vm.Summary.vm.value
  }
  $VMAllInfoCheck += $VMAllInfo
}
 
           if ($VMAllInfoCheck) {
            $VMAllInfoReport = $VMAllInfoCheck | ConvertTo-HTML -Fragment -PreContent "<h2>VMs Summary Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $VMAllInfoReport = "No Record Found"
            }
}
 
Set-CreateDirectory
Get-HtmlReport2
Write $fragments | clip
(ConvertTo-Html -Head $Global:HTMLFormat2  -Body "$VMsDeatilsFullHeading $VMAllInfoReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\VMsDeatilsFullHeading-$newdate.html"
Invoke-Item "$Global:filename\VMsDeatilsFullHeading-$newdate.html"
$Global:mailvmtool = Get-Content "$Global:filename\VMsDeatilsFullHeading-$newdate.html"
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMsConnectedtoCDROM{
 
$VMsConnectedtoCDRomHeading = "<h1>VMs with CD-ROM connected at 'Power ON'</h1>"
$newdate = $Global:datefile
 
 
 
if($Global:VCStatus){
    $VMConnectCDRomON = get-vm | where { $_ | get-cddrive | where { $_.ConnectionState.StartConnected  -eq "true" } }
 
    if ($VMConnectCDRomON) {
        Write-Host "Generating VMs with CD-ROM connected at 'Power ON' Report"-ForegroundColor Green
   #     [System.Windows.Forms.MessageBox]::Show("Found VMs with CD-ROM connected at 'Power ON'!")
        $VMConnectCDRomONReport = $VMConnectCDRomON | ConvertTo-HTML -Fragment -PreContent "<h2>VMs with CD-ROM connected at 'Power ON' Report</h2>"
        Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
         $VMConnectCDRomONReport = "No VM's Found CD-ROM connected at 'Power ON'"
         Write-Host "No VM's Found CD-ROM connected at 'Power ON'" -ForegroundColor Red
         Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VMsConnectedtoCDRomHeading $VMConnectCDRomONReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\VMsConnectedtoCDROM-$newdate-.html"
    Invoke-Item "$Global:filename\VMsConnectedtoCDROM-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\VMsConnectedtoCDROM-$newdate-.html"
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-VMsConnectedtoDSISO{
 
$VMsConnectedtoCDROMDSISOHeading = "<h1>VMs with CD-ROM connected to ‘Datastore ISO file’</h1>"
$newdate = $Global:datefile
if($Global:VCStatus){
    $VmConnectDSISO = get-vm | where { $_ | get-cddrive | where { $_.ConnectionState.Connected -eq "true" -and $_.ISOPath -like "*.ISO*"} } | select Name, @{Name=".ISO Path";Expression={(Get-CDDrive $_).isopath }}
    if ($VmConnectDSISO) {
        Write-Host "Generating VMs with CD-ROM connected to ‘Datastore ISO file’ Report"-ForegroundColor Green
#       [System.Windows.Forms.MessageBox]::Show("Found VMs with CD-ROM connected to ‘Datastore ISO file’!")
        $VmConnectDSISOReport = $VmConnectDSISO | ConvertTo-HTML -Fragment -PreContent "<h2>VMs with CD-ROM connected to ‘Datastore ISO file’ Report</h2>"
        Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
         $VmConnectDSISOReport = "No VM's Found connected to Datastore ISO file"
         Write-Host "No VM's Found connected to Datastore ISO file" -ForegroundColor Red
         Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$VMsConnectedtoCDROMDSISOHeading $VmConnectDSISOReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\VMsConnectedtoDSISO-$newdate-.html"
    Invoke-Item "$Global:filename\VMsConnectedtoDSISO-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\VMsConnectedtoDSISO-$newdate-.html"
 
 
}
 
 
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-DRSRulewithClusterVM{
$DRSRulewithClusterVMHeading = "<h1>DRS Rule</h1>"
$newdate = $Global:datefile
if($Global:VCStatus){
    $ShowVMAffinity = $true
    $ShowVMAntiAffinity = $true
    $ShowHostAffinity = $true
    $excludeName = "ExcludeMe"
 
    $Types = @()
    if ($ShowVMAffinity)     { $Types += "VMAffinity"}
    if ($ShowVMAntiAffinity) { $Types += "VMAntiAffinity"}
    if ($ShowHostAffinity)   { $Types += "VMHostAffinity"}
 
    $DRSClustersName = Get-Cluster | Sort-Object Name
    $DRSClustersCheck = $DRSClustersName | Foreach-Object {
       Get-DrsRule -Cluster $_ -Type $Types | Where-Object { $_.Name -notmatch $excludeName } |
       Select-Object Cluster, Enabled, Name, Type, @{N="VM";E={(Get-View $_.VMIDS |`
       Select-Object -ExpandProperty Name) -join " || "}}
        }
    if ($DRSClustersCheck) {
        Write-Host "Generating DRS Rule Report"-ForegroundColor Green
        [System.Windows.Forms.MessageBox]::Show("Found DRS Rule’! Please Click OK")
        $DRSClustersReport = $DRSClustersCheck | ConvertTo-HTML -Fragment -PreContent "<h2>DRS Rule Report</h2>"
        $DRSClustersReport = $DRSClustersReport | Foreach {
                $_ -replace "<td>True</td>","<td style=`"color:Green; font-weight: bold;`">True</td>"
            }
        Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
         $DRSClustersReport = "No DRS Rule Found"
         Write-Host "No DRS Rule Found" -ForegroundColor Red
         Write-Host "Done" -ForegroundColor Yellow
            }
    }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$DRSRulewithClusterVMHeading $DRSClustersReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\DRSClustersReport-$newdate-.html"
    Invoke-Item "$Global:filename\DRSClustersReport-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\DRSClustersReport-$newdate-.html"
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
Function Get-EsxiHostStatus{
$EsxiHostDetailsHeading = "<h1>ESXi Host Running Status</h1>"
$newdate = $Global:datefile
 
$end = get-date
$EsxiHostDetailsInfo = Get-VMHost | select name,`
    @{N="Status"; E={$_.ExtensionData.OverallStatus}}, `
    @{N="Connected"; E={$_.ConnectionState}}, `
    @{N="State"; E={$_.PowerState}}, `
    @{N="CpuUsageMhz"; E={[Math]::Round($_.CpuUsageMhz, 3)}}, @{N="CpuTotalMhz"; E={[Math]::Round($_.CpuTotalMhz, 3)}},`
    @{N="CpuUsage%"; E={"{0:P0}" -f [Math]::Round($_.CpuUsageMhz/$_.CpuTotalMhz, 3)}},`
    @{N="MemoryUsageGB"; E={[Math]::Round($_.MemoryUsageGB, 3)}}, @{N="MemoryTotalGB"; E={[Math]::Round($_.MemoryTotalGB, 3)}},`
    @{N="MemoryUsage%"; E={"{0:P0}" -f [Math]::Round($_.MemoryUsageGB/$_.MemoryTotalGB, 3)}},`
    @{N="VM Count"; E={$_.ExtensionData.vm.count}},`
    @{N="Uptime"; E={(new-timespan $_.ExtensionData.Summary.Runtime.BootTime $end).days}},`
    @{N="Configuration Status"; E={$_.ExtensionData.ConfigStatus}}`
| sort name
 
    if ($EsxiHostDetailsInfo) {
        Write-Host "Generating ESXi Host Report"-ForegroundColor Green
        $EsxiHostDetailsReport = $EsxiHostDetailsInfo | ConvertTo-HTML -Fragment -PreContent "<h2> ESXi Host Status Report</h2>"
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>Connected</td>","<td style=`"color:Green; font-weight: bold;`">Connected</td>"
            }
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>Maintenance</td>","<td style=`"color:Yellow; font-weight: bold;`">Maintenance</td>"
            }
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>NotResponding</td>","<td style=`"color:Red; font-weight: bold;`">NotResponding</td>"
            }
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>PoweredOn</td>","<td style=`"color:Green; font-weight: bold;`">PoweredOn</td>"
            }
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>Unknown</td>","<td style=`"color:Red; font-weight: bold;`">Unknown</td>"
            }
 
        $EsxiHostDetailsReport = $EsxiHostDetailsReport | Foreach {
                $_ -replace "<td>green</td>","<td style=`"color:Green; font-weight: bold;`">green</td>"
            }
        Write-Host "Done" -ForegroundColor Yellow
        }
        else
        {
         $EsxiHostDetailsReport = "No ESXi Found"
         Write-Host "No ESXi Found" -ForegroundColor Red
         Write-Host "Done" -ForegroundColor Yellow
            }
   
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$EsxiHostDetailsHeading $EsxiHostDetailsReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\EsxiHostDetailsReport-$newdate-.html"
    Invoke-Item "$Global:filename\EsxiHostDetailsReport-$newdate-.html"
    $Global:mailvmtool = Get-Content "$Global:filename\EsxiHostDetailsReport-$newdate-.html"
 
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Get-EsxiHostDetails{
$EsxiHostDetailsHeading = "<h1>ESXi Hosts Details</h1>"
$newdate = $Global:datefile
 
if($Global:VCStatus){
    Write-Host "Generating ESXi Hosts Report"-ForegroundColor Green
    $VMHostsAll = Get-VMHost
    $EsxiHostDetailsInfo = ForEach ($VMHost in $VMHostsAll)
       {
       "" | Select-Object -Property @{N="Name";E={$VMHost.Name}},
       @{N="Vendor";E={(Get-View -ViewType HostSystem -Filter @{"Name" = $VMHost.Name}).Hardware.Systeminfo.Vendor}},
       @{N="Model";E={(Get-View -ViewType HostSystem -Filter @{"Name" = $VMHost.Name}).Hardware.Systeminfo.Model}},
       @{N="CPU Model";E={$VMHost.ExtensionData.Summary.Hardware.CpuModel}},
       @{N="Datacenter";E={(Get-Datacenter -VMHost $VMHost.Name).Name}},
       @{N="Cluster";E={(Get-Cluster -VMHost $VMHost.Name).Name}},
       @{N="Hypervisor";E={$VMHost.Extensiondata.Config.Product.Name}},
       @{N="Hypervisor Version";E={$VMHost.Extensiondata.Config.Product.Version}},
       @{N="Clock Speed (Mhz)";E={$VMHost.ExtensionData.Summary.Hardware.CpuMhz}},
       @{N="Memory (MB)";E={$VMHost.MemoryTotalMB}},
       @{N="Hyperthreading Enabled";E={$VMHost.HyperThreadingActive}},
       @{N="Number of Cores";E={$VMHost.ExtensionData.Summary.Hardware.numCpuCores}}
       }
    }
    if($EsxiHostDetailsInfo) {
        $EsxiHostDetailsReport = $EsxiHostDetailsInfo | ConvertTo-HTML -Fragment -PreContent "<h2>ESXi Host Details Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $EsxiHostDetailsReport = "No Record Found"
            }
 
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$EsxiHostDetailsHeading $EsxiHostDetailsReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\EsxiHostDetailsReport-$newdate.html"
    Invoke-Item "$Global:filename\EsxiHostDetailsReport-$newdate.html"
    $Global:mailvmtool = Get-Content "$Global:filename\EsxiHostDetailsReport-$newdate.html"
 
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
Function Get-ThickThinProvisionedVMs{
[cmdletbinding()]
param(
      [Parameter(Mandatory)]
      [ValidateSet("thick","thin")]
      [String]$diskformat
)
 
Write-Host "Generating $diskformat Provisioned VMs Report"-ForegroundColor Green
$ThickThinProvisionedVMshealding = "<h1>$diskformat Provisioned VMs</h1>"
$newdate = $Global:datefile
 
#$diskformat = "thick"
$DatastoreIgnore = "local"
$VM = Get-VM | Sort-Object Name
$ThickThinInfo = $VM | Get-HardDisk | Where-Object {($_.storageformat -match $diskformat)`
-and ($_.Filename -notmatch $DatastoreIgnore)} | Select-Object @{N="VM";E={$_.parent.name}},
                                                            @{N="DiskName";E={$_.name}},
                                                            @{N="Capcity";E={$_.CapacityGB}},
                                                            @{N="Format";E={$_.storageformat}},
                                                            @{N="FileName";E={$_.filename}}
if($ThickThinInfo){
        $ThickThinInfoReport = $ThickThinInfo | ConvertTo-HTML -Fragment -PreContent "<h2>$diskformat Provisioned VMs Report</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else
        {
            $ThickThinInfoReport = "No Record Found"
            }
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$ThickThinProvisionedVMshealding $ThickThinInfoReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\$diskformat-provisioned-$newdate.html"
    Invoke-Item "$Global:filename\$diskformat-provisioned-$newdate.html"
    $Global:mailvmtool = Get-Content "$Global:filename\$diskformat-provisioned-$newdate.html"
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
# need to configure host hardware sensor
# https://techibee.com/powershell/powershell-get-vm-host-hardware-sensors-information-using-powercli/2970
#
 
Function Get-HostHardwareSensorStatus{
$HostHardwareSensorHeading = "<h1>Host Hardware Sensor</h1>"
$newdate = $Global:datefile
$VMHostName = $Global:HostNameCombo.Text
   $OutArr = @()
    $object = @()
    foreach($VMHost in $VMHostName) {
        Write-Host "Fetching data from $VMHost"
        try {
            $VMHostObj = Get-VMHost -Name $VMHost -EA Stop | Get-View
            $sensors = $VMHostObj.Runtime.HealthSystemRuntime.SystemHealthInfo.NumericSensorInfo
            foreach($sensor in $sensors){
                $object = New-Object -TypeName PSObject -Property @{
                    VMHost = $VMHost
                    SensorName = $sensor.Name
                    Status = $sensor.HealthState.Key
                    CurrentReading = $sensor.CurrentReading
                } | Select-Object VMHost, SensorName, CurrentReading, Status
                $OutArr += $object
            }
         } catch {
            $object = New-Object -TypeName PSObject -Property @{
                VMHost = $VMHost
                SensorName = "NA"
                Status = "FailedToQuery"
                CurrentReading = "FailedToQuery"
            } | Select-Object VMHost, SensorName, CurrentReading, Status
            $OutArr += $object
         }
    }
    if($OutArr) {
        $OutArrReport = $OutArr | ConvertTo-HTML -Fragment -PreContent "<h2>Host Hardware Sensor Report</h2>"
        $OutArrReport = $OutArrReport | Foreach {
                $_ -replace "<td>green</td>","<td style=`"color:green; font-weight: bold;`">green</td>"
            }
        $OutArrReport = $OutArrReport | Foreach {
                $_ -replace "<td>red</td>","<td style=`"color:Red; font-weight: bold;`">red</td>"
            }
        $OutArrReport = $OutArrReport | Foreach {
                $_ -replace "<td>Unknown</td>","<td style=`"color:Magenta; font-weight: bold;`">Unknown</td>"
            }
 
 
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $OutArrReport = "No Record Found"
            }
 
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$HostHardwareSensorHeading $OutArrReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\OutArrReport-$newdate.html"
    Invoke-Item "$Global:filename\OutArrReport-$newdate.html"
    $Global:mailvmtool = Get-Content "$Global:filename\OutArrReport-$newdate.html"
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
Function Get-TemplateName{
$TemplateNameHeading = "<h1>Template Details</h1>"
$newdate = $Global:datefile
 
$TemplateInfo = Get-Template | Select Name, @{N="Host";      E={(Get-VMhost -id $_.HostID).Name}},
                            @{N="Datastore"; E={(Get-Datastore -id $_.DatastoreIDlist).Name -join ","}},
                            @{N="OS";        E={$_.ExtensionData.Guest.GuestFullName}},
                            @{N="Memory";    E={$_.ExtensionData.Summary.Config.MemorySizeMB}},
                            @{N="CPU";       E={$_.ExtensionData.Summary.Config.NumCpu}},
                            @{N="Ethernet";  E={$_.ExtensionData.Summary.Config.NumEthernetCards}},
                            @{N="NumVirtualDisks";E={$_.ExtensionData.Summary.Config.NumVirtualDisks}},
                            @{N='Storage';   E={[math]::Round($_.ExtensionData.Summary.Storage.Committed/1GB,2)}}    | FT -AutoSize                 
 
    if($TemplateInfo) {
        $TemplateReport = $TemplateInfo | ConvertTo-HTML -Fragment -PreContent "<h2>Template Details Report..</h2>"
            Write-Host "Done" -ForegroundColor Yellow
           }
        else{
            $TemplateReport = "No Record Found"
            }
 
    Set-CreateDirectory
    Get-HtmlReport      
    Write $fragments | clip
    (ConvertTo-Html -Head $Global:HTMLFormat  -Body "$TemplateNameHeading $TemplateReport"  | Out-String)  -replace "(?sm)<table>\s+</table>" | Out-File "$Global:filename\TemplateName-$newdate.html"
    Invoke-Item "$Global:filename\TemplateName-$newdate.html"
    $Global:mailvmtool = Get-Content "$Global:filename\TemplateName-$newdate.html"
 
}
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
#
#
Function Set-checkAttachmentTextbox{
    $attach2.Enabled = $true
    $ip.ReadOnly = $false
}
 
Function Set-UncheckAttachmentTextbox{
    $attach2.Enabled = $false
    $ip.ReadOnly = $true
}
Function Set-UncheckMailStatus{
    $rmail.Visible = $false
}
Function Set-UncheckvCenterGroupSetting{
 
    $VCEvents.Checked = $false
    $CDPDetails.Checked = $false
    $HALogs.Checked = $false
    $license.Checked = $false
    $snapshotcreate.Checked = $false
    $snapshotdelete.Checked = $false
}
Function Set-UncheckHostGroupSetting{
 
    $EsxiHostDetails.Checked = $false
    $dsusage.Checked = $false
    $dsvsanusage.Checked = $false
    $EsxiHostStatus.Checked = $false
    $esxicpuutilization.Checked = $false
    $esximemoryutilization.Checked = $false
 
}
Function Set-UncheckVMsGroupSetting{
 
    $radioButton1.Checked = $false
    $radioButton2.Checked = $false
    $radioButton3.Checked = $false
    $radioButton4.Checked = $false
    $radioButton5.Checked = $false
    $TemplateRadio.Checked = $false
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
Function Get-EsxiHostName2{
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail Send for Generating Report
#
Function Mail-SendReport{
 
        $msubject = "$Global:VCName"+"-"+"$Global:mailSubject"
        $msmptserver = 'smtp-server'
        $mport = '25'
        $mto =  'rohitvishwakarma@gmail.com'
        $mfrom = 'rohitvishwakarma@gmail.com'
        $mbody = $Global:mailvmtool
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $message.body = $mbody
        $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
        $smtp.Send($message)
 
#        Start-Sleep(2)
#        $Global:mailvmtool
 
}
#
#
#
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#
# Mail with attachment for RvTools Only
#
Function Mail-SendAttachReport{
        $msubject = "$Global:VCName"+"-"+"$Global:mailSubject"
        $msmptserver = 'smtp-server'
        $mport = '25'
        $mto = 'rohitvishwakarma@gmail.com'
        $mfrom = 'rohitvishwakarma@gmail.com'
     #   $mbody = Get-Content "C:\Users\rovis\Documents\VC-Form\Excel.txt"
        $message = new-object System.Net.Mail.MailMessage ($mfrom, $mto, $msubject, $mbody)
        #$attachment = Get-ChildItem "C:\Users\rovis\Documents\VC-Form\rvtool.xlsx" | Select-Object -ExpandProperty FullName
        $attachment = Get-ChildItem -Path  "C:\Users\rovis\Documents\VC-Form" -Recurse -Include *.xlsx, *.csv | Sort-Object LastAccessTime -Descending | Select-Object -First 1 |Select-Object -ExpandProperty FullName
        $attach = new-object Net.Mail.Attachment($attachment)
        $message.Attachments.Add($attach)
        $message.body = "RVtool Reports"
        $smtp = new-object Net.Mail.SmtpClient($msmptserver)
        $smtp.Send($message)
        $label20.Text = "Mail Send..."
 
}

From <https://outlook.office.com/mail/inbox/id/AAQkAGZhMDQyMDI5LTZmYTgtNDU5MC04MTkyLTQ5YjUxNzI4MDRjMwAQAKlzEF82qEJBh3L%2Bd4FjGTI%3D> 
