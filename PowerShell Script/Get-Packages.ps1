Function Get-Packages						
{						
 $date = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")   						
    $ComputerName = Get-Content D:\New-PW\ip.txt						
        Foreach($ServerName in $ComputerName)						
       {						
            $Ping = Test-Connection -ComputerName $ServerName -Count 1 -Quiet						
            If($Ping)						
            {						
                Get-InstalledApp -ComputerName $ServerName						
            }						
            Else						
            {						
                Write-Warning "Failed to connect to computer '$ServerName'."						
            }						
        }						
    }						
						
						
Function Get-InstalledApp($ComputerName)						
{						
    $Output = @()						
    						
         $Key = @("HKLM:\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\*",            						
     "HKLM:\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\*")  						
    						
    $AppInfo = Get-ItemProperty -Path $Key						
						
    Foreach($InstalledApps in $AppInfo)						
    {						
    try{						
        $Caption = [PSCustomObject]@{Computer=$ComputerName;						
                                 DisplayName = $InstalledApps.DisplayName;						
                                 DisplayVersion = $InstalledApps.DisplayVersion;						
                                 Publisher = $InstalledApps.Publisher}						
        $Output += $Caption						
    }						
    catch						
        {						
        $error[0].Exception.Message | Out-File D:\New-PW\error.txt -Append						
        						
        }						
    }$Output | Export-Csv D:\New-PW\InstalledList-$date.csv -NoTypeInformation -Append						
}						
Get-Packages 						