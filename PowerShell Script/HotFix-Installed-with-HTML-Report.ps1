$headerpatch = @"
<style>
    h1 {
        font-family: Arial, Helvetica, sans-serif;
        color: #e68a00;
        font-size: 28px;
    }
    h2 {
        font-family: Arial, Helvetica, sans-serif;
        color: #000099;
        font-size: 20px;
        text-align: center;
    }
   table {
            font-size: 15px;
            border: 0px;
            font-family: Arial, Helvetica, sans-serif;
      }
    td {
           padding: 6px;
            margin: 0px;
            border: 0;
      }
   

    th {

        background: #395870;

        background: linear-gradient(#49708f, #293f50);
        color: #fff;
        font-size: 11px;
        text-transform: uppercase;
        padding: 10px 24px;
        vertical-align: middle;
      }
    tbody tr:nth-child(even) {
        background: #f0f0f2;
    }
        #CreationDate {
        font-family: Arial, Helvetica, sans-serif;
        color: #ff3300;
        font-size: 12px;
    }
</style>
    <Title>$ReportTitle</Title>
"@

#https://stackoverflow.com/questions/24039325/get-the-last-windows-update-install-date-using-powershell
#$ComputerName = "$env:COMPUTERNAME"
$ComputerName =@('localhost','sdfsdfds')
#$ComputerName = Get-Content 'C:\Users\username\Documents\ip.txt'
$count = 0;
$out = @()
$Reportnew = @()
Foreach ($Computer in $ComputerName) {
    $count += 1;
   Try{
        $OS = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -ErrorAction Stop
        $patch = Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName $Computer  | Where-Object {$_.InstalledOn} | where { (Get-date($_.Installedon)) -gt (get-date).adddays(-30) } | Select-Object Description, HotFixID, InstalledBy, InstalledOn -Last 2 -ExpandProperty HotFixID
        $Uptime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)
        $out = [PSCustomObject]@{
                    ComputerName    = $Computer
                    LastBoot        = $OS.ConvertToDateTime($OS.LastBootUpTime)
                    Uptime          = ([String]$Uptime.Days + " Days " + $Uptime.Hours + " Hours " + $Uptime.Minutes + " Minutes " + $Uptime.Seconds + " Seconds ");
                    Description1    = ($patch.Description.Split(',')[0]).Trim()
                    HotFix_ID1      = ($patch.HotFixID.Split(',')[0]).Trim()
                    Description2    = ($patch.Description.Split(',')[1]).Trim()
                    HotFix_ID2      = ($patch.HotFixID.Split(',')[1]).Trim()
#                   HotFixID        = (@($patch.HotFixID) -join ',')
#                   InstalledBy1    = (@($patch.InstalledBy) -join ',')
                    InstalledBy1    = ($patch.InstalledBy).Split(',')[0].Trim()
#                   InstalledBy2    = ($patch.InstalledBy).Split(',')[1].Trim()
#                   InstalledOn     = (@($patch.InstalledOn) -Join ',')
                    InstalledOn1    = (($patch.InstalledOn) -split ',')[0]
                    InstalledOn2    = (($patch.InstalledOn) -split ',')[1]
                   }
            $Reportnew += $out
        }
        catch {
        $out = [PSCustomObject]@{
                    ComputerName  = $Computer
                    LastBoot      = $_.Exception.Message.Split('.')[0]
                    Uptime        = "Unable to Connect"
                    Description1  = "Check the Connection"
                    HotFix_ID1    = "Check the Firewall"
                   }
            $Reportnew += $out
        }
}
$Reportnew  = $Reportnew
$Reportnew | Format-Table -AutoSize
Write-Host "Total Server:- $count" -ForegroundColor Cyan
#######################################################################################################################
        $fragments = @()
        $fragments += "<H1>Patch Report for $env:USERDNSDOMAIN Domain </H1>"
        $fragments += $Reportnew | ConvertTo-Html -Fragment
        $fragments += "<br></br>"
#######################################################################################################################
        Write $fragments | clip
        ConvertTo-Html -Head $headerpatch  -PreContent ($fragments | Out-String) -PostContent "<p id='CreationDate'>Total Server: $count / Created on: $(Get-Date)</p>"  | Out-File 'C:\Users\username\Documents\patch.htm'
#        ConvertTo-Html -Head $headerpatch  -PreContent ($fragments | Out-String)   | Out-File 'C:\Users\username\powershell\Script\patch.htm'
        Invoke-Item 'C:\Users\username\Documents\patch.htm'



 