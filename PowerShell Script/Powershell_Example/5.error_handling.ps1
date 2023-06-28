clear
$filepath='E:\python_repo\Python3\PowerShell Script\Powershell_Example\FileNotExists.txt'
$files=Get-ChildItem -Path $filepath
Write-Output "Checking..."
$files.foreach({
    $content=Get-Content -Path $_.FullName
    $content
})

Write-Host "Error handling......"
$filepath='E:\python_repo\Python3\PowerShell Script\Powershell_Example\FileNotExists.txt'
try{
    $files=Get-ChildItem -Path $filepath -ErrorAction Stop
    Write-Output "Checking..."
    $files.foreach({
        $content=Get-Content -Path $_.FullName
        $content
    })
}
catch{
    $_.exception.message
    $error[0].Exception.Message
}
finally{
    Write-Host "Done"
}
