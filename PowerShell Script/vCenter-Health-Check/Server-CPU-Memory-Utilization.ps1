cls
$ServerList =@('A','B')
[string] $dt3 = get-date -Format dd/MM/yyyy
$Result = @() 
ForEach($computername in $ServerList) 
{
try{
    #$Proc = Get-WmiObject -computername $computername win32_processor -ErrorAction SilentlyContinue  | Measure-Object -property LoadPercentage -Average | Select Average
    $Proc = Get-WmiObject -computername $computername win32_processor -ErrorAction SilentlyContinue  | Measure-Object -property LoadPercentage -Average | 
    Select-Object @{Name = "Average"; Expression = {“{0:N2}” -f ($_.Average) }}
    $OS = Get-WmiObject -Class win32_operatingsystem -computername $computername -ErrorAction SilentlyContinue |
    Select-Object @{Name = "MemoryUsage"; Expression = {“{0:N2}” -f ((($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)*100)/ $_.TotalVisibleMemorySize) }}
    
    $Result += [PSCustomObject] @{ 
        ServerName = "$computername"
        CPULoad = "$($Proc.Average)"
        MemLoad = "$($OS.MemoryUsage)"
    }

}
catch
{
    Write-Host "$computername error occured" $error[0].Exception.Message "`n" -ForegroundColor Red
}

$Outputreport = "<HTML><TITLE color=#99000> SAP Utilization Report </TITLE>
                 <BODY background-color:peachpuff>
                 <font color =""#99000"" face=""Microsoft Tai le"">
                 <H2 color=#99000> SAP Utilization Report</H2></font>
                 <Table border=3 cellpadding=6 cellspacing=2>
                 <tr>
                    <td colspan='3' align='center'><font color='#000000' size='2' face='tahoma'><span style=background-color:Red><b><font color=white>CPU ALERT</span></font></b> <b> above 70%</b>&nbsp;&nbsp;<span><b> OR </b> </span>&nbsp;&nbsp;<span style=background-color:Red><b><font color=white>Memory Alert</font></b></span> <b> above 80% </b> </font>
                 </tr>
                 <TR bgcolor=#D7BDE2 align=center>
                   <TD><B>Server Name</B></TD>
                   <TD><B>CPU Utilization %</B></TD>
                   <TD><B>Memory Utilization %</B></TD>
                   </TR>"

    Foreach($Entry in $Result | Where-Object {([double]($_.MemLoad) -ge 80) -or ([double]($_.CPULoad) -ge 71)}) 
    {
    #    if(($Entry.CpuLoad) -or ($Entry.memload) -ge "80") 
         if(($Entry))
            { 
                $Outputreport += "<TR bgcolor=white>" 
            } 
      
        $Outputreport += "<TD>$($Entry.Servername)</TD>
        $(if($($Entry.CPULoad) -gt 70){"<TD bgcolor='#ea3c53' align=center>$($Entry.CPULoad)"}else{"<TD bgcolor='White' align=center>$($Entry.CPULoad)"})</TD>
        $(if($($Entry.Memload) -gt 80){"<TD bgcolor='#ea3c53' align=center>$($Entry.Memload)"}else{"<TD bgcolor='White' align=center>$($Entry.Memload)"})</TD></TR>"

    }
    $Outputreport += "</Table></BODY></HTML>" 
} 

$nn1 = $Outputreport | Out-String
$sig =@"
<html>This auto Script is executed by User - <b> Rohit Vishwakarma </b></html>
"@
if((($Entry.ServerName).count) -gt 0){ 
    $tot= @('rohit.vishwakarma')
    Send-MailMessage -To $tot     -From 'rohit.vishwakarma' -Subject "Utilization Report - $dt3" -body "$nn1 $sig" -BodyAsHtml -SmtpServer '0.0.0.0'
}
Remove-Variable Entry -Force -ErrorAction SilentlyContinue

