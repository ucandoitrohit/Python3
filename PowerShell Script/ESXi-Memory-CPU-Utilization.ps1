############## ESXi Memory and CPU utilization ##########################

$passwd = Get-Content "C:\pass.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username@domain.com",$passwd )
$vc1 = 'vc1'
$vc2 = 'vc2'
$vc3 = 'vc3server'

$vcs =@($vc1, $vc2, $vc3)
[string]$dt3 = get-date -Format dd/MM/yyyy
$datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
$parent_id   = Split-Path -Parent $MyInvocation.MyCommand.Definition
#$vcs = Get-Content ($parent_id + "\vc.txt")
foreach($vc in $vcs){
Connect-VIServer -Server $vc -Credential $credentials
$Result = @()
$filename = ($parent_id + "\Report\SAP\SAP-ESXi-CPU-RAM\$($VC).html")
$Result += Get-VMHost |
Select Name, NumCpu,
    @{N='CPUGHzCapacity';E={[math]::Round($_.CpuTotalMhz/1000,2)}},
    @{N='CPUGHzUsed';E={[math]::Round($_.CpuUsageMhz/1000,2)}},
    @{N='CPUGHzFree';E={[math]::Round(($_.CpuTotalMhz - $_.CpuUsageMhz)/1000,2)}},
    @{N='MemoryCapacityGB';E={[math]::Round($_.MemoryTotalGB,2)}},
    @{N='MemoryUsedGB';E={[math]::Round($_.MemoryUsageGB,2)}},
    @{N='MemoryFreeGB';E={[math]::Round(($_.MemoryTotalGB - $_.MemoryUsageGB),2)}},
    @{N='FreeP';E={[math]::Round(((100*($_.MemoryTotalGB - $_.MemoryUsageGB))/($_.MemoryTotalGB)),2)}} | sort -Property "FreeP"

      $HTML = '<style type="text/css">
      #Header{font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;width:100%;border-collapse:collapse;}
      #Header td, #Header th {font-size:14px;border:1px solid #98bf21;padding:3px 7px 2px 7px;}
      #Header th {font-size:14px;text-align:center;padding-top:5px;padding-bottom:4px;background-color:#cccccc;color:#000000;}
      #Header tr.alt td {color:#000;background-color:#EAF2D3;}
      </Style>'
    $HTML += "<HTML>
                <BODY>
                    <Table border=1 cellpadding=0 cellspacing=0 id=Header>
                        <caption>
                            <font size=3 color=green>
                                <h1 align=""center"">$vc-ESXi Memory and CPU Report </h1>
                            </font>
                         </caption>
                        <TR>
                            <TH><B>ESXi Name</B></TH>
                            <TH><B>Num CPU</B></TD>
                            <TH><B>CPU GHz Capacity</B></TH>
                            <TH><B>CPU GHz Used</B></TH>
                            <TH><B>CPU GHz Free</B></TH>
                            <TH><B>Memory Capacity</B></TH>
                            <TH><B>Memory Used</B></TH>
                            <TH><B>Memory Free</B></TH>
                            <TH><B>Free%</B></TH>
                        </TR>"
Foreach($Entry in $Result)
    {
        if($Entry.FreeP -lt "40")
            {
                  $HTML += "<TR bgColor=#ff7a7a>"
            }
            else
            {
                  $HTML += "<TR>"
            }
            $HTML += "
                                    <TD>$($Entry.Name)</TD>
                                    <TD>$($Entry.NumCpu)</TD>
                                    <TD>$($Entry.CPUGHzCapacity)</TD>
                                    <TD>$($Entry.CPUGHzUsed)</TD>
                                    <TD>$($Entry.CPUGHzFree)</TD>
                                    <TD>$($Entry.MemoryCapacityGB)</TD>
                                    <TD>$($Entry.MemoryUsedGB)</TD>
                                    <TD>$($Entry.MemoryFreeGB)</TD>
                                    <TD>$($Entry.FreeP)</TD>
                              </TR>"
    }
$HTML += "</Table></BODY></HTML>"
$HTML | Out-File $filename
}
$Uname = Get-Content Env:USERNAME

$msmptserver = 'SMTP-SERVER'
        $mport = '25'
        $mto = 'EMAIL-ID'
        $mfrom = ''EMAIL-ID''
        $msubject = "ESXi Memory and CPU Utilization - $datefile"
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
        foreach ($vc in $vcs){
                $mbody1 = Get-Content ($parent_id + "\Report\SAP\SAP-ESXi-CPU-RAM\S*.html")
                $mbody2 = Get-Content ($parent_id + "\Report\SAP\SAP-ESXi-CPU-RAM\u*.html")
                $mbody = $mbody1 + $mbody2
                $Sig =  "<html><p><o:p> </o:p></p><B> Capacity Report, <p> rohit.vishwakarma@hm.com</B></p></html>"
                $Top = "<html> This Script is executed by User - <b> Rohit Vishwakarma </b></html>"
                $MailText= $Top + $mbody + $Sig
        }
        $message.body = $MailText
        $smtp.Send($message)
   
Disconnect-VIServer -Server vCenter-Name -Confirm:$false
Disconnect-VIServer -Server vCenter-Name -Confirm:$false
 

 

 


 