<#$new = "localhost"
$report =@()
$done = Get-WmiObject -ComputerName $new -Class win32_logicaldisk -Filter DriveType=3 |`
Select-Object DeviceID,
  @{Name="SIze"      ;E={[Math]::Round($_.size/1GB,2)}},`
  @{Name="FreeSpace" ;E={[Math]::Round($_.freespace/1GB,2)}},`
  @{Name="%"         ;E={[Math]::Round(($_.freespace/$_.size)*100,2)}}
  $report += $done
#>

#$serverip = Get-Content .\powershell\ip.txt
$serverip ="localhost","bvbnvnbvnbvnbvnv","localhost", "hdfs"
$report =@()
foreach($new in $serverip)
{
    Write-host "Processing the server $new" -ForegroundColor Green
try{
$done1 = Get-WmiObject -ComputerName $new -Class win32_logicaldisk -Filter DriveType=3 -ErrorAction Stop |`
Select-Object @{Name="Server Name";E={$_.systemname}},`
  @{Name="DriveNew";E={$_.DeviceID}},`
  @{Name="Total Space(GB)" ;E={"{0:N2}" -f($_.Size/1GB)}},`
  @{Name="FreeSpace(GB)"   ;E={"{0:N2}" -f($_.FreeSpace/1GB)}},`
  @{Name="Used Space(GB)"  ;E={"{0:N2}" -f(($_.Size - $_.FreeSpace)/1GB)}},`
  @{Name="Free in %"       ;E={"{0:P2}" -f($_.FreeSpace/$_.Size)}}  
  $report +=$done1
     }
  catch{
          Write-Host "`n Could n't connect to server $new check the log file for error " -ForegroundColor Yellow
          Write-Host "C:\Users\lenovo\Documents\WindowsPowerShell\error.txt"  -ForegroundColor Yellow
        $error[0].Exception.Message | Out-File C:\Users\lenovo\Documents\WindowsPowerShell\error.txt -Append
        $error[0].Exception.Message | Out-GridView -Title "Error" -OutputMode None
      }
  }
   #>
  $report | Export-Csv -Path C:\Users\lenovo\Documents\WindowsPowerShell\report.csv -NoTypeInformation -Encoding UTF8


 

 