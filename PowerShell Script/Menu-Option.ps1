
###################### Menu Option Script ##############################
function Get-Exit{
$areyousure = read-host "Are you sure you want to exit? (y/n)" 
 if($areyousure -eq "y")
    {
    break;
    }
elseif ($areyousure -eq "n")
    {
    Get-Menu;
    }
    else
    {
    write-host -foregroundcolor red "Invalid Selection"
    Get-Exit
    }
}
cls
Function Get-Menu{
    param (
        [string]$Title = 'SELECT YOUR OPTION FROM BELOW MENU'
    )
    Write-Host "`n"
    Write-Host "|==========================================|" -ForegroundColor Blue
    Write-Host "|" -ForegroundColor Blue -NoNewline;
    Write-host "`t$Title" -ForegroundColor Green -NoNewline;
    Write-host "     |" -ForegroundColor Blue
    Write-Host "|==========================================|" -ForegroundColor Blue

    Write-Host "|                                          |" -ForegroundColor Blue
    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [1]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Copy the 2012 OS Patch File.." -ForegroundColor Magenta -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [2]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Copy the 2012 R2 Patch File.." -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [3]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Copy the 2016 Patch File..   " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [4]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Copy the 2019 Patch File..   " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [5]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Check OS Name..              " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [6]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Check the Remote Path..      " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [7]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Check the Ping Status..      " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [8]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Check the Offline VM Name..  " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|"-ForegroundColor Blue -NoNewline;
    Write-Host "   [9]:" -ForegroundColor Yellow -NoNewline;
    Write-Host " Check the Logs Status..      " -ForegroundColor Magenta  -NoNewline;
    Write-Host "     |" -ForegroundColor Blue

    Write-Host "|                                          |" -ForegroundColor Blue
    Write-Host "|==========================================|" -ForegroundColor Blue
    Write-Host "|                                          |" -ForegroundColor Blue

    Write-Host "|" -ForegroundColor Blue -NoNewline;
    Write-Host "   [Q]: To EXIT.." -ForegroundColor Red -NoNewline;
    Write-Host "                         |" -ForegroundColor Blue
    Write-Host "|                                          |" -ForegroundColor Blue
    Write-Host "|==========================================|" -ForegroundColor Blue
    Write-Host ""
}
#######################################################################################################################################################################################
function Get-Selection{
    While(($input = Read-Host "`nPlease Select the from above option").ToUpper() -ne 'Q' ){
        Switch($input){
            1 {
                if (Test-Path -LiteralPath "$username\ipserver2012.txt"){
                    $2012Path = '2012'
                    $patchfile = "$LocalPatchFolderPath\$2012Path"
                    Write-Host ("`n You Choose Windows Server 2012 Standard...`n") -ForegroundColor Green
                    $Servers = Get-Content "$username\ipserver2012.txt"
                    Get-Patch;
                    Get-Menu;
                   }
                    else
                   {
                    Write-Host ("`n You Choose Windows Server 2012 Standard... but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found`n" -ForegroundColor Red
                    Get-Menu;
                   }
             }
            2 {
                if (Test-Path -LiteralPath "$username\ipserver2012r2.txt"){
                    $2012R2Path = '2012r2'
                    $patchfile = "$LocalPatchFolderPath"
                    Write-Host ("`n You Choose Windows Server 2012 R2 Standard...`n")  -ForegroundColor Green
                    $Servers = Get-Content "$username\ipserver2012r2.txt"
                    Get-Patch;
                    Get-Menu;
                  }
                else
                {
                    Write-Host ("`n You Choose Windows Server 2012 R2 Standard...but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found`n" -ForegroundColor Red
                    Get-Menu;
                }
             }
            3 {
               if (Test-Path -LiteralPath "$username\ipserver2016.txt"){
                    $2016Path = '2016'
                    $patchfile = "$LocalPatchFolderPath\$2016Path"
                    Write-Host ("`n You Choose Windows Server 2016 Standard...`n")  -ForegroundColor Green
                    $Servers = Get-Content "$username\ipserver2016.txt"
                    Get-Patch;
                    Get-Menu;
                }
                else
                {
                    Write-Host ("`n You Choose Windows Server 2016 Standard...but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                    Get-Menu;
                }
            }
            4 {
               if (Test-Path -LiteralPath "$username\ipserver2019.txt"){
                    $2019Path = '2019'
                    $patchfile = "$LocalPatchFolderPath\$2019Path"
                    Write-Host ("`n You Choose Windows Server 2019 R2 Standard...`n")  -ForegroundColor Green
                    $Servers = Get-Content "$username\ipserver2019.txt"
                    Get-Patch;
                    Get-Menu;
                }
                else
                {
                    Write-Host ("`n You Choose Windows Server 2019 R2 Standard...but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                    Get-Menu;
                }
            }
            5{
               if (Test-Path -LiteralPath "$username\ip.txt"){
                    Write-Host ("`n You Choose to Check OS Name..") -ForegroundColor Green
                    $Servers = Get-Content "$username\ip.txt"
                    Get-OSname;
                    Get-Menu;
               }
             else
                {
                    Write-Host ("`n You Choose to Check OS Name..but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                    Get-Menu;
                }
            }
            6{
               if (Test-Path -LiteralPath "$username\ip.txt"){
                   Write-Host ("`n You Choose to Check Remote Path present....`n")  -ForegroundColor Green
                   $Servers = Get-Content "$username\ip.txt"
                   Get-PatchPath;
                   Get-Menu;
                }
                else
                {
                    Write-Host ("`n You Choose to Check Remote Path present....but")  -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                    Get-Menu;
                }
            }
            7{
                if (Test-Path -LiteralPath "$username\ip.txt"){
                    Write-Host ("`n You Choose to Check Online VMs (Ping status)..`n") -ForegroundColor Green
                    $Servers = Get-Content "$username\ip.txt"
                    Get-Ping;
                    Get-Menu;
                }
                else
                {
                    Write-Host ("`n You Choose to Check Online VMs (Ping status)..but") -ForegroundColor Red
                    Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                    Get-Menu;
                }
            }
            8{
                    Get-NoIPPing;
                    Get-Menu;
            }
            9{
                 if (Test-Path -LiteralPath "$username\ipservererrror.txt"){
                     Write-Host ("`n You Choose to Check all Logs ..`n") -ForegroundColor Green
                     Get-Logs;
                     Get-Menu;
                 }
                 else
                 {
                     Write-Host ("`n You Choose to Check all Logs ..`n") -ForegroundColor Red
                     Write-Host "`n IP or Server Name File not found" -ForegroundColor Red
                     Get-Menu;
                 }   
            }
            88{
                if (Test-Path -LiteralPath "$username\ip.txt"){
                    Write-Host ("`n You Choose to Delete the Folder from server..`n") -ForegroundColor Green
                    $Servers = Get-Content "$username\ip.txt"
                    Set-RemovePath
                    Get-Menu;
                }
                else
                {
                   Write-Host ("`n You Choose to Delete the Folder from server..but") -ForegroundColor Red
                   Write-Host "`n  IP or Server Name File not found" -ForegroundColor Red
                   Get-Menu;
                }
            }
            Q { break; }
            default {
            Write-Host ("`nInvalid Choice.. Press ENTER to Continue.") -ForegroundColor Cyan -NoNewline;
            $null = Read-Host
            Get-Menu;
            }
        }
    }
Write-Host "`nYou Press Q - QUIT " -BackgroundColor Red -ForegroundColor White
}

###########################################################################################################################################################################################
function Get-Patch{
$Updates = (Get-ChildItem $patchfile | Where-Object {$_.Extension -eq '.msu'} | Sort-Object {$_.LastWriteTime} )
$totalpatchnumber = $Updates.count
    if(-not($totalpatchnumber -eq 0)){
        Write-Host "`n Patch Found at location $patchfile on $localvm (localhost)`n" -ForegroundColor DarkYellow
            foreach($vm in $Servers){
                if(Test-Connection -ComputerName $vm -Count 1 -Quiet){
                    Write-Host "`n $vm server is online and pinging.." -ForegroundColor Green
                    $RemotePath = Test-Path -Path "\\$vm\$temp\$useronly\$RemotePatchFolderPath"
                        if($RemotePath -eq $True){
                            Write-Host "`n$Remote Path Exists on $vm`n" -ForegroundColor DarkYellow
                                foreach ($kb in $Updates){
                                    Write-Host "`nPlease wait i am copying the patch file on $vm server`n" -ForegroundColo Blue
                                    Write-Host "Source :- $kb.FullName `t Destination:- \\$vm\$temp\$useronly\$RemotePatchFolderPath\"
                                    #Copy-Item  $kb.FullName "\\$vm\$temp\$useronly\$RemotePatchFolderPath\" -Recurse -Force
                                }
                        }
                        else
                        {
                            try{
                                  Write-Host "`n Path NOT exist on $vm.... Now Creating Path`n" -ForegroundColor Magenta
                                  New-Item -Path "\\$vm\$temp\$useronly\$RemotePatchFolderPath" -Type Directory -Force -ErrorAction Stop
                                  Write-Host "`n Path has been created on $vm server" -ForegroundColor Magenta
                                  }
                             catch{
#                                Write-Warning -Message "$vm error occured $error[0].Exception.Message"
                                Write-Host "$vm error occured" $error[0].Exception.Message
                             }
                             Finally{
                             $error.Clear()
                             }
                        }
               }
                else
                {
                 Write-Host "`n $vm is not online`...Please check connection`n" -ForegroundColor Cyan
                } 
            }
    }
    else
    {
     Write-Host "`nNo patch found at location $patchfile on $localvm (localhost)`n" -ForegroundColor Red
    }
}
###################################################################################################################################################################################
Function Get-OSname{
$ipfolder = "$username"
$ipfile = Get-Childitem –Path $username -Include *ipserver* -File -Recurse
if($ipfile.count -ne 0){
    $ipfile | Remove-Item
    Write-Host "`n`nPlease Wait i am processing.....`n" -ForegroundColor DarkCyan
    Start-Sleep(2)
   $count = 0;
    $2012 = 0;
    $2012r2 =  0;
    $2016 = 0;
    $2019 = 0;
    $other = 0;
    $errorvm =0;
   foreach ($vm in $servers){
    try{
        $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $vm  -ErrorAction Stop | Select-Object Name
        $name = (($os.Name).Split(‘|’)[0])
        if($name -eq "Microsoft Windows Server 2016 Standard"){
            Write-Host " $vm `tis $name" -ForegroundColor Yellow
            Write-Output $vm  | Out-File "$username\ipserver2016.txt" -Append
            $2016 +=1; $count +=1;
        }elseif($name -eq "Microsoft Windows Server 2019 Standard"){
            Write-Host " $vm `tis $name" -ForegroundColor Green
            Write-Output $vm  | Out-File "$username\ipserver2019.txt" -Append
            $2019 +=1;$count +=1;
        }elseif ($name -eq "Microsoft Windows Server 2012 R2 Standard"){
            Write-Host " $vm `tis $name" -ForegroundColor Magenta
            Write-Output $vm  | Out-File "$username\ipserver2012r2.txt" -Append
            $2012r2 +=1;$count +=1;
        }elseif ($name -eq "Microsoft Windows Server 2012 Standard"){
            Write-Host " $vm `tis $name" -ForegroundColor Gray
            Write-Output $vm  | Out-File "$username\ipserver2012.txt" -Append
            $2012 +=1;$count +=1;
        }else{
            Write-Host "$vm is $name OS Type" -ForegroundColor DarkYellow
            $other +=1;$count +=1;
        }
    }
    catch{
        Write-Host "`n"
#        Write-Warning -Message "$vm An Error Occured. Please check $vm Server $error[0].Exception.Message`n"
         Write-Host "$vm error occured" $error[0].Exception.Message "`n" -ForegroundColor Red
         Write-Output $vm | Out-File "$username\ipservererrror.txt" -Append
#         Write-Output $vm | Export-Csv "$username\ipservererrror.csv" -NoTypeInformation -Append
         $errorvm +=1; $count +=1;
    }
    Finally{
     $error.Clear()
    }
   }
    Write-Host "`n`n"
    Write-Host "#################################################################################"
    Write-Host "`n Totoal Server:- $count `t" -ForegroundColor cyan
    Write-Host "`n Total Number of Microsoft Windows Server 2012 Standard server are $2012" -ForegroundColor Gray
    Write-Host "`n Total Number of Microsoft Windows Server 2012 R2 Standard server are $2012r2" -ForegroundColor Magenta
    Write-Host "`n Total Number of Microsoft Windows Server 2016 Standard server are $2016" -ForegroundColor Yellow
    Write-Host "`n Total Number of Microsoft Windows Server 2019 Standard server are $2019" -ForegroundColor Green
    Write-Host "`n Total Number of Microsoft Windows 10 Enterprise are $other" -ForegroundColor DarkYellow
    Write-Host "`n Total Number of Server With Error $errorvm" -ForegroundColor Red
    Write-Host "`n#################################################################################"
    Write-Host "`n`n"
    }
#    else
#    {
#    Write-Host ("`n You Choose to Check OS Name..but") -ForegroundColor Red
#    Write-Host "`n`nDid not found the Server or IP Name:-" -ForegroundColor Red
#    }
}
###################################################################################################################################################################################
function Get-PatchPath{
    $on =0;$off=0;$offline1 =0;
        foreach($vm in $Servers){
            if(Test-Connection -ComputerName $vm -Count 1 -Quiet){
                Write-Host "`n $vm server is online and pinging.." -ForegroundColor Green
                $RemotePath = Test-Path -Path "\\$vm\$temp\$useronly\$RemotePatchFolderPath"
                    if($RemotePath -eq $True){
                        Write-Host " Path Exists on $vm`n" -ForegroundColor Blue
                        $on +=1
                    }
                    else
                    {
                        Write-Host " Path NOT exist on $vm.... `n" -ForegroundColor DarkYellow
                        $off +=1
                    }
            }
            else
            {
                Write-Host " `n$vm is not online`...Please check connection`n" -ForegroundColor Cyan
                $offline1 +=1
            }
        }
    Write-host "`n`n"
    Write-Host "Total Path Found:-  $on Server"     -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "Total Path Not Found:- $off Server" -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "Total Offline Server Found:- $offline1 Server" -ForegroundColor White -BackgroundColor DarkYellow
    Write-host "`n`n"
}
###################################################################################################################################################################################
Function Get-Ping{
$ping = 0;
$noping = 0;
    foreach($vm in $Servers){
        if(Test-Connection -ComputerName $vm -Count 1 -Quiet){
            Write-Host "$vm server is online and pinging.." -ForegroundColor Green
            $ping +=1;
        }
        else
        {
            Write-Host "`n $vm is not online`...Please check connection..`n" -ForegroundColor Cyan
            Write-Output $vm | Out-File "$username\ipservernoping.txt" -Append
            $noping +=1;
        }
    }
    Write-host "`n`n"
    Write-Host "Total Online Server Found:-  $ping Server"    -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "Total Offline Server Found:- $noping Server"  -ForegroundColor White -BackgroundColor DarkYellow
    Write-host "`n`n"
}
###################################################################################################################################################################################
Function Get-NoIPPing{
  if(Test-Path -Path "$username\ipservernoping.txt"){
        Write-Host ("`n You Choose to Check Offline VMs (Ping status failed)..`n") -ForegroundColor Gray
         Get-Content "$username\ipservernoping.txt" | Sort-Object -Unique
        }
        else
        {
         Write-Host ("`n You Choose to Check Offline VMs (Ping status failed)..`n") -ForegroundColor Red
         Write-Host " IP or Server Name File not found" -ForegroundColor Red -NoNewline;
         Write-Host " Press 7 to Genreate.." -ForegroundColor Cyan
        }
}
###################################################################################################################################################################################
FUnction Get-Logs{
Get-Content "$username\ipservererrror.txt" | Sort-Object -Unique
}
###################################################################################################################################################################################
function Set-RemovePath{
    $del =0;$nodel=0;$offline2 =0;
        foreach($vm in $Servers){
            if(Test-Connection -ComputerName $vm -Count 1 -Quiet){
                Write-Host "`n $vm server is online and pinging.." -ForegroundColor Green
               $RemotePath = Test-Path -Path "\\$vm\$temp\$useronly\$RemotePatchFolderPath"
                    if($RemotePath -eq $True){
                        $DeletePath = "\\$vm\$temp\$useronly\$RemotePatchFolderPath"
                        #$DeletePath = "\\$vm\$temp\$PatchFolder\"
                        Write-Host "$DeletePath Path Exists on $vm, Now Deleting the Path from Server`n" -ForegroundColor Blue
                        Get-ChildItem $DeletePath  | ForEach { Remove-Item $_.FullName -Force -Recurse }
#                        Remove-Item -Path $DeletePath -Recurse -Force
                        $del +=1
                    }
                    else
                    {
                        Write-Host " Path NOT exist on $vm.... `n" -ForegroundColor DarkYellow
                        $nodel +=1
                    }
            }
            else
            {
                Write-Host " `n$vm is not online`...Please check connection`n" -ForegroundColor Cyan
                $offline2 +=1
            }
        }
    Write-host "`n`n"
    Write-Host "Total Deleted Path Total:-  $del Server"     -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "Total Path Not Found:- $nodel Server" -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "Total Offline Server Found:- $offline2 Server" -ForegroundColor White -BackgroundColor DarkYellow
    Write-host "`n`n"
}
###################################################################################################################################################################################

$temp = "C$\Users"
$dt = get-date -Format dd-MM-yy
$RemotePatchFolderPath = "Patch-Monthly-Folder-$dt"
$localvm = "$env:COMPUTERNAME"
$useronly = "$env:USERNAME\Documents"
$username = "$env:USERPROFILE\Documents"
$LocalPatchFolderPath = "C:\Temp\GOEP-Monthly-Patch-27-04-21\test"
###################################################################################################################################################################################
#$ParentFolder = Read-Host "Enter the Source Patch Location till parent folder only:-"
#if (Test-Path $ParentFolder -IsValid) {
#    Write-Host "`n Your Patch location is $ParentFolder " -ForegroundColor Black -BackgroundColor Yellow
Get-Menu
Get-Selection
#} else {
#    Write-Warning -Message "`nEmpty input."
#}
 