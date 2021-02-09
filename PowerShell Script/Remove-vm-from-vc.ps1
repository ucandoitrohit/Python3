$vcentername = @("vcentername")						
$credential = Get-Credential						
Connect-VIserver -Server $vcentername -Credential $credential -Force						
$vms = Get-Content C:\Servername.txt						
foreach($vm in $vms){						
    $check = Get-VM $vm 						
    if($check.PowerState -like "PoweredOn"){						
        write-Host "Please wait for 20 Seconds Server is initiated from ShutDown"						
        stop-VM -VM $vm -Confirm:$false 						
        Start-Sleep -Seconds 10						
        }						
    else						
    {						
        Write-Host "$vm server is deleting please wait...."						
        Remove-VM -VM $vm -DeletePermanently -Confirm:$false -RunAsync						
    }						
						
}						
						