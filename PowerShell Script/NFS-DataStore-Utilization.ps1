################### NFS DataStore Utilization  ###################

$passwd = Get-Content "C:\pass.txt" | ConvertTo-SecureString
$credentials = New-Object System.Management.Automation.PSCredential ("username@domain.com",$passwd )

Connect-VIServer -Server vCenter-NAme   -Credential $credentials

$date = get-date
$datefile = get-date -uformat '%m-%d-%Y-%H%M%S'
[string] $dt3 = get-date -Format dd/MM/yyyy
$filename = "C:\Users\rovis\Documents\SAP-RvTool\Report\SAP\SAP-Datastore\NFS\vc-nfs-" + $datefile + ".htm"
$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{font-size: 25px;border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: #008080}"
$a = $a + "TD{text-align: center;border-width: 1px;padding: 5px;border-style: solid;border-color: black;foreground-color: black;background-color: white}"
$a = $a + "</style>"
$Datastorename = Get-Datastore -Name *NFS*
foreach($Datastorecluster in $Datastorename){
#Get-Datastore -Name NFSQ72TMP3 | Select Name, @{N="Cluster"; E={(Get-VMHost -Datastore $_ | Get-Cluster).Name}},@{N="FreeSpace"; E={[Math]::Round($_.FreeSpaceGB,2)}},  @{N="Capacity"; E={[Math]::Round($_.CapacityGB,2) }}, @{N="Percentage"; E={"{0:P1}" -f($_.FreeSpaceGB/$_.CapacityGB )}}
 $Datastorename | Select-Object Name, @{N="Cluster"; E={(Get-VMHost -Datastore $_ | Get-Cluster).Name}},@{N="Capacity(GB)"; E={[Math]::Round($_.CapacityGB,2) }}, @{N="FreeSpace(GB)"; E={[Math]::Round($_.FreeSpaceGB,2)}}, @{N="Free %"; E={"{0:P1}" -f($_.FreeSpaceGB/$_.CapacityGB )}} |  ConvertTo-HTML -head $a -body "<H2>NFS DataStore Utilization - sestovora001 - $date </H2>"| Out-File $filename
}

        $mbody1 = Get-Content "$filename"
        $Top1 = "<html> This auto script is executed by User - <b> Rohit Vishwakarma </b></html>"
        $mbody = $mbody1 + $top1
        $msmptserver = 'SMTP-SERVER'
        $mport = '25'
        $mto = 'EMAIL-ID'
        $mfrom = 'EMAIL-ID'
        $msubject = "NFS DataStore Utilization - sestovora001 -$dt3"
        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)
        $message.IsBodyHtml = $true;
        $message.body = $mbody
        $smtp = New-Object Net.Mail.SmtpClient($msmptserver)
        $smtp.Send($message)
 

        Disconnect-VIServer -Server vCenter-Name -Confirm:$false

