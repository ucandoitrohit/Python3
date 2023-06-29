#https://sites.google.com/chromium.org/driver/downloads?authuser=0

#$ScriptPath="E:\python_repo\Python3\PowerShell Script\Powershell_Example\Selenium"

#Add-Type -Path "E:\python_repo\Python3\PowerShell Script\Powershell_Example\Selenium\WebDriver.dll"

$Chrome=New-Object OpenQA.Selenium.Chrome.ChromeDriver
$Chrome.Navigate().GoToUrl('https://google.com')
$SearchBox=$Chrome.FindElements([OpenQA.Selenium.By]::XPath('/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea'))
$SearchBox.SendKeys('rohit')


$items=$chrome.FindElements([OpenQA.Selenium.By]::ClassName('sbct'))
$items | gm

$items
Start-Sleep 3
$items.Text
$i=0
foreach($item in $items){
    Write-Host "$i : $($item.Text)"
    $i+=1
}

#$choice=1
#$items[$choice].Click()


#$Chrome.Quit()


