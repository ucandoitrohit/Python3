############## License Report #############

Import-Module C:\Users\rovis\Documents\WindowsPowerShell\Modules\connect.psm1
$ReportTitle = "Licenses Report"
$header1 = @"
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
            font-size: 17px;
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

Connect-TestInfraName
$lmlist = Get-View LicenseManager
$dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
$licenseObj1 =@()
$Report1 =@()
    foreach ($lmview in $lmlist)
    {
        $vcs1 = ([System.uri]$lmview.Client.ServiceUrl).Host
        foreach ($license in $lmview.Licenses)
        {
            $licenseProp = $license.Properties
            $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
            if ($license.Name -eq 'Product Evaluation')
            {
                $expirationDate = 'Evaluation'
            }
            elseif ($null -eq $licenseexpiry)
            {
                $expirationDate = 'Never'
            }
            else
            {
                $expirationDate = $licenseexpiry
            }
            if ($license.Total -eq 0)
            {
                $totalLicenses = 'Unlimited'
            }
            else
            {
                $totalLicenses = $license.Total
            }
            if($license.Used -eq $null){
                $usedLicense = '0'
            }
            else
            {
                $usedLicense = $license.Used
            }
            $licenseObj1 = [PSCustomObject][ordered]@{
                Name =$license.Name
                LicenseKey = $license.LicenseKey
                ExpirationDate = $expirationDate
                ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                Total = $totalLicenses
               Used = $usedLicense
                CostUnit = $license.CostUnit
                vCenter = $vcs1
                }
            $Report1 += $licenseObj1
        }
     }
     $Report1 = $Report1
#############################################################################################################################################################################################
  Connect-AtlasInfraName
    $lmlist = Get-View LicenseManager
    $dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
   $licenseObj2 =@()
   $Report2 =@()
    foreach ($lmview in $lmlist)
    {
        $vcs2 = ([System.uri]$lmview.Client.ServiceUrl).Host
        foreach ($license in $lmview.Licenses)
        {
            $licenseProp = $license.Properties
            $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
            if ($license.Name -eq 'Product Evaluation')
            {
                $expirationDate = 'Evaluation'
            }
            elseif ($null -eq $licenseexpiry)
            {
                $expirationDate = 'Never'
            }
            else
            {
                $expirationDate = $licenseexpiry
            }
            if ($license.Total -eq 0)
            {
                $totalLicenses = 'Unlimited'
            }
            else
            {
                $totalLicenses = $license.Total
            }
            if($license.Used -eq $null){
                $usedLicense = '0'
            }
            else
            {
                $usedLicense = $license.Used
            }
            $licenseObj2 = [PSCustomObject][ordered]@{
                Name =$license.Name
                LicenseKey = $license.LicenseKey
                ExpirationDate = $expirationDate
                ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                Total = $totalLicenses
                Used = $usedLicense
                CostUnit = $license.CostUnit
                vCenter = $vcs2
                }
            $Report2 += $licenseObj2
        }
     }
     $Report2 = $Report2
#############################################################################################################################################################################################
  Connect-TellusInfraName
    $lmlist = Get-View LicenseManager
    $dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
    $licenseObj3 =@()
    $Report3 =@()
    foreach ($lmview in $lmlist)
    {
        $vcs3 = ([System.uri]$lmview.Client.ServiceUrl).Host
        foreach ($license in $lmview.Licenses)
        {
            $licenseProp = $license.Properties
            $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
            if ($license.Name -eq 'Product Evaluation')
            {
                $expirationDate = 'Evaluation'
            }
            elseif ($null -eq $licenseexpiry)
            {
                $expirationDate = 'Never'
            }
            else
            {
                $expirationDate = $licenseexpiry
            }
            if ($license.Total -eq 0)
            {
                $totalLicenses = 'Unlimited'
            }
            else
            {
                $totalLicenses = $license.Total
            }
            if($license.Used -eq $null){
               $usedLicense = '0'
            }
            else
            {
                $usedLicense = $license.Used
            }
            $licenseObj3 = [PSCustomObject][ordered]@{
                Name =$license.Name
                LicenseKey = $license.LicenseKey
                ExpirationDate = $expirationDate
                ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                Total = $totalLicenses
                Used = $usedLicense
                CostUnit = $license.CostUnit
                vCenter = $vcs3
                }
            $Report3 += $licenseObj3
        }
     }
     $Report3 = $Report3
#############################################################################################################################################################################################
  Connect-USInfraName
    $lmlist = Get-View LicenseManager
    $dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
    $licenseObj4 =@()
    $Report4 =@()
    foreach ($lmview in $lmlist)
    {
        $vcs4 = ([System.uri]$lmview.Client.ServiceUrl).Host
        foreach ($license in $lmview.Licenses)
        {
            $licenseProp = $license.Properties
            $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
            if ($license.Name -eq 'Product Evaluation')
            {
                $expirationDate = 'Evaluation'
            }
            elseif ($null -eq $licenseexpiry)
            {
                $expirationDate = 'Never'
            }
            else
            {
                $expirationDate = $licenseexpiry
            }
            if ($license.Total -eq 0)
            {
                $totalLicenses = 'Unlimited'
            }
            else
            {
                $totalLicenses = $license.Total
            }
            if($license.Used -eq $null){
                $usedLicense = '0'
            }
            else
           {
                $usedLicense = $license.Used
            }
           $licenseObj4 = [PSCustomObject][ordered]@{
                Name =$license.Name
                LicenseKey = $license.LicenseKey
                ExpirationDate = $expirationDate
                ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                Total = $totalLicenses
                Used = $usedLicense
                CostUnit = $license.CostUnit
                vCenter = $vcs4
                }
            $Report4 += $licenseObj4
        }
     }
     $Report4 = $Report4
#############################################################################################################################################################################################
  Connect-HKInfraName
    $lmlist = Get-View LicenseManager
    $dt3  =  get-date -uformat '%m-%d-%Y-%H%M%S'
    $licenseObj5 =@()
   $Report5 =@()
   foreach ($lmview in $lmlist)
    {
        $vcs5 = ([System.uri]$lmview.Client.ServiceUrl).Host
        foreach ($license in $lmview.Licenses)
        {
            $licenseProp = $license.Properties
            $licenseexpiry = $licenseProp | Where-Object {$_.Key -eq 'expirationDate'} | Select-Object -ExpandProperty Value
            if ($license.Name -eq 'Product Evaluation')
            {
                $expirationDate = 'Evaluation'
            }
            elseif ($null -eq $licenseexpiry)
            {
                $expirationDate = 'Never'
            }
            else
            {
                $expirationDate = $licenseexpiry
            }
            if ($license.Total -eq 0)
            {
                $totalLicenses = 'Unlimited'
            }
           else
            {
                $totalLicenses = $license.Total
            }
           if($license.Used -eq $null){
                $usedLicense = '0'
            }
            else
            {
                $usedLicense = $license.Used
           }
            $licenseObj5 = [PSCustomObject][ordered]@{
                Name =$license.Name
                LicenseKey = $license.LicenseKey
                ExpirationDate = $expirationDate
                ProductName = ($licenseProp | Where-Object {$_.Key -eq 'ProductName'} | Select-Object -ExpandProperty Value)
                ProductVersion = ($licenseProp | Where-Object {$_.Key -eq 'ProductVersion'} | Select-Object -ExpandProperty Value)
                Total = $totalLicenses
                Used = $usedLicense
                CostUnit = $license.CostUnit
                vCenter = $vcs5
                }
            $Report5 += $licenseObj5
        }
     }
     $Report5 = $Report5
###############################################################################################################################################################################
        $fragments = @()
        $fragments += "<H1>License Report for EUS </H1>"
       $fragments += $Report1 | ConvertTo-Html -Fragment -PreContent "<H2>Test Infra - $vcs1</H2>"
        $fragments += $Report2 | ConvertTo-Html -Fragment -PreContent "<H2>A Infra - $vcs2</H2>"
        $fragments += $Report3 | ConvertTo-Html -Fragment -PreContent "<H2>T Infra -  $vcs3</H2>"
        $fragments += $Report4 | ConvertTo-Html -Fragment -PreContent "<H2>U Infra - $vcs4</H2>"
        $fragments += $Report5 | ConvertTo-Html -Fragment -PreContent "<H2>H Infra - $vcs5</H2>"
        $fragments += "<br></br>"
        $footer = "<html> This auto script is executed by User - <b> Rohit Vishwakarma </b></html>"
#######################################################################################################################
        Write $fragments | clip
        ConvertTo-Html -Head $header1 -Title $ReportTitle -PreContent ($fragments | out-String) -PostContent $footer  | Out-File 'C:\Users\rovis\Documents\SAP-RvTool\Report\EUS\EUS-License\License.htm'

       Invoke-Item 'C:\Users\rovis\Documents\SAP-RvTool\Report\EUS\EUS-License\License.htm'

       Disconnect-TestInfraName
       Disconnect-AtlasInfraName
       Disconnect-TellusInfraName
       Disconnect-HKInfraName
       Disconnect-USInfraName
 