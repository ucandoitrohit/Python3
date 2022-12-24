cls
# Change AdmID Password 
# Reboot date
$ComputerName = @('Server-1','TestServer','Server-2')

$FolderName = 'RebootReport'
$filepath1 = Join-Path -Path $env:USERPROFILE -ChildPath "\Documents"
$filepath =Join-Path $filepath1 -ChildPath $FolderName
$ExtensionFileName = '*.csv'; $UserName = $env:USERNAME

$tot = @('rohit.vishwakarma','other--user-email-id')
$from = 'automation.user'
$SMTPN = '0.0.0.0'
function CreateDirectory {
    $folderCheck = Test-Path -Path "$filepath"
        if ($folderCheck  -eq $false) {
            Write-Host $folderCheck "not found, creating it."
            New-Item $filepath -type directory
            }
            else
            { Get-ChildItem -Path $filepath | Remove-Item
            }
    }
CreateDirectory ;Start-Sleep 5

$date = Get-Date -Format 'yyyyMMdd';$date2 = get-date
[string] $dt3 = get-date -Format dd/MM/yyyy
$day = (get-date).DayOfWeek
#$days = 'Saturday'
$dd ='0'

###########################################################################################################################################
$TodayDate = Get-Date
$FirstDay = new-object DateTime($TodayDate.Year, $TodayDate.Month, [DateTime]::DaysInMonth($TodayDate.Year, $TodayDate.Month))
$diff = ([int] [DayOfWeek]::Saturday) - ([int] $FirstDay.DayOfWeek)
if ($diff -ge 0) {
    $RR1 = $FirstDay.AddDays(- (28-$diff))
    $RebootDate = $RR1.ToString("dd-MM-yyyy")
    }
    else 
    {
    $RR1 = $FirstDay.AddDays(-14+$diff)
    $RebootDate = $RR1.ToString("dd-MM-yyyy")
    }
$TodayDateString = $TodayDate.ToString("dd-MM-yyyy")
##########################################################################################################################################

$AccountName = 'administrator or adm-id'
$RDP = "$env:USERPROFILE\Documents\.rdp.txt"
$passwd = Get-Content  $RDP | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("$AccountName",$passwd )
Function Sleep-Progress($seconds, $CN) {
    $s = 0;
    Do {
        $p = [math]::Round(100 - (($seconds - $s) / $seconds * 100));
        Write-Progress -Activity "Waiting for Services to Come UP...on Server $CN" -Status "$p% Complete:" -SecondsRemaining ($seconds - $s) -PercentComplete $p;
        [System.Threading.Thread]::Sleep(1000)
        $s++;
    }
    While($s -lt $seconds);
    
}
#############################################################################################################################################
$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: #fb88ae;border-collapse: collapse;}"
$a = $a + "TH{font-size: 25px;border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: #BAF0F5}"
$a = $a + "TD{text-align: center;border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: white}"
$a = $a + "</style>"

$Object = @();$Result = @();$array = @();$myobject2 = @();$OutputS = @();$OutputObj = @();$NonPing = @();$NonPing2 = @();$NonPing3 = @();$Column = "#F8FAC1";
$count = 0;$ReportCount = 0;$Offline = "#D43235"

Write-host "`nPlease Wait !..........." -ForegroundColor Magenta

$NonPing = "
	<html>
	<head>
		<title> Server Down Report -$date </title>
	</head>
	<body {background-color:white;}>
		<H1 Align=`"Left`"> <B>Server Down Report - $date2 </B></H1>
		<table width=`"50%`" Border=`"1`" CellPadding=`"2`" Align=`"Left`" >
			<tr>
				<td style=height:50px; BGColor=$Column Align=Center><b><p style=color:blue;font-size:22px;> SERVER NAME </p></b></td>
				<td BGColor=$Column Align=Center><b><p style=color:blue;font-size:22px;> STATUS </p></b></td>
			</tr>"

Foreach ($Computer in $ComputerName) {
    $Computer = $Computer.ToUpper()
    $OutputObj = New-Object -TypeName PSobject
    $OutputObj | Add-Member -MemberType NoteProperty -Name ServerName -Value $Computer

    if((Test-Connection -ComputerName $Computer -Count 1 -Quiet) -ne $true){
        $count +=1;
        Write-Host "###############################################################################`n" -ForegroundColor Magenta
        Write-Host "`nNot able to connect to $Computer the Server. Might be down or not exist...`n" -ForegroundColor Red
        Write-Host "Server Down:---" -ForegroundColor Green -NoNewline
        Write-Host "$Computer`n" 
        Write-Host "###############################################################################`n" -ForegroundColor Magenta
        $OutputObj | Add-Member -MemberType NoteProperty -Name Status -Value "Unreachable"

$NonPing += "
	<TR>
		<TD BGColor=white Align = Left>$($OutputObj.ServerName)</TD>
		<TD BGColor=$Offline Align = Left>$($OutputObj.Status)</TD>
	</TR>"
        $NonPing2 = $NonPing
        $NonPing3 = $NonPing2 | Out-String
            }

            else
            {
            $ReportCount +=1
            Try {
                $OS = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -Credential $credentials  -ErrorAction Stop
                $Uptime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)

                if ((($OS.ConvertToDateTime($OS.LocalDateTime) – $OS.ConvertToDateTime($OS.LastBootUpTime)).Days -ge $dd) -and ($day -eq $days))
 #               if ((($OS.ConvertToDateTime($OS.LocalDateTime) – $OS.ConvertToDateTime($OS.LastBootUpTime)).Days -ge $dd) -and ($TodayDateString -eq $RebootDate))
                {
                    Write-Host "###############################################################################`n" -ForegroundColor Magenta
                    Write-Host "Server UP:---" -ForegroundColor Green -NoNewline
                    Write-Host "$Computer`n"
                    Write-Host "`nExporting the All Service Status Before Server Reboot:---" -ForegroundColor Red 
                    Write-Host "`nUptime of server $Computer is more than $dd days...now," -ForegroundColor Green
                    Start-Sleep 10

                    $services_before_reboot = "$($Computer)_services_before_reboot_$(Get-Date -Format 'yyyyMMddhhmmssfff').csv"
#                    $current_services_state = Get-WmiObject -Class win32_service -ComputerName $Computer  | Select-Object Name, DisplayName, Status
                    $current_services_state = Get-Service -ComputerName $Computer -Name Citrix* | Select-Object   Name, DisplayName, Machinename, Status 
                    $BeforeFileName = Join-Path -Path $filepath -ChildPath  $services_before_reboot
                    #$current_services_state | Out-File -FilePath $BeforeFileName
                    $current_services_state | Export-Csv -Path  $BeforeFileName -NoTypeInformation
                    Start-Sleep 10
                    Write-host "`nRebooting the Server $Computer.. Please wait" -ForegroundColor Cyan

                    #Restart-Computer -ComputerName $Computer -Credential $credentials -Wait -For WinRM -Delay 2 -Force 

                     Sleep-Progress 10 $Computer
#                     Write-host "Stopping Service"
#                   Get-Service -ComputerName $Computer -Name AJRouter | Stop-Service -PassThru | Set-Service -StartupType Automatic

                    $OS2 = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -Credential $credentials   -ErrorAction Stop
                    $Uptime2 = (Get-Date) - $OS2.ConvertToDateTime($OS2.LastBootUpTime)
                    Write-Host "`nExporting the Service Status After Reboot Server:---`n" -ForegroundColor Red 
                    $services_after_reboot = "$($Computer)_services_after_reboot_$(Get-Date -Format 'yyyyMMddhhmmssfff').csv"
                    #$current_services_state2 = Get-WmiObject -Class win32_service -ComputerName $Computer | sort name -Descending | Select-Object Name, displayname, status
                    $current_services_state2 = Get-Service -ComputerName $Computer  -Name Citrix* | Select-Object   Name, DisplayName, Machinename, Status 
                    $AfterFileName = Join-Path -Path $filepath -ChildPath  $services_after_reboot
                    #$current_services_state2 | Out-File -FilePath $AfterFileName
                    $current_services_state2 | Export-Csv -Path $AfterFileName -NoTypeInformation
                    $references = Get-ChildItem -Path $filepath *_Services_*.csv  | Where-Object {$_.name -like "$Computer_services*"} 

                    if($references.count -gt 0){
                        Get-ChildItem -Path $filepath\* -Include *_services_after*.csv  | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv "$filepath\Before_Reboot_Merged.csv"  -NoTypeInformation
                        Get-ChildItem -Path $filepath\* -Include *_services_before*.csv | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv "$filepath\After_Reboot_Merged.csv"  -NoTypeInformation 
                        $BeforeFileNameMerged = Get-Content "$filepath\Before_Reboot_Merged.csv"
                        $AfterFileNameMerged  = Get-Content "$filepath\After_Reboot_Merged.csv"
                        $array = Compare-Object -ReferenceObject $AfterFileNameMerged -DifferenceObject $BeforeFileNameMerged

                        if($array.Count -gt 1){
                            Foreach ($line in $array){
                                $myobject = $line.inputobject + ($line.sideindicator -replace("=>"," After Server Reboot")) -replace("<="," Before Server Reboot")
                                $svcstatus = $myobject.Split(',')[3]               #Running Before Server Reboot

                                if($svcstatus.Contains("Running After")){
                                    $svcdisplayname = $myobject.Split(',')[0]      #AJRouter
                                    "`nNeed to STOP this service: " + $svcdisplayname + " -- because status is: " + $svcstatus + "`n"
                                    $svcname = $myobject.Split(',')[0]      #AJRouter
    #                                Get-Service -ComputerName $Computer -Name $svcname | Stop-Service -PassThru | Set-Service -StartupType Disabled
    #                                Get-Service -ComputerName $Computer -Name $svcname | Select-Object Status, Name, DisplayName, StartType | FT
                                }

                                elseif($svcstatus.Contains("Stopped After")){
                                    $svcdisplayname = $myobject.Split(',')[0]
                                    "`nNeed to START this service: " + $svcdisplayname + ": on Server " + $Computer + "-- because status is: " + $svcstatus + "`n"
                                    $svcname = $myobject.Split(',')[0]      #AJRouter
    #                                Set-Service -ComputerName $Computer -Name $svcname  -StartupType Automatic 
    #                                Get-Service -ComputerName $Computer -Name $svcname | Set-Service -Status Running
                                }$myobject2 +=  $myobject
                            }
#                            $myobject2
                                $CompareServiceFile  = "$($Computer)_Myobject2_Output_$(Get-Date -Format 'yyyyMMddhhmmssfff').csv"
                                $CompareServiceFile2 = "$($Computer)_Myobject2_Output_Complete_$(Get-Date -Format 'yyyyMMddhhmmssfff').csv"
                                $FileC1 = New-Item "$filepath\$CompareServiceFile" -Force
                                $FileC2 = New-Item "$filepath\$CompareServiceFile2" -Force
                                $ServiceComFile  = Join-Path $filepath -ChildPath $CompareServiceFile
                                $ServiceComFile2 = Join-Path $filepath -ChildPath $CompareServiceFile2
                                Start-Sleep 5;    $myobject2 | Sort-Object -Unique | Out-File -FilePath $ServiceComFile
                                Import-Csv -Path $ServiceComFile -Header 'Service','DisplayName','ServerName','Status' | Export-Csv $ServiceComFile2 -NoTypeInformation
                                $CompleteService = Import-Csv $ServiceComFile2
                                $OutputS  = $CompleteService  |Sort -Property Service | ConvertTo-HTML -head $a -body "<H2>Services Status $date2 </H2>"| Out-String
                        }

                    }else {  Write-hot "not found"}
                }
                else
                {
                    Write-Host "`nUptime of server $Computer is less than $dd days`n" -ForegroundColor Yellow
                    $OS2 = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer  -ErrorAction Stop
                    $Uptime2 = (Get-Date) - $OS2.ConvertToDateTime($OS2.LastBootUpTime)
                }
                $Object = [PSCustomObject]@{
                    ComputerName  = $Computer
                    LastBoot      = $OS2.ConvertToDateTime($OS2.LastBootUpTime)
                    Uptime        = ([String]$Uptime2.Days + " Days " + $Uptime2.Hours + " Hours " + $Uptime2.Minutes + " Minutes")
                }
                $Result += $Object

             } catch {
              $Object =  [PSCustomObject]@{
                    ComputerName  = $Computer
                    LastBoot      = "Unable to Connect"
                    Uptime        = $_.Exception.Message.Split('.')[0]
                }
                $Result += $Object

            } finally {
                $null = $OS2
                $null = $Uptime2
            }
        }
    }

$Report = $Result  |  ConvertTo-HTML -head $a -body "<H2>EUS Auto Reboot Server Report - $date2 </H2>"| Out-String

$sig =@"
<html><body style="color:red;">This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@

$note =@"
<html><body style="color:Green;"><br><br><b>@Team,<br><br> Please Monitor the above Server,<br> <br>It is Scheduled to Reboot the Server on Month of <i><u><font color="Red">SATURDAY</font></u></i> with Uptime of Server must be more than  <i><u><font color="Red">$dd Days</font> </u></i>  </b></html>
"@


$noted =@"
<html><body style="color:Yellow;"><table><br><br><b>@Team,<br><br> Please Validate the above Server, might be server doesn't exist or might be Server is Down  </b></table></html>
"@


$mbody = "<html>

<p style=color:Green;text-decoration:none;font-size:18px;font-family:Dreaming Outloud Pro; font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;>Hi Team, </p>

<p style=color:Green;text-decoration:none;font-size:18px;font-family:Dreaming Outloud Pro ;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;>Greetings! </p>

<p style=color:red;text-decoration:none;font-size:14px;font-family:Dreaming Outloud Pro, Helvetica, sans-serif;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;>Auto generated mail ! Please do not reply.</p>

</html>"

$signature =@"
<table cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;table-layout: fixed;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;" emb-background-style="" width="70%" direction="ltr">
    <tbody>
        <tr>
            <td style="color:#5137F1;text-decoration:none;font-size:18.2px;font-family:Arial, Helvetica, sans-serif;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;">
              <span style="color:#5137F1;text-decoration:none;font-size:18.2px;font-family:'Segoe UI', Helvetica, sans-serif;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;">Thanks & Regards</span>
            </td>
        </tr>
        <tr>
            <td style="color:#CC071E;text-decoration:none;font-size:14.3px;font-family:Engravers MT, Helvetica, sans-serif;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;">Company Name
            </td>
        </tr>
        <tr>
            <td style="color:#000000;text-decoration:none;font-size:14.3px;font-family:Georgia, Helvetica, sans-serif;font-weight:bold;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;">Support Team</td>
        </tr>
        <tr>
            <td style="color:#000000;text-decoration:none;font-size:13px;font-family:Georgia, Helvetica, sans-serif;font-weight:normal;line-height:18px;mso-line-height-rule:exactly;padding-bottom:5px;">Email: <a href=mailto:rohit.vishwakarma style="color:blue;text-decoration:none;font-size:13px;font-family:Arial, Helvetica, sans-serif;font-weight:normal;line-height:18px;mso-line-height-rule:exactly;">rohit.vishwakarma</a>
        </td>
        </tr>
"@
#############################################################################################################################################################################################################
if($ReportCount -ge 1){

   Send-MailMessage -To $tot -From $from -Subject " Auto Reboot Server UP Report - $dt3" -body "$Report $sig $note" -BodyAsHtml -SmtpServer $SMTPN
}

###############################################################################################################################################################################################################

if ($count -ge 1){
   
  Send-MailMessage -To $tot -From $from -Subject " Auto Reboot Server Down Report - $dt3" -body $NonPing3  -BodyAsHtml -SmtpServer $SMTPN
}
###############################################################################################################################################################################################################

if($array.Count -gt 1){

    Send-MailMessage -SmtpServer $SMTPN -Port 25 -To $tot -From $from -Subject "Services Status of server - $dt3" -Body "$OutputS $sig" -BodyAsHtml
}
 else
{ 
$AllServiceRunning =@"
<html><body style="color:Yellow;"><table><b> <h2>Confirmed all Services on Server are running Before and After  Server Reboot !</h2>  </b><br><br><br></table></html>
"@
    Send-MailMessage -SmtpServer $SMTPN -Port 0 -To $tot -From $from -Subject "Services Status of Server - $dt3" -Body "$mbody $AllServiceRunning $signature"-BodyAsHtml
 }

###############################################################################################################################################################################################################


#END 

