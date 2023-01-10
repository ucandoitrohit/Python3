
cls
Function Get-InstalledPatches{			
$VerbosePreference = 'Continue'			
        $ip =  Get-Content D:\New-PW\Script-to-get-Patceh-on-server\ip2.txt			
        $date = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")   			
        Write-Host ""			
        #$patches = 'KB4012214','KB4598285'			
        $patches = Read-host "`n Enter the Patched Number to find from server"			
        foreach ($comp in $ip){			
        if (Test-Connection -ComputerName $comp -Count 1 -Quiet)			
          {			
           $new =  Get-HotFix -ComputerName $comp | Where {$patches -contains $_.HotFixID} -ErrorAction SilentlyContinue			
            if($new)			
                {			
                $new | Select PSComputerName, InstalledOn, HotFixID, Description			
                 $new | Select PSComputerName, InstalledOn, HotFixID, Description | Export-Csv -NoTypeInformation D:\New-PW\Script-to-get-Patceh-on-server\Installed-Patched-Server-$date.csv -Append			
                 			
                }			
                else			
                {			
                Write-Host "`n"			
                 write-verbose "$patches Patch you are searching is Not installed on $comp Server`n"			
              			
                }			
            }			
            else			
            {			
            Write-Host "`n"			
            Write-Warning "$comp Server is not connected check the network`n"			
            }			
			
            			
        }			
}			
Get-InstalledPatches