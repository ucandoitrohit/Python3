$ComputerName = Get-Content C:\Users\username\Documents\ip.txt
$out = @()
        Foreach ($Computer in $ComputerName) {
            $Computer = $Computer.ToUpper()
            Try {
                $OS = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -ErrorAction Stop
                $patch = Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName $Computer  | Where-Object {$_.InstalledOn} | where { (Get-date($_.Installedon)) -gt (get-date).adddays(-30) } | Select-Object HotFixID, InstalledBy, InstalledOn -Last 3
                $log = Get-EventLog -ComputerName $Computer -LogName System -Newest 5000 | Where EventId -in 22,1074 | Select-Object TimeGenerated,EventId,UserName,Message
                $Uptime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)
$out +=              [PSCustomObject]@{
                    ComputerName  = $Computer
                    LastBoot      = $OS.ConvertToDateTime($OS.LastBootUpTime)
                    Uptime        = ([String]$Uptime.Days + " Days " + $Uptime.Hours + " Hours " + $Uptime.Minutes + " Minutes")
                   HotFixID      = $patch.HotFixID
                    InstalledBy   = $patch.InstalledBy
                    InstalledOn   = $patch.InstalledOn
                    TimeGenerated = $log.TimeGenerated
                    EventIDs      = $log.EventId
                    UserName      = $log.UserName
                    Message       = $log.Message
                }
            } catch {
$out +=             [PSCustomObject]@{
                    ComputerName  = $Computer
                    LastBoot      = "Unable to Connect"
                    Uptime        = $_.Exception.Message.Split('.')[0]
                    HotFixID      = "Unable to connect"
                    InstalledBy   = "Unable to connect"
                    InstalledOn   = "Unable to connect"
                    TimeGenerated = "No Output"
                    EventIDs      = "No Output"
                    UserName      = "No Output"
                    Message       = "No Output"
                }
            } finally {
                
                $null = $OS
                $null = $Uptime
            }
        }
       $out | Format-Table -AutoSize


