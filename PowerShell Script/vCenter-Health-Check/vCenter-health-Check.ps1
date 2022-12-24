cls
$passwd = Get-Content "D:\Rohit-Script\password.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username",$passwd )
Import-Module C:\Users\Administrator\Documents\WindowsPowerShell\Modules\connect.psm1 
$VCServer ='vCenter-FQDN'
$datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
[string] $dt3 = get-date -Format dd/MM/yyyy
$ReportExport = "D:\Rohit-Script\Report\Dail-Health-Check\SAP"
$filename = "$ReportExport\$VCServer-DailyReport-" + $datefile + ".htm"
$snapshotdays = "3"
$Snapshotdate = (Get-Date).AddDays(-$snapshotdays)
$VCEventDate = (Get-Date).AddDays(-1)
$datastorePrecFree = "20"
$VMwareToolsReport = ""
function CreateDirectory {
    $folderCheck = Test-Path -Path "$ReportExport"
        if ($folderCheck  -eq $false) {
            Write-Warning $folderCheck "not found, creating it."
            New-Item $folderCheck -type directory
            }
    }
CreateDirectory | Out-Null
$VCStatus = connect-VIServer $VCServer -Credential $credentials -ErrorAction SilentlyContinue -ErrorVariable ErrorProcess;
#$VCStatus = Connect-VoraName -ErrorAction SilentlyContinue -ErrorVariable ErrorProcess;
if($ErrorProcess){
        Write-Warning "Error connecting to vCenter Server $VCServer error message below"
        Write-Warning $Error[0].Exception.Message
        $errorvcenter = $Error[0].Exception.Message
        $Error[0].Exception.Message | Out-File "$ReportExport\ConnectionError.txt"
        Send-MailMessage -SmtpServer 0.0.0.0 -Port 25 -To rohit.vishwakarma -From automation.user -Subject "Daily Health Check Report - $VCServer" -Body "<b>$errorvcenter<b>" -BodyAsHtml
        exit
    }
    else
    {
        $Heading = "<h1>Daily Health Check Report</h1>"
$HTMLFormat = @"
        <style>
        body {background-color: white;font-family: Arial; font-size: 12pt;}
        h1 {color: 	orage; text-align: center;font-size: 20px;display: block;font-family: "Arial Black", Times, serif;}
        h2 {color: 	green; font-family: "Arial Black"}
        TABLE{border-style: solid;border-color: black;}
        TH{border-style: solid;border-color: Black;background-color:	#4682B4; color: white;}
        TD{background-color:#d3d3d3}
        table {
            border-collapse: collapse;width: 100%;
        }
        table, th, td {
            border: 1px solid black;height: 25px;text-align: Center;font-weight: bold;
        }

        </style>
"@
        Write-Host "Checking vCenter "$VCServer" Connection" -ForegroundColor Green
        if($VCStatus.IsConnected -eq $true){
                $VCConnect = $VCStatus | Select-Object  Name,@{N="Vcenter Server Available";E={$VCStatus.IsConnected}},Port, Version, Build | ConvertTo-HTML -Fragment -PreContent "<h2>vCenter Responding..</h2>" | Out-String
            }
        Else
            {
                $VCConnect  = "<h2>vCenter Response</h2>" + "Cannot Connect to $($VCStatus.Name)"
            }
        $VCName = $VCStatus.Name
        $VCURL = "HTTPS://$VCName/ui"
add-type @"
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
        [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
            try {
                    $VCWebCheck = Invoke-WebRequest -Uri $VCURL -UseBasicParsing
                 } 
                 catch {
                    $ErrorException = $_.Exception
                    $ErrorResponse = $_.Exception.Response
                    }

    if ($VCWebCheck.StatusCode -eq "200") {
        $VCResponseStatus = $VCWebCheck| Select-Object @{N="VC Web URL";E={$VCURL}},StatusCode,@{N="StatusDescription";E={"OK"}} | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Connection Response</h2>" | Out-String
    }
    Else
    {
        $VCResponseStatus = $ErrorResponse | Select-Object @{N="VC Web URL";E={$_.ResponseUri}},StatusCode,@{N="StatusDescription";E={$ErrorException.Message}} | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Connection Response</h2>"  | Out-String
    }
        Write-Host "Checking for out of date VMware tools" -ForegroundColor Green
        $VMwareToolsReport = Get-VM | get-view | Select-Object Name, 
                @{N="HW Version";E={$_.Config.Version}}, @{N="ToolsVersion";E={$_.Config.tools.ToolsVersion}},
                @{N="VMToolsStatus";E={$_.Guest.ToolsStatus}},@{N="ToolsVersionStatus";E={$_.Guest.ToolsVersionStatus}},@{N="VMPowerstatus";E={$_.runtime.PowerState}} | 
                Where-Object {$_.VMToolsStatus -Notlike "toolsOK" -and $_.VMPowerstatus -eq "poweredOn"}
        if ($VMwareToolsReport) {
                $vmToolsReport = $VMwareToolsReport | ConvertTo-HTML -Fragment -PreContent "<h2>VMwareTools Report</h2>"  | Out-String
                $vmToolsReport = $vmToolsReport | Foreach {
                    $_ -replace "<td>toolsNotRunning</td>","<td style=`"color:red`">toolsNotRunning</td>"
                    }
            }
            else 
            {
                $vmToolsReport = "No VM's With Out Of Date VMware Tools"
            }

        Write-Host "Checking for Snapshots older than $($snapshotdays) days" -ForegroundColor Green
        $Snapshot  = get-vm | get-snapshot 
        $SnapshotReport = $Snapshot | Select-Object vm, name,created,description | Where-Object {$_.created -lt $Snapshotdate}
        if ($SnapshotReport) {
                $SnapReport = $SnapshotReport | ConvertTo-HTML -Fragment -PreContent "<h2>Snapshot Report</h2>"  | Out-String
            }
            else 
            {
               $SnapReport = "<h2>Snapshot Report</h2>" + "No Snapshots older than $($snapshotdays) days"
               }
        Write-Host "Checking for active VMware host alarms new" -ForegroundColor Green
        $VMHAlarmReport = @()
        $HostAlert = @()
        $HostsViews = Get-View -ViewType hostsystem
        $ServiceInstance = get-view ServiceInstance
        $alarmMgr = get-view $ServiceInstance.Content.alarmManager
        $valarms = $alarmMgr.GetAlarm($null) | Select-Object value, @{N="name";E={(Get-View -Id $_).Info.Name}}
        $HostsViews = Get-View -ViewType hostsystem

        foreach ($HostsView in ($HostsViews | Where-Object {$_.TriggeredAlarmState} | Sort-Object Name)){
           Foreach ($hostsTriggeredAlarm in $HostsView.TriggeredAlarmState){
             $HostAlert = New-Object PSObject -Property @{
                 "Object" = $HostsView.name;
                 "Alarm" = ($valarms | Where-Object {$_.value -eq ($hostsTriggeredAlarm.alarm.value)}).name;
                 "Status" = $hostsTriggeredAlarm.OverallStatus;
                 "Time" = $hostsTriggeredAlarm.time.ToLocalTime()
              } 
              $VMHAlarmReport  += $HostAlert
           }
        }
        if($VMHAlarmReport)
        {
            $VMHAlarms = $VMHAlarmReport | Select-Object Object, Alarm, Status, Time | Sort-Object Time  | ConvertTo-HTML -Fragment -PreContent "<h2>ESXi Host Alerts</h2>"  | Out-String
                $VMHAlarms = $VMHAlarms | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
           }
            else
            {
            $VMHAlarms = "<h2>VMHost Alerts</h2>" + "No active alarms for VMware host's"
            }
####################################################################################################################
        Write-Host "Checking High Availability Logs" -ForegroundColor Green
        $HAResult = @()
        $HAResultReport = @()
        Write-Host        "Checking the HA logs Report for 2 days..." -ForegroundColor CYAN
        $out = Get-VIEvent -MaxSamples 100000 -Start (Get-Date).AddDays(-2) -Type Warning | Where {$_.FullFormattedMessage -match "vSphere HA restarted virtual machine"} |`
        Select-Object ObjectName, CreatedTime,FullFormattedMessage, @{ Name="VM"; Expression={$_.Vm.Name}}|  sort CreatedTime –Descending
        if($out -eq $null){
            foreach ( $HAstatus in $out)
            {
            $HAResult += [PSCustomObject] @{
                SourceVM  = $HAstatus.ObjectName
                Time    = $HAstatus.CreatedTime
                Trigger = $HAstatus.FullFormattedMessage
                DestinationVM = $HAstatus.VM
                }
            }
        if ($HAResult){
            $HAResultReport = $HAResult  | ConvertTo-HTML -Fragment -PreContent "<h2>High Availability Logs</h2>" | Out-String
        }
        else
        {
            $HAResultReport = "<h2>VMware High Availability Logs</h2>" + "No High Availability Logs Found"
        }
    }
#####################################################################################################################
        Write-Host "Checking for active VM alarms" -ForegroundColor Green
#        $VMAlarms = @()
#        $VMStatus = (Get-VM | Get-View) | Select-Object Name,OverallStatus,ConfigStatus,TriggeredAlarmState
#        $VMErrors = $VMStatus  | Where-Object {$_.OverallStatus -ne "Green"}
      
        $ServiceInstance = get-view ServiceInstance
        $alarmMgr = get-view $ServiceInstance.Content.alarmManager
        $valarms = $alarmMgr.GetAlarm($null) | Select-Object value, @{N="name";E={(Get-View -Id $_).Info.Name}}
        $FullVM = Get-View -ViewType VirtualMachine | Where-Object {-not $_.Config.Template}

 #       if ($VMErrors){
 #           foreach ($TriggeredAlarm in $VMErrors.TriggeredAlarmstate) {
 #               $VMprops = @{
 #                   VM = $VMErrors.Name
 #                   OverAllStatus = $VMErrors.OverallStatus
 #                   TriggeredAlarms = (Get-AlarmDefinition -Id $TriggeredAlarm.Alarm).Name
 #                   Time = $VMErrors.TriggeredAlarmState.Time
 #                   }
 #           $VMAlarms += New-Object PSObject -Property $VMprops
 #           }
 #       }
        $vmsalarms = @()
        $VMAlarms = @()
        foreach ($VMView in ($FullVM | Where-Object {$_.TriggeredAlarmState})){
           Foreach ($VMsTriggeredAlarm in $VMView.TriggeredAlarmState){
             $vmsalarms = New-Object -TypeName PSObject -Property @{
                 Object = $VMView.name
                 Alarm = ($valarms |Where-Object {$_.value -eq ($VMsTriggeredAlarm.alarm.value)}).name
                 Status = $VMsTriggeredAlarm.OverallStatus
                 Time = $VMsTriggeredAlarm.time
              }
              $VMAlarms += $vmsalarms
           }
        }
        if ($VMAlarms){
        $VMAlarmReport = $VMAlarms  | Sort-Object Time | ConvertTo-HTML -Fragment -PreContent "<h2>VM Alerts</h2>"  | Out-String
        $VMAlarmReport = $VMAlarmReport | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
        $VMAlarmReport = $VMAlarmReport | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }
        }
        else{
        $VMAlarmReport = "<h2>VM Alerts</h2>" + "No active alarms for VM"
        }
        Write-Host "Checking for Critical events for the last 12 hours" -ForegroundColor Green
        $start = (Get-Date).AddHours(-12)
        $VCAlerts = Get-VIEvent -Start $start -MaxSamples ([int]::MaxValue) | Where-Object {$_ -is [VMware.Vim.AlarmStatusChangedEvent] -and ($_.To -match "red|yellow|green") -and ($_.FullFormattedMessage -notlike "*Virtual machine*") -and ($_.CreatedTime -gt $VCEventDate)}
        
        if ($VCAlerts) {
            $ActiveVCAlert = $VCAlerts | Select-Object @{N="VM"; E={$_.VM.Name}},@{N="vCenter Events";E={$_.FullFormattedMessage}}, @{N="Status";E={$_.To}}, CreatedTime | Sort-Object CreatedTime | ConvertTo-Html -Fragment -PreContent "<h2>vCenter Alerts last 12 hr</h2>"  | Out-String
            $ActiveVCAlert = $ActiveVCAlert | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
            $ActiveVCAlert = $ActiveVCAlert | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }

            $ActiveVCAlert = $ActiveVCAlert | Foreach {
                    $_ -replace "<td>green</td>","<td style=`"color:green`">green</td>"
                   }
            }
            else
        {
            $ActiveVCAlert = "<h2>vCenter Alerts last 12 hr</h2>" + "No Active Alerts For The Last 12 Hours"
        }
        Write-Host "Checking for vCenter Events Overall" -ForegroundColor Green
        $si = Get-View ServiceInstance
        $alarmMgr = Get-View -Id $si.Content.AlarmManager
        $vCenterEventsAlarm = Get-Inventory | %{
            $alarmMgr.GetAlarmState($_.ExtensionData.MoRef) |
                where{[VMware.Vim.ManagedEntityStatus]::yellow,[VMware.Vim.ManagedEntityStatus]::red -contains $_.OverallStatus} |
                Select-Object @{N='Entity';E={(Get-View -Id $_.Entity).Name}},
                    @{N='Alarm';E={(Get-View -Id $_.Alarm).Info.Name}},
                    OverallStatus,Time
        }
        if ($vCenterEventsAlarm) {
            $VCEventsAlarmsReport = $vCenterEventsAlarm | Sort-Object Time  | ConvertTo-HTML -Fragment -PreContent "<h2>vCenter Events Status</h2>"  | Out-String
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>red</td>","<td style=`"color:red`">red</td>"
                   }
            $VCEventsAlarmsReport = $VCEventsAlarmsReport | Foreach {
                    $_ -replace "<td>yellow</td>","<td style=`"color:yellow`">yellow</td>"
                   }
            }
            else
        {
            $VCEventsAlarmsReport = "<h2>vCenter Events Status</h2>" + "No Alerts on vCenter"
        }
       Write-Host "Checking for datastores below $($datastorePrecFree)% free space" -ForegroundColor Green
        $DSReport = Get-Datastore | Select-Object Name,@{N="UsedSpaceGB";E={[math]::Round(($_.CapacityGB),2)}},
                @{N="FreeSpaceGB";E={[math]::Round(($_.FreeSpaceGB),2)}},
                @{N="%Free";E={[math]::Round(($_.FreeSpaceGB)/($_.CapacityGB)*100,2)}}
                
        $DSBelow = $DSReport | Where-Object {$_."%Free" -lt $($datastorePrecFree)}

        if ($DSBelow) {
            $DSExport = $DSBelow | ConvertTo-HTML -Fragment -PreContent "<h2>DataStore Under $($datastorePrecFree)% Free Space</h2>" | Out-String
        }
        else{
            $DSExport = "<h2>DataStore Under $($datastorePrecFree)% Free Space</h2>" + "No DataStores below $($datastorePrecFree)% free space`n"
            }
## check for old reports
#$file = Get-ChildItem $ReportExport\$VCServer-DailyReport.htm -ErrorAction SilentlyContinue
#if (!$file){
#Remove-Item $ReportExport\$VCServer-DailyReport.htm -ErrorAction SilentlyContinue
#    }
## export results
Write $fragments | clip
$SAPHtmlReport = (ConvertTo-Html -Head $HTMLFormat  -Body "$Heading $VCConnect $VCResponseStatus $vmToolsReport $SnapReport $VMHAlarms $HAResultReport $VMAlarmReport $ActiveVCAlert $VCEventsAlarmsReport $DSExport"  | Out-String) -replace "(?sm)<table>\s+</table>"

$F = Get-Head
$E = Get-Head2

$sig = @"
    <html>$F - <b> $E </b></html>
"@

$sign =@"
<html>This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
Send-MailMessage -To 'rohit.vishwakarma' -From 'rohit.vishwakarma' -Subject "Daily Health Check Report - $VCServer - $dt3" -body "$SAPHtmlReport $sig" -BodyAsHtml -SmtpServer '0.0.0.0'
<#

        $mbody1 = Get-Content "$filename"
        $Top1 = "<html> <br>This auto script is executed by User - <b> Rohit Vishwakarma </b></html>"
        $mbody = $mbody1 + $top1
        $msmptserver = '0.0.0.0'
        $mport = '0'
        #$to = 'rohit.vishwakarma'
        $mfrom = 'rohit.vishwakarma'
        $msubject = "Daily Health Check Report - $VCServer -$dt3"
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $message.body = $mbody
        $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
        $smtp.Send($message)
  #>      
Disconnect-VIServer -Server $VCServer -Confirm:$false
}
