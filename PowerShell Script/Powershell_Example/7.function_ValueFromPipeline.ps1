
function Get-Config {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]$Name,
        [Parameter()]
        [ValidateSet("1","2")]        
        [string] $version = "1"
    )
    begin{
        Write-host "Begining the Configuration..."
    }
    process{
        Write-Host "Fetching the configuration....:$Name .. $version"
    }
    end{
        Write-host "End the Configuration..."

    }    
}
$Name=@("Test1","Test2","Test3")
Write-Host ""
$Name | Get-Config  -version "2"
Write-Host ""
