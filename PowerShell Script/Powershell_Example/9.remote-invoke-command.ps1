
$TestBlock={ Write-Host "This is Test Scriptblock" }

$TestBlock

&$TestBlock

Invoke-Command -ComputerName Server01 -FilePath 'E:\python_repo\Python3\PowerShell Script\Powershell_Example\GetHostName.ps1'

Invoke-Command -ComputerName 192.168.0.101 -ScriptBlock { Write-Host "This is running on $(hostname)" }

$localvariable="This is local variable"

Invoke-Command -ComputerName 192.168.0.101 -ScriptBlock { 
    Write-Host "This is running on $(hostname) and $($localvariable)" 
    }

#here the localariable will not print on remote server to print on remote use below

Invoke-Command -ComputerName 192.168.0.101 -ScriptBlock { 
    Write-Host "This is running on $(hostname) and $($args[0])" 
    } -ArgumentList $localvariable


Invoke-Command -ComputerName 192.168.0.101 -ScriptBlock { 
    Write-Host "This is running on $(hostname) and $($using:localvariable)" 
    }


Invoke-Command -ComputerName 192.168.0.101 -ScriptBlock { 
    $test="This is running on $(hostname) and $($using:localvariable)" 
    Write-Host $test
    }


New-PSSession -ComputerName 192.168.0.101
$session=Get-PSSession -ComputerName 192.168.0.101

$session

Invoke-Command -Session $session -ScriptBlock {
    $test="This is running on $(hostname) and $($using:localvariable)" 

}

Invoke-Command -Session $session -ScriptBlock {
    Write-Host $test
}
Disconnect-PSSession -Session $session

Remove-PSSession 

Get-PSSession

Connect-PSSession -Session $session
