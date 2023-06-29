#$Events= Get-EventLog -LogName Security -Source "Microsoft-Windows-Security-Auditing" -EntryType SuccessAudit -After $(Get-Date).AddHours(-1)

#$Events
$Log=[System.Collections.ArrayList]@()

foreach($Event in $Events){
#    foreach($x in 0..$Event.ReplacementStrings.Count){
#        Write-Output "$x - $($Event.ReplacementStrings[$x])"}

    $UserTried  =$Event.ReplacementStrings[1]
    $DomainTried=$Event.ReplacementStrings[2]
    $ClientName =$Event.ReplacementStrings[5]
    $ClientIP   =$Event.ReplacementStrings[7]

    $LogEntry=New-Object -TypeName PSObject
        Add-Member -InputObject $LogEntry -MemberType NoteProperty -Name UserTried  -Value $UserTried
        Add-Member -InputObject $LogEntry -MemberType NoteProperty -Name Domainried -Value $DomainTried
        Add-Member -InputObject $LogEntry -MemberType NoteProperty -Name ClientName -Value $ClientName
        Add-Member -InputObject $LogEntry -MemberType NoteProperty -Name ClientIP   -Value $ClientIP

    [void]$Log.Add($LogEntry)
}

$Log


