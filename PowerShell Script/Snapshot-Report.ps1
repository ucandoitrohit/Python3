################ SnapShot Report #########################

$passwd = Get-Content "C:\pass.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username@domain.com",$passwd )

Connect-VIServer -Server vCenter-NAme   -Credential $credentials
$date = get-date
$datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
[string] $dt3 = get-date -Format dd/MM/yyyy
$filenamesap = "C:\Users\rovis\Documents\SAP-RvTool\Report\SAP\SAP-Snapshot\vc-" + $datefile + ".htm"
$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: LightBlue}"
$a = $a + "TD{border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: white}"
$a = $a + "</style>"

Write-Host "Checking VMs for for snapshots"
$sssap = Get-vm | Get-Snapshot
        Write-Host "   Complete" -ForegroundColor Green
        Write-Host "Generating VM snapshot report"
        $sssap | Select-Object vm, name,description,@{Label="Size";Expression={"{0:N2} GB" -f ($_.SizeGB)}} ,Created,@{Name="User"; Expression = { (Get-VIEvent -Entity $_.VM -MaxSamples 4000 -Start $_.Created.AddSeconds(-10) | Where {$_.Info.DescriptionId -eq "VirtualMachine.createSnapshot"} | Sort-Object CreatedTime | Select-Object -First 1).UserName}} | ConvertTo-HTML -head $a -body "<H2>VM Snapshot Report - sestovsap001 - $date </H2>"| Out-File $filenamesap
        Write-Host "   Complete" -ForegroundColor Green
        Write-Host "Your snapshot report has been saved to:" $filenamesap
        Start-Sleep(3)
        $mbodysap = Get-Content "$filenamesap"
        $Topsap = "<html> This auto script is executed by User - <b> Rohit Vishwakarma </b></html>"
        $mbody = $mbodysap + $topsap
        $msmptserver = 'SMTP-SERVER'
        $mport = '25'
        $mto = 'EMAIL-ID'
        $mfrom = 'EMAIL-ID'
        $msubject = "SAP Snapshot Report - vc -$dt3"
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $message.body = $mbody
      if((($sssap.vm).count) -gt 0 ){
           $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
            $smtp.Send($message)
            Write-Host "Mail send" -ForegroundColor Green
            }
        else
        {
            $nosnapshotsap = @"
            <table style="width: 100%" style="border-collapse: collapse; border: 1px solid #bc8f8f;">
              <tr>
                <td colspan ="1" bgcolor="#bc8f8f" style="color: #f0e68c; font-size: 25; height: 40px;text-align: center; font-weight:bold">
                    vc -'$date'
                </td>
              <tr >
                <td bgcolor="gray" style="color: #FFFFFF; font-size: 25; height: 30px;text-align: center;" > No Snapshot Found </td>
            </table>
"@
##############################################################################################################################################
$sig =@"
<html> This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
##############################################################################################################################################
            Write-Host "No Snapshot Found"
            Send-MailMessage -SmtpServer SMTP-SERVER -Port 25 -To EMAIL-ID -From EMAIL-ID -Subject "SAP Snapshot Report - vc - $dt3" -Body "$nosnapshotsap $sig" -BodyAsHtml
       }
  #  }
  Disconnect-VIServer -Server vCenter-Name -Confirm:$false
  
