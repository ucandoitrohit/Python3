VM is Down			
			
$vcentername = @("vcenter")			
$credential = Get-Credential			
Connect-VIserver -Server $vcentername -Credential $credential -Force			
$vms = Get-Content C:\Servername.txt			
foreach($vm in $vms){			
    $check = Get-VM $vm | Select Name, PowerState			
    if($check.PowerState -like "PoweredOn"){			
        Wriet-host "$vm is up"			
    }			
    else			
    {			
       Wriet-host "$vm is down"			
    }			
}			