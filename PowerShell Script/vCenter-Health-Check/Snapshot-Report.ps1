cls
Import-Module C:\Users\Administrator\Documents\WindowsPowerShell\Modules\connect.psm1
[string] $dt3 = get-date -Format dd/MM/yyyy
$vc = Connect-VoraName -ErrorAction SilentlyContinue -ErrorVariable ErrorProcess;
$vCenter = $vc.Name
if($ErrorProcess){
        Write-Warning "Error connecting to vCenter Server $vCenter error message below"
        Write-Warning $Error[0].Exception.Message
        $errorvcenter = $Error[0].Exception.Message
         Send-MailMessage -SmtpServer 0.0.0.0 -Port 25 -To rohit.vishwakarma -From rohit.vishwakarma -Subject "Snapshot Report - $vCenter" -Body "$errorvcenter " -BodyAsHtml
        exit
    }
else
{
$date = get-date
$datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
[string] $dt3 = get-date -Format dd/MM/yyyy
$filenamevora = "D:\Rohit-Script\Report\Snapshot\vCenter-name-" + $datefile + ".htm"
$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: LightBlue}"
$a = $a + "TD{border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: white}"
$a = $a + "</style>"
Write-Host "Checking VMs for for snapshots"
$ssvora = Get-vm | Get-Snapshot
Write-Host "   Complete" -ForegroundColor Green
Write-Host "Generating VM snapshot report"
$VORAReport = $ssvora | Select-Object vm, name,description,
        @{Label="Size";Expression={"{0:N2} GB" -f ($_.SizeGB)}} ,Created,
        @{Name="Ageing";Expression={ (New-TimeSpan -End (Get-Date) -Start $_.Created).Days }},
        @{Name="User"; Expression = { (Get-VIEvent -Entity $_.VM -MaxSamples 4000 -Start $_.Created.AddSeconds(-10) | Where {$_.Info.DescriptionId -eq "VirtualMachine.createSnapshot"} | Sort-Object CreatedTime | Select-Object -First 1).UserName}} | ConvertTo-HTML -head $a -body "<H2>VM Snapshot Report - $vCenter - $date </H2>"| Out-String
<#
        Write-Host "   Complete" -ForegroundColor Green
        Write-Host "Your snapshot report has been saved to:" $filenamevora
        Start-Sleep(3)
        $mbodyvora = Get-Content "$filenamevora"
        $Topvora = "<html> This auto script is executed by User - <b> Rohit Vishwakarma </b></html>"
        $mbody = $mbodyvora + $topvora
        $msmptserver = '0.0.0.0'
        $mport = '0'
        #$mto = 'rohit.vishwakarma'
        $mfrom = 'rohit.vishwakarma'
        $msubject = "Snapshot Report -$dt3"
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $message.body = $mbody
#>
$F = Get-Head
$E = Get-Head2
if((($ssvora.vm).count) -gt 0 ){
<# 
    $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
    $smtp.Send($message)
    Write-Host "Mail send" -ForegroundColor Green
#>
$sign =@"
        <html>This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
$sig = @"
    <html>$F - <b> $E </b></html>
"@
    Send-MailMessage -To 'rohit.vishwakarma' -From 'rohit.vishwakarma' -Subject "Snapshot Report - $vCenter -$dt3" -body "$VORAReport $sig" -BodyAsHtml -SmtpServer '0.0.0.0'
    Write-Host "Mail send" -ForegroundColor Green
    Remove-Variable ssvora -Force -ErrorAction SilentlyContinue
    }
else
    {
     $nosnapshotvora = @"
         <table style="width: 100%" style="border-collapse: collapse; border: 1px solid #bc8f8f;">
             <tr>
                 <td colspan ="1" bgcolor="#bc8f8f" style="color: #f0e68c; font-size: 25; height: 40px;text-align: center; font-weight:bold">
                    sestovora001 -'$date'
                </td>
            <tr >
                <td bgcolor="gray" style="color: #FFFFFF; font-size: 25; height: 30px;text-align: center;" > No Snapshot Found </td>
            </table> 
"@
$sign =@"
<html> This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
$sig = @"
    <html>$F - <b> $E </b></html>
"@
    Write-Host "No Snapshot Found"
    Send-MailMessage -SmtpServer 0.0.0.0 -Port 0 -To rohit.vishwakarma -From rohit.vishwakarma -Subject "Snapshot Report- $dt3" -Body "$nosnapshotvora $sig" -BodyAsHtml
    }
  #  }
  Disconnect-VoraName
}