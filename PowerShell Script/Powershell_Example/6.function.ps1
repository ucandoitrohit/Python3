
function Get-Config {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]$Name,
        [Parameter()]
        [ValidateSet("1","2")]        
        [string] $version = "1"
    )
    Write-Host "Fetching the configuration....:$Name .. $version"

}

Get-Config -Name "ansible.example.com" -version "2"