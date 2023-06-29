#192.168.0.196

#$Creds=Get-Credential
#$SSH=New-SSHSession -ComputerName 192.168.0.196 -Credential $Creds -AcceptKey

Invoke-SSHCommand -SSHSession $SSH -Command "uptime"
#or
$up=Invoke-SSHCommand -SSHSession $SSH -Command "uptime"
$up.output
#or
Invoke-SSHCommand -SSHSession $SSH -Command "ls" | Select-Object -ExpandProperty output

$ls=Invoke-SSHCommand -SSHSession $SSH -Command "ls"
$ls.output

Invoke-SSHCommand -SSHSession $SSH -Command "pwd"

Invoke-SSHCommand -SSHSession $SSH -Command "cd /home/u1;pwd;ls;cat file1.txt"
#or
$linux=Invoke-SSHCommand -SSHSession $SSH -Command "cd /home/u1;pwd;ls;cat file1.txt"
$linux.output


$Command = (Get-Content -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Linux_command.txt") -join ";"
$out=Invoke-SSHCommand -SSHSession $SSH -Command $Command
$out.output





#Remove-SSHSession -SSHSession $SSH
