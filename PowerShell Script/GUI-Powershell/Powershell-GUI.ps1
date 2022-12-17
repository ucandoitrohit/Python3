 cls
Write-Host "`n`n##########################################################" -ForegroundColor Magenta
Write-Host "`t`t`t`tVMware Automation Tool GUI" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t`t Started `t`t" -ForegroundColor Yellow
Write-Host "##########################################################" -ForegroundColor Magenta
Set-Location "C:\Users\rovis\Documents\SAP-RvTool\My-Script\Working-Script\Powershell-GUI"
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
. .\SubFunction-testing.ps1
Get-globalVariable
Set-Location "C:\users\rovis"
$Form1 = New-Object System.Windows.Forms.Form

$Form2 = New-Object System.Windows.Forms.Form

$SelectHost = New-Object System.Windows.Forms.Button

$HostNameCombo = New-Object System.Windows.Forms.ComboBox

$CancelSensor = New-Object System.Windows.Forms.Button

$HostSensorLabel = New-Object System.Windows.Forms.Label

$HostSensorLabelName = New-Object System.Windows.Forms.Label

$SelectHostSensorLabel2 = New-Object System.Windows.Forms.Label

$SelectHostSensorLabelName = New-Object System.Windows.Forms.Label

$HWSensormailCheckBox = New-Object System.Windows.Forms.CheckBox

$HWSensorMailSent = New-Object System.Windows.Forms.Label

 

 

$menuStrip1 = New-Object System.Windows.Forms.MenuStrip

$connectionToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

$sAPToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

$gOEPToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

$helpToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

$closeToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

$aboutToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem

 

 

################################## Tab Control ########################

$Connection = New-Object System.Windows.Forms.TabPage

$Setting = New-Object System.Windows.Forms.TabPage

$settingmore = New-Object System.Windows.Forms.TabPage

$Email = New-Object System.Windows.Forms.TabPage

$Output = New-Object System.Windows.Forms.TabPage

$objStatusBar = New-Object System.Windows.Forms.StatusBar

 

######################## Tab Control 1 #########################################

######################## Connection    ####################################

 

$tabControl1 = New-Object System.Windows.Forms.TabControl

$groupBox2 = New-Object System.Windows.Forms.GroupBox

$gbcredentials = New-Object System.Windows.Forms.GroupBox

 

$groupBox3 = New-Object System.Windows.Forms.GroupBox

$groupBox4 = New-Object System.Windows.Forms.GroupBox

$groupBox11 = New-Object System.Windows.Forms.GroupBox

$groupBox12 = New-Object System.Windows.Forms.GroupBox

 

$tserver = New-Object System.Windows.Forms.ComboBox

$tusername = New-Object System.Windows.Forms.TextBox

$tpassword = New-Object System.Windows.Forms.TextBox

$bConnect = New-Object System.Windows.Forms.Button

$ddisconnect = New-Object System.Windows.Forms.Button

$button3 = New-Object System.Windows.Forms.Button

$lserver = New-Object System.Windows.Forms.Label

$lusername = New-Object System.Windows.Forms.Label

$lpassword = New-Object System.Windows.Forms.Label

$lconnected = New-Object System.Windows.Forms.Label

$ldisconnected = New-Object System.Windows.Forms.Label

$bcancel = New-Object System.Windows.Forms.Button

$lstatus = New-Object System.Windows.Forms.Label

 

$lservername = New-Object System.Windows.Forms.Label

$llogon = New-Object System.Windows.Forms.Label

$ldatacenter = New-Object System.Windows.Forms.Label

$lcluster = New-Object System.Windows.Forms.Label

$lhost = New-Object System.Windows.Forms.Label

 

 

$outputservername = New-Object System.Windows.Forms.Label

$outputhost = New-Object System.Windows.Forms.Label

$outputlogon = New-Object System.Windows.Forms.Label

$outputdatacenter = New-Object System.Windows.Forms.Label

$outputcluster = New-Object System.Windows.Forms.Label

 

$lvCenterName = New-Object System.Windows.Forms.Label

$lUserConnect = New-Object System.Windows.Forms.Label

$lDomainName = New-Object System.Windows.Forms.Label

$lVersionName = New-Object System.Windows.Forms.Label

$lBuildVersion = New-Object System.Windows.Forms.Label

 

 

$ovCenterName = New-Object System.Windows.Forms.Label

$oUserConnect = New-Object System.Windows.Forms.Label

$oDOmainName = New-Object System.Windows.Forms.Label

$oVersionName = New-Object System.Windows.Forms.Label

$oBuildversion = New-Object System.Windows.Forms.Label

 

 

#################################################################################

############################ Tab Control 2 ############################################

############################ Setting #####################################

 

$groupBox5 = New-Object System.Windows.Forms.GroupBox

$groupBox6 = New-Object System.Windows.Forms.GroupBox

$groupBox7 = New-Object System.Windows.Forms.GroupBox

$groupBox8 = New-Object System.Windows.Forms.GroupBox

$vmmailcheckbox = New-Object System.Windows.Forms.CheckBox

$brun = New-Object System.Windows.Forms.Button

$rmail = New-Object System.Windows.Forms.Label

 

 

$radioButton1 = New-Object System.Windows.Forms.RadioButton

$radioButton2 = New-Object System.Windows.Forms.RadioButton

$radioButton3 = New-Object System.Windows.Forms.RadioButton

$radioButton4 = New-Object System.Windows.Forms.RadioButton

$radioButton5 = New-Object System.Windows.Forms.RadioButton

$TemplateRadio = New-Object System.Windows.Forms.RadioButton

 

 

 

$EsxiHostDetails = New-Object System.Windows.Forms.RadioButton

$EsxiHostStatus = New-Object System.Windows.Forms.RadioButton

$dsusage = New-Object System.Windows.Forms.RadioButton

$dsvsanusage = New-Object System.Windows.Forms.RadioButton

$esxicpuutilization = New-Object System.Windows.Forms.RadioButton

$esximemoryutilization = New-Object System.Windows.Forms.RadioButton

 

 

$VCEvents = New-Object System.Windows.Forms.RadioButton

$CDPDetails = New-Object System.Windows.Forms.RadioButton

$HALogs = New-Object System.Windows.Forms.RadioButton

$license = New-Object System.Windows.Forms.RadioButton

$snapshotcreate = New-Object System.Windows.Forms.RadioButton

$snapshotdelete = New-Object System.Windows.Forms.RadioButton

 

 

$ip = New-Object System.Windows.Forms.TextBox

$attach2 = New-Object System.Windows.Forms.Button

 

 

 

#################################################################################

############################ Tab Control 3 ############################################

############################ Email #####################################

 

$groupBox9 = New-Object System.Windows.Forms.GroupBox

$groupBox10 = New-Object System.Windows.Forms.GroupBox

$label18 = New-Object System.Windows.Forms.Label

$textBox4 = New-Object System.Windows.Forms.TextBox

$textBox5 = New-Object System.Windows.Forms.TextBox

$textBox6 = New-Object System.Windows.Forms.TextBox

$textBox7 = New-Object System.Windows.Forms.TextBox

$textBox8 = New-Object System.Windows.Forms.TextBox

$textBox9 = New-Object System.Windows.Forms.TextBox

 

$lsubject = New-Object System.Windows.Forms.Label

 

$lto = New-Object System.Windows.Forms.Label

$lfrom = New-Object System.Windows.Forms.Label

$lport = New-Object System.Windows.Forms.Label

$label17 = New-Object System.Windows.Forms.Label

 

$bSend = New-Object System.Windows.Forms.Button

$attach = New-Object System.Windows.Forms.Button

 

 

$label20 =  New-Object System.Windows.Forms.Label

 

#################################################################################

############################ Tab Control 4 ############################################

############################ Setting More #####################################

 

$VirtualCenterGroup = New-Object System.Windows.Forms.GroupBox

$ESXiHostsGroup = New-Object System.Windows.Forms.GroupBox

$VirtualMachineGroup = New-Object System.Windows.Forms.GroupBox

$RunButtonSettingMore = New-Object System.Windows.Forms.Button

$SettingMoreMailCheckBox = New-Object System.Windows.Forms.CheckBox

$SettingMoreMailLabel = New-Object System.Windows.Forms.Label

 

 

$VMCountperHost = New-Object System.Windows.Forms.RadioButton

$VMCountperDatastore = New-Object System.Windows.Forms.RadioButton

$VirtualSwitch = New-Object System.Windows.Forms.RadioButton

$VirtualPortgroup = New-Object System.Windows.Forms.RadioButton

 

$VMsDeatilsFull = New-Object System.Windows.Forms.RadioButton

$VMsConnectedCDRom = New-Object System.Windows.Forms.RadioButton

$VMsConnectedFloppy = New-Object System.Windows.Forms.RadioButton

$VMsConnectedDSISO = New-Object System.Windows.Forms.RadioButton

 

$ThinProvisioned = New-Object System.Windows.Forms.RadioButton

$HostHwsensor = New-Object System.Windows.Forms.RadioButton

$DRSRulewithCluster = New-Object System.Windows.Forms.RadioButton

$vSANStoragePolicyDetails = New-Object System.Windows.Forms.RadioButton

 

 

$ThickProvisioned = New-Object System.Windows.Forms.RadioButton

$LogHost = New-Object System.Windows.Forms.RadioButton

 

 

 

 

 

#################################################################################

############################ Tab Control 5 ############################################

############################ Output #####################################

 

$dataGridView1 = New-Object System.Windows.Forms.DataGridView

$UserInput = New-Object System.Windows.Forms.GroupBox

$dataGridResult = New-Object System.Windows.Forms.GroupBox

$Filename2 = New-Object System.Windows.Forms.TextBox

$buttonFileName = New-Object System.Windows.Forms.Button

$Pingb = New-Object System.Windows.Forms.Button

 

$VMOptionGrp = New-Object System.Windows.Forms.GroupBox

$vmpingradioButton1 = New-Object System.Windows.Forms.RadioButton

$vmosradioButton1 = New-Object System.Windows.Forms.RadioButton

 

 

 

 

 

#

# menuStrip1

#

$menuStrip1.Items.AddRange(@(

$connectionToolStripMenuItem,

$helpToolStripMenuItem))

$menuStrip1.Location = New-Object System.Drawing.Point(0, 0)

$menuStrip1.Name = "menuStrip1"

$menuStrip1.Size = New-Object System.Drawing.Size(485, 24)

$menuStrip1.TabIndex = 0

$menuStrip1.Text = "menuStrip1"

#

# connectionToolStripMenuItem

#

$connectionToolStripMenuItem.DropDownItems.AddRange(@(

$sAPToolStripMenuItem,

$gOEPToolStripMenuItem))

$connectionToolStripMenuItem.Name = "connectionToolStripMenuItem"

$connectionToolStripMenuItem.Size = New-Object System.Drawing.Size(81, 20)

$connectionToolStripMenuItem.Text = "Connection"

#

# sAPToolStripMenuItem

#

$sAPToolStripMenuItem.Name = "sAPToolStripMenuItem"

$sAPToolStripMenuItem.Size = New-Object System.Drawing.Size(180, 22)

$sAPToolStripMenuItem.Text = "SAP"

#

# gOEPToolStripMenuItem

#

$gOEPToolStripMenuItem.Name = "gOEPToolStripMenuItem"

$gOEPToolStripMenuItem.Size = New-Object System.Drawing.Size(180, 22)

$gOEPToolStripMenuItem.Text = "GOEP"

#

# helpToolStripMenuItem

#

$helpToolStripMenuItem.DropDownItems.AddRange(@(

$closeToolStripMenuItem,

$aboutToolStripMenuItem))

$helpToolStripMenuItem.Name = "helpToolStripMenuItem"

$helpToolStripMenuItem.Size = New-Object System.Drawing.Size(44, 20)

$helpToolStripMenuItem.Text = "Help"

#

# closeToolStripMenuItem

#

$closeToolStripMenuItem.Name = "closeToolStripMenuItem"

$closeToolStripMenuItem.Size = New-Object System.Drawing.Size(180, 22)

$closeToolStripMenuItem.Text = "Close"

#

# aboutToolStripMenuItem

#

$aboutToolStripMenuItem.Name = "aboutToolStripMenuItem"

$aboutToolStripMenuItem.Size = New-Object System.Drawing.Size(180, 22)

$aboutToolStripMenuItem.Text = "Setting"

#

# tabControl1

#

$tabControl1.Controls.Add($Connection)

$tabControl1.Controls.Add($Setting)

$tabControl1.Controls.Add($Email)

$tabControl1.Controls.Add($settingmore)

$tabControl1.Controls.Add($Output)

 

 

$tabControl1.Location = New-Object System.Drawing.Point(21, 36)

$tabControl1.Name = "tabControl1"

$tabControl1.SelectedIndex = 0

$tabControl1.Size = New-Object System.Drawing.Size(442, 430)

$tabControl1.TabIndex = 1

#

# Connection

#

$Connection.BackColor = [System.Drawing.Color]::White

$Connection.Controls.Add($groupBox2)

$Connection.Controls.Add($gbcredentials)

$Connection.Location = New-Object System.Drawing.Point(4, 22)

$Connection.Name = "Connection"

$Connection.Padding = New-Object System.Windows.Forms.Padding(3)

$Connection.Size = New-Object System.Drawing.Size(434, 392)

$Connection.TabIndex = 0

$Connection.Text = "Connection"

#

# Setting

#

$Setting.Controls.Add($groupBox8)

$Setting.Controls.Add($groupBox7)

$Setting.Controls.Add($groupBox6)

$Setting.Controls.Add($groupBox5)

$Setting.Controls.Add($brun)

$Setting.Controls.Add($vmmailcheckbox)

 

$Setting.Location = New-Object System.Drawing.Point(4, 22)

$Setting.Name = "Setting"

$Setting.Padding = New-Object System.Windows.Forms.Padding(3)

$Setting.Size = New-Object System.Drawing.Size(434, 392)

$Setting.TabIndex = 1

$Setting.Text = "Setting"

$Setting.UseVisualStyleBackColor = $true

#

# gbcredentials

#

$gbcredentials.Controls.Add($lstatus)

$gbcredentials.Controls.Add($ldisconnected)

$gbcredentials.Controls.Add($lconnected)

$gbcredentials.Controls.Add($lpassword)

$gbcredentials.Controls.Add($lusername)

$gbcredentials.Controls.Add($lserver)

$gbcredentials.Controls.Add($button3)

$gbcredentials.Controls.Add($ddisconnect)

$gbcredentials.Controls.Add($bConnect)

$gbcredentials.Controls.Add($tpassword)

$gbcredentials.Controls.Add($tusername)

$gbcredentials.Controls.Add($tserver)

$gbcredentials.Location = New-Object System.Drawing.Point(11, 9)

$gbcredentials.Name = "gbcredentials"

$gbcredentials.Size = New-Object System.Drawing.Size(408, 161)

$gbcredentials.TabIndex = 0

$gbcredentials.TabStop = $false

$gbcredentials.Text = "Crdential"

#

# tserver

#

$tserver.Location = New-Object System.Drawing.Point(122, 20)

$tserver.Name = "tserver"

$tserver.Size = New-Object System.Drawing.Size(163, 20)

$tserver.TabIndex = 0

$tserver.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList;

 

#$tserver.Text ='sp1secc1t-infra-vc'

 

$Servername = @("Server-A")

foreach($Detail in $Servername){

    $tserver.Items.Add($Detail) | Out-Null

 

}

 

 

#

# tusername

#

$tusername.Location = New-Object System.Drawing.Point(122, 47)

$tusername.Name = "tusername"

$tusername.Size = New-Object System.Drawing.Size(163, 20)

$tusername.TabIndex = 1

$tusername.Text = 'admrovis@hm.com'

 

#

# tpassword

#

$tpassword.Location = New-Object System.Drawing.Point(122, 77)

$tpassword.Name = "tpassword"

$tpassword.Size = New-Object System.Drawing.Size(163, 20)

$tpassword.TabIndex = 2

$tpassword.Text = 'Maildev#421'

$tpassword.UseSystemPasswordChar = $true

 

#

# bConnect

#

$bConnect.Location = New-Object System.Drawing.Point(307, 14)

$bConnect.Name = "bConnect"

$bConnect.Size = New-Object System.Drawing.Size(75, 23)

$bConnect.TabIndex = 3

$bConnect.Text = "Connect"

$bConnect.UseVisualStyleBackColor = $true

$bConnect.Add_Click($connect_server)

 

$connect_server={

 

$objStatusBar.Text = "Checking status..."

$lconnected.Text = ""

$ldisconnected.Text = ""

$ldisconnected.Visible = $false

$lconnected.Visible = $true

 

get-Connectionvc

 

 

 

}

 

## ddisconnect

#

$ddisconnect.Location = New-Object System.Drawing.Point(307, 43)

$ddisconnect.Name = "ddisconnect"

$ddisconnect.Size = New-Object System.Drawing.Size(75, 23)

$ddisconnect.TabIndex = 4

$ddisconnect.Text = "Disconnect"

$ddisconnect.UseVisualStyleBackColor = $true

$ddisconnect.Visible = $false

$ddisconnect.Add_Click($disconnect_server)

 

$disconnect_server={

  $objStatusBar.Text = "Checking status..."

  $ldisconnected.Text = ""

  $ldisconnected.Visible = $true

      if($tserver.Text -ne ''){

        try{

            Disconnect-VIServer -Server $tserver.Text   -Confirm:$false -ErrorAction Stop

                if($? -eq $true){

                    $ldisconnected.BackColor = "Transparent"

                    $ldisconnected.ForeColor = "Red"

                    $ldisconnected.Text = "Disconnected"

                    $lconnected.Visible = $false

                    $button3.Visible = $false

                    $bConnect.Visible = $true

                    $tusername.ReadOnly = $false

                    $tpassword.ReadOnly = $false

 

                    Clear-Output

                }

                else

                {

                    $lconnected.Visible = $false

                    $ldisconnected.Text ="Could not found vCenter Name"

                    $tusername.ReadOnly = $false

                    $tpassword.ReadOnly = $false

 

                }

        }

         Catch [VMware.VimAutomation.Sdk.Types.V1.ErrorHandling.VimException.VimException] {

            if($error[0].Exception.ErrorCategory -eq 'objectNotFound'){

                [System.Windows.Forms.MessageBox]::Show("Please select the connected vCenter...")

            }

        }

    }

    else

    {

        $lconnected.Visible = $false

        $ldisconnected.ForeColor = "Red"

        $ldisconnected.Text = "Server Name is blank.."

    }

$objStatusBar.Text = "Disconnected.."

}

<#

try {

    DisConnect-VIServer -Server * -ErrorAction Stop

}

Catch [VMware.VimAutomation.Sdk.Types.V1.ErrorHandling.VimException.VimException] {

    if($error[0].Exception.ErrorCategory -eq 'objectNotFound'){

        Write-Host "Server not found"

    }

}#>

 

#

# button3

#

$button3.Location = New-Object System.Drawing.Point(307, 70)

$button3.Name = "button3"

$button3.Size = New-Object System.Drawing.Size(75, 23)

$button3.TabIndex = 5

$button3.Text = "Execute"

$button3.UseVisualStyleBackColor = $true

$button3.Visible = $false

 

$button3.Add_Click($execute)

 

$execute={

$objStatusBar.Text = "Fetching....."

    Get-VcenterType

 

    Get-OSType

 

$objStatusBar.Text = "Done.."

 

 

}

 

 

#

# lserver

#

$lserver.AutoSize = $true

$lserver.Location = New-Object System.Drawing.Point(20, 26)

$lserver.Name = "lserver"

$lserver.Size = New-Object System.Drawing.Size(38, 13)

$lserver.TabIndex = 6

$lserver.Text = "Server"

#

# lusername

#

$lusername.AutoSize = $true

$lusername.Location = New-Object System.Drawing.Point(20, 53)

$lusername.Name = "lusername"

$lusername.Size = New-Object System.Drawing.Size(55, 13)

$lusername.TabIndex = 7

$lusername.Text = "Username"

#

# lpassword

#

$lpassword.AutoSize = $true

$lpassword.Location = New-Object System.Drawing.Point(20, 80)

$lpassword.Name = "lpassword"

$lpassword.Size = New-Object System.Drawing.Size(53, 13)

$lpassword.TabIndex = 8

$lpassword.Text = "Password"

#

# lconnected

#

$lconnected.AutoSize = $true

$lconnected.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lconnected.ForeColor = [System.Drawing.Color]::FromArgb(0,192,0)

$lconnected.Location = New-Object System.Drawing.Point(91, 119)

$lconnected.Name = "lconnected"

$lconnected.Size = New-Object System.Drawing.Size(24, 13)

$lconnected.TabIndex = 9

$lconnected.BackColor = "Transparent"

$lconnected.Text = ""

#

# ldisconnected

#

$ldisconnected.AutoSize = $true

$ldisconnected.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$ldisconnected.ForeColor = [System.Drawing.Color]::Red

$ldisconnected.Location = New-Object System.Drawing.Point(185, 119)

$ldisconnected.Name = "ldisconnected"

$ldisconnected.Size = New-Object System.Drawing.Size(24, 13)

$ldisconnected.TabIndex = 10

$ldisconnected.BackColor = "Transparent"

$ldisconnected.Text = ""

#

# bcancel

#

$bcancel.Location = New-Object System.Drawing.Point(358, 472)

$bcancel.Name = "bcancel"

$bcancel.Size = New-Object System.Drawing.Size(75, 23)

$bcancel.TabIndex = 2

$bcancel.Text = "Cancel"

$bcancel.UseVisualStyleBackColor = $true

$bcancel.DialogResult = 'Cancel'

$bcancel.Add_Click($disconn)

 

$disconn={

 

if($Global:con.IsConnected){

 

$oReturn=[System.Windows.Forms.MessageBox]::Show("You are connected to vCenter.. Want to Disconnect..!","Connected Established",[System.Windows.Forms.MessageBoxButtons]::YesNO)

switch ($oReturn){

    "Yes" {

                write-host "You pressed Yes" -ForegroundColor Green

                Disconnect-VIServer -Server $tserver.Text   -Confirm:$false -ErrorAction Stop

                $form1.Close()

    }

    "No" {

            write-host "You pressed No" -ForegroundColor Red

 

#        $Form1.ShowDialog()

    }

}

 

}

 

 

}

#

#

# brun

#

 

$brun.Location = New-Object System.Drawing.Point(150,365)

$brun.Name = "brun"

$brun.Size = New-Object System.Drawing.Size(105, 35)

$brun.TabIndex = 3

$brun.Text = "Run!"

$brun.UseVisualStyleBackColor = $true

$brun.Font = [System.Drawing.Font]::new('Segoe UI', 16, [System.Drawing.FontStyle]::Bold)

$brun.Add_Click($daily_health_check)

 

$daily_health_check={

$objStatusBar.Text = "Please wait work is in Progress..."

$rmail.Visible = $false

    if($radioButton1.Checked -eq $true){

        $Global:mailSubject = $radioButton1.Text

        $objStatusBar.Text = "Generating Daily Health Check Report! Please Wait...."

        [System.Windows.Forms.MessageBox]::Show("You Choose! Daily Health Report...")

        if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

               if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                     Get-DailyHealth  

                    $radioButton1.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $radioButton1.Checked = $false

                       $vmmailcheckbox.Checked = $false

                      

                }

           }

           else

           {

                       [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                       $radioButton1.Checked = $false

                       $vmmailcheckbox.Checked = $false

           }

      }

    elseif($radioButton2.Checked -eq $true){

           $Global:mailSubject = $radioButton2.Text

           $objStatusBar.Text ="Generating RvTools Report Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! RvTool Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        Get-RvTools

                       

                        $radioButton2.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendAttachReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

 

                    }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $radioButton2.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $radioButton2.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

        }

    elseif($radioButton3.Checked -eq $true){

    $Global:mailSubject = $radioButton3.Text

        $objStatusBar.Text ="Generating Snapshot Report Please Wait.."

        [System.Windows.Forms.MessageBox]::Show("You Choose! Snapahot Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                    Get-SnapshotReport

                    $radioButton3.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

#                       [System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

 

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $radioButton3.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $radioButton3.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($radioButton4.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $radioButton4.Text

        $objStatusBar.Text ="Generating VMware Tools Report Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! VMware Tools Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                    Get-vmToolsReport

                    $radioButton4.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

#                        [System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $radioButton4.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $radioButton4.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($radioButton5.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $radioButton5.Text

        $objStatusBar.Text ="Generating VMs Count by OS! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! VMs Count by OS..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                    Get-VMbyOS

                    $radioButton5.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

#                        [System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $radioButton5.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $radioButton5.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($TemplateRadio.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $TemplateRadio.Text

        $objStatusBar.Text ="Generating Template Details! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! Template..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                    Get-VMbyOS

                    $TemplateRadio.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-TemplateName

                        Write-Host "Mail Send..." -ForegroundColor Cyan

#                        [System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $TemplateRadio.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $TemplateRadio.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

 

    elseif($esxicpuutilization.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $esxicpuutilization.Text

   

        $objStatusBar.Text ="Generating ESXi CPU Utilization with Summary! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! ESXi CPU Utilization..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

               $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                    $Global:VCStatus = $daily

                    Get-CPUEsxiUtiization

                    $esxicpuutilization.Checked = $false

                    if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $esxicpuutilization.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $esxicpuutilization.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($esximemoryutilization.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $esximemoryutilization.Text

        $objStatusBar.Text ="Generating ESXi Memory Utilization with Summary! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! ESXi Memory Utilization..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-MemoryEsxiUtiization

                        $esximemoryutilization.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $esximemoryutilization.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $esximemoryutilization.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($EsxiHostDetails.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $EsxiHostDetails.Text

        $objStatusBar.Text ="Generating Esxi Host Details! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! ESXi Host Details..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-EsxiHostDetails

                        $EsxiHostDetails.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $EsxiHostDetails.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $EsxiHostDetails.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($EsxiHostStatus.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $EsxiHostStatus.Text

        $objStatusBar.Text ="Generating ESXi Host Status! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! ESXi Host Status..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-EsxiHostStatus

                        $EsxiHostStatus.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $EsxiHostStatus.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $EsxiHostStatus.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($dsusage.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $dsusage.Text

        $objStatusBar.Text ="Generating Datastore usage! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! Datastore Usage..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-DatastoreUtilization

                        $dsusage.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $dsusage.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $dsusage.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($dsvsanusage.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $dsvsanusage.Text

        $objStatusBar.Text ="Generating vSAN Datastore usage! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! vSAN Datastore Usage..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-vSANDatastoreUsagae

                        $dsvsanusage.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $dsvsanusage.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $dsvsanusage.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($VCEvents.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $VCEvents.Text

        $objStatusBar.Text ="Generating vCenter Events Overall Status! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! vCenter Events Alarms Details..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VCEventsAlarms

                        $VCEvents.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VCEvents.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VCEvents.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

 

    elseif($CDPDetails.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $CDPDetails.Text

        $objStatusBar.Text ="Generating Cisco Discovery Protocol Report! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! Cisco Discovery Protocol Details..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-CDPDetails

                        $CDPDetails.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $CDPDetails.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $CDPDetails.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($HALogs.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $HALogs.Text

        $objStatusBar.Text ="Generating HA Logs Report! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! HA Logs Report Usage..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-HALogsStatus

                        $HALogs.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $HALogs.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $HALogs.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($license.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $license.Text

        $objStatusBar.Text ="Generating License Usage! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! License Usage..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-LicenseReport

                        $license.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $license.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $license.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }

    elseif($snapshotcreate.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $snapshotcreate.Text

        $objStatusBar.Text ="Creating Snapshot of VMs! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! Snapshot Creation..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Set-SnapshotCreation

                        $snapshotcreate.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

#                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $snapshotcreate.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $snapshotcreate.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }   

    elseif($snapshotdelete.Checked -eq $true){

    $rmail.Text = ''

    $Global:mailSubject = $snapshotdelete.Text

        $objStatusBar.Text ="Deleting  Snapshot of VMs! Please Wait....."

        [System.Windows.Forms.MessageBox]::Show("You Choose ! Snapshot deletion..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                $Global:daily = $Global:con.IsConnected

                $Global:vc = $Global:con

                   if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Set-SnapshotDeletion

                        $snapshotdelete.Checked = $false

                   if($vmmailcheckbox.Checked -eq $true){

#                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        #[System.Windows.Forms.MessageBox]::Show("Mail Send..")

                        Write-Host "Done" -ForegroundColor Yellow

                        $vmmailcheckbox.Checked = $false

                        $rmail.Visible =$true

                        $rmail.Text ="Mail Send.."

                    }

                   }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $snapshotdelete.Checked = $false

                       $vmmailcheckbox.Checked = $false

                }

       }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $snapshotdelete.Checked = $false

                   $vmmailcheckbox.Checked = $false

           }

    }   

    else

    {

        [System.Windows.Forms.MessageBox]::Show("You have not selected any option")

        $vmmailcheckbox.Checked = $false

    }

        

$objStatusBar.Text = "Done.."

 

}

 

#

## objStatusBar

#

#

$objStatusBar.Name = "statusBar"

$objStatusBar.Text = "Ready"

$Form1.Controls.Add($objStatusBar)

            

#

#

# lstatus

#

$lstatus.AutoSize = $true

$lstatus.Location = New-Object System.Drawing.Point(20, 119)

$lstatus.Name = "lstatus"

$lstatus.Size = New-Object System.Drawing.Size(37, 13)

$lstatus.TabIndex = 11

$lstatus.Text = "Status"

#

# rmail

#

$rmail.AutoSize = $true

$rmail.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$rmail.ForeColor = [System.Drawing.Color]::FromArgb(0,192,0)

$rmail.Location = New-Object System.Drawing.Point(60, 475)

$rmail.Name = "lconnected"

$rmail.Size = New-Object System.Drawing.Size(24, 13)

$rmail.TabIndex = 9

$rmail.BackColor = "Transparent"

$rmail.Text = ""

#

# groupBox2

#

$groupBox2.Controls.Add($groupBox4)

$groupBox2.Controls.Add($groupBox3)

$groupBox2.Controls.Add($groupBox11)

$groupBox2.Controls.Add($groupBox12)

 

$groupBox2.Location = New-Object System.Drawing.Point(18, 204)

$groupBox2.Name = "groupBox2"

$groupBox2.Size = New-Object System.Drawing.Size(400, 174)

$groupBox2.TabIndex = 1

$groupBox2.TabStop = $false

$groupBox2.Text = "General Information"

#

# groupBox3

#

$groupBox3.Controls.Add($lhost)

$groupBox3.Controls.Add($lcluster)

$groupBox3.Controls.Add($ldatacenter)

$groupBox3.Controls.Add($llogon)

$groupBox3.Controls.Add($lservername)

$groupBox3.Location = New-Object System.Drawing.Point(10, 19)

$groupBox3.Name = "groupBox3"

$groupBox3.Size = New-Object System.Drawing.Size(99, 144)

$groupBox3.TabIndex = 0

$groupBox3.TabStop = $false

#

# groupBox4

#

$groupBox4.Controls.Add($outputcluster)

$groupBox4.Controls.Add($outputdatacenter)

$groupBox4.Controls.Add($outputlogon)

$groupBox4.Controls.Add($outputhost)

$groupBox4.Controls.Add($outputservername)

$groupBox4.Location = New-Object System.Drawing.Point(115, 19)

$groupBox4.Name = "groupBox4"

$groupBox4.Size = New-Object System.Drawing.Size(83, 144)

$groupBox4.TabIndex = 1

$groupBox4.TabStop = $false

#

#

# groupBox11

#

$groupBox11.Controls.Add($lvCenterName)

$groupBox11.Controls.Add($lUserConnect)

$groupBox11.Controls.Add($lDomainName)

$groupBox11.Controls.Add($lVersionName)

$groupBox11.Controls.Add($lBuildversion)

$groupBox11.Location = New-Object System.Drawing.Point(200, 19)

$groupBox11.Name = "groupBox11"

$groupBox11.Size = New-Object System.Drawing.Size(99, 144)

$groupBox11.TabIndex = 11

$groupBox11.TabStop = $false

#

#

#

#

# groupBox12

#

$groupBox12.Controls.Add($ovCenterName)

$groupBox12.Controls.Add($oUserConnect)

$groupBox12.Controls.Add($oDomainName)

$groupBox12.Controls.Add($oVersionName)

$groupBox12.Controls.Add($oBuildversion)

 

$groupBox12.Location = New-Object System.Drawing.Point(300, 19)

$groupBox12.Name = "groupBox12"

$groupBox12.Size = New-Object System.Drawing.Size(95, 144)

$groupBox12.TabIndex = 1

$groupBox12.TabStop = $false

#

# lvCenterName

 

#

$lvCenterName.AutoSize = $true

$lvCenterName.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lvCenterName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lvCenterName.Location = New-Object System.Drawing.Point(5, 16)

$lvCenterName.Name = "lvCenterName"

$lvCenterName.Size = New-Object System.Drawing.Size(46, 15)

$lvCenterName.TabIndex = 0

$lvCenterName.Text = "vCenterName"

#

 

# lUserConnect

 

#

$lUserConnect.AutoSize = $true

$lUserConnect.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lUserConnect.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lUserConnect.Location = New-Object System.Drawing.Point(5, 43)

$lUserConnect.Name = "lUserConnect"

$lUserConnect.Size = New-Object System.Drawing.Size(46, 15)

$lUserConnect.TabIndex = 0

$lUserConnect.Text = "Username"

#

#

## lDomainName

 

#

$lDomainName.AutoSize = $true

$lDomainName.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lDomainName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lDomainName.Location = New-Object System.Drawing.Point(5, 66)

$lDomainName.Name = "lDomainName"

$lDomainName.Size = New-Object System.Drawing.Size(46, 15)

$lDomainName.TabIndex = 0

$lDomainName.Text = "Domain"

#

 

# lVersionName

 

#

$lVersionName.AutoSize = $true

$lVersionName.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lVersionName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lVersionName.Location = New-Object System.Drawing.Point(5, 93)

$lVersionName.Name = "lVersionName"

$lVersionName.Size = New-Object System.Drawing.Size(46, 15)

$lVersionName.TabIndex = 0

$lVersionName.Text = "Version"

#

# lBuildversion

 

#

$lBuildversion.AutoSize = $true

$lBuildversion.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lBuildversion.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lBuildversion.Location = New-Object System.Drawing.Point(5, 120)

$lBuildversion.Name = "lBuildversion"

$lBuildversion.Size = New-Object System.Drawing.Size(46, 15)

$lBuildversion.TabIndex = 0

$lBuildversion.Text = "Build No"

#

 

 

 

# lservername

#

$lservername.AutoSize = $true

$lservername.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lservername.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lservername.Location = New-Object System.Drawing.Point(5, 16)

$lservername.Name = "lservername"

$lservername.Size = New-Object System.Drawing.Size(46, 15)

$lservername.TabIndex = 0

$lservername.Text = "Total VMs"

#

# llogon

#

$llogon.AutoSize = $true

$llogon.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$llogon.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$llogon.Location = New-Object System.Drawing.Point(5, 43)

$llogon.Name = "llogon"

$llogon.Size = New-Object System.Drawing.Size(44, 15)

$llogon.TabIndex = 1

$llogon.Text = "Total Datastore"

#

# ldatacenter

#

$ldatacenter.AutoSize = $true

$ldatacenter.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$ldatacenter.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$ldatacenter.Location = New-Object System.Drawing.Point(5, 71)

$ldatacenter.Name = "ldatacenter"

$ldatacenter.Size = New-Object System.Drawing.Size(73, 15)

$ldatacenter.TabIndex = 2

$ldatacenter.Text = "Total Datacenter"

#

# lcluster

#

$lcluster.AutoSize = $true

$lcluster.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lcluster.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lcluster.Location = New-Object System.Drawing.Point(5, 95)

$lcluster.Name = "lcluster"

$lcluster.Size = New-Object System.Drawing.Size(48, 15)

$lcluster.TabIndex = 3

$lcluster.Text = "Total Cluster"

#

# lhost

#

$lhost.AutoSize = $true

$lhost.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$lhost.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lhost.Location = New-Object System.Drawing.Point(5, 120)

$lhost.Name = "lhost"

$lhost.Size = New-Object System.Drawing.Size(35, 15)

$lhost.TabIndex = 4

$lhost.Text = "Total Host"

#

# groupBox5

#

$groupBox5.Controls.Add($ip)

$groupBox5.Controls.Add($attach2)

 

$groupBox5.Location = New-Object System.Drawing.Point(15, 5)

$groupBox5.Name = "groupBox5"

$groupBox5.Size = New-Object System.Drawing.Size(400, 48)

$groupBox5.TabIndex = 0

$groupBox5.TabStop = $false

$groupBox5.Text = "Browser"

#

# groupBox6  Virtual Center"

#

#$groupBox6.Controls.Add($license)

#$groupBox6.Controls.Add($checkBox3)

#$groupBox6.Controls.Add($checkBox2)

#$groupBox6.Controls.Add($checkBox1)

$groupBox6.Controls.AddRange(@($license, $VCEvents, $CDPDetails,$HALogs ,$snapshotcreate, $snapshotdelete))

 

$groupBox6.Location = New-Object System.Drawing.Point(15, 55)

$groupBox6.Name = "groupBox6"

$groupBox6.Size = New-Object System.Drawing.Size(400, 90)

$groupBox6.TabIndex = 1

$groupBox6.TabStop = $false

$groupBox6.Text = "Virtual Center"

#

# groupBox7

#

 

$groupBox7.Location = New-Object System.Drawing.Point(15, 145)

$groupBox7.Name = "groupBox7"

$groupBox7.Size = New-Object System.Drawing.Size(400, 90)

$groupBox7.TabIndex = 2

$groupBox7.TabStop = $false

$groupBox7.Text = "Host Report"

$groupBox7.Controls.AddRange(@($dsusage,$dsvsanusage,$EsxiHostStatus,$EsxiHostDetails,$esxicpuutilization,$esximemoryutilization))

#

# groupBox8

#

#$groupBox8.Controls.Add($radioButton4)

#$groupBox8.Controls.Add($radioButton3)

#$groupBox8.Controls.Add($radioButton2)

#$groupBox8.Controls.Add($radioButton1)

$groupBox8.Controls.AddRange(@($radioButton1,$radioButton2,$radioButton3,$radioButton4,$radioButton5,$TemplateRadio))

$groupBox8.Location = New-Object System.Drawing.Point(15, 240)

$groupBox8.Name = "groupBox8"

$groupBox8.Size = New-Object System.Drawing.Size(400, 90)

$groupBox8.TabIndex = 3

$groupBox8.TabStop = $false

$groupBox8.Text = "Virtual Machine"

#

# Email

#

$Email.Controls.Add($groupBox10)

$Email.Controls.Add($groupBox9)

$Email.Location = New-Object System.Drawing.Point(4, 22)

$Email.Name = "Email"

$Email.Padding = New-Object System.Windows.Forms.Padding(3)

$Email.Size = New-Object System.Drawing.Size(434, 392)

$Email.TabIndex = 2

$Email.Text = "Email"

$Email.UseVisualStyleBackColor = $true

#

# Setting More

#

 

$settingmore.Controls.Add($VirtualCenterGroup)

$settingmore.Controls.Add($ESXiHostsGroup)

$settingmore.Controls.Add($VirtualMachineGroup)

$settingmore.Controls.Add($RunButtonSettingMore)

$settingmore.Controls.Add($SettingMoreMailCheckBox)

$settingmore.Controls.Add($SettingMoreMailLabel)

 

 

$settingmore.Location = New-Object System.Drawing.Point(4, 22)

$settingmore.Name = "SettingMore"

$settingmore.Padding = New-Object System.Windows.Forms.Padding(3)

$settingmore.Size = New-Object System.Drawing.Size(434, 392)

$settingmore.TabIndex = 1

$settingmore.Text = "Setting More"

$settingmore.UseVisualStyleBackColor = $true

#

# VirtualCenterGroup

#

$VirtualCenterGroup.Location = New-Object System.Drawing.Point(5, 10)

$VirtualCenterGroup.Name = "VirtualCenterGroup"

$VirtualCenterGroup.Size = New-Object System.Drawing.Size(425, 100)

$VirtualCenterGroup.TabIndex = 1

$VirtualCenterGroup.TabStop = $false

$VirtualCenterGroup.Text = "Virtual Center Option"

#$VirtualCenterGroup.Controls.AddRange(@($LogHost))

#

#

# ESXiHostsGroup

#

#

#

$ESXiHostsGroup.Location = New-Object System.Drawing.Point(5, 120)

$ESXiHostsGroup.Name = "ESXiHostsGroup"

$ESXiHostsGroup.Size = New-Object System.Drawing.Size(425, 100)

$ESXiHostsGroup.TabIndex = 1

$ESXiHostsGroup.TabStop = $false

$ESXiHostsGroup.Text = "ESXi Host Option"

$ESXiHostsGroup.Controls.AddRange(@($vSANStoragePolicyDetails,$DRSRulewithCluster,$HostHwsensor, $ThinProvisioned, $ThickProvisioned,$LogHost))

#

#

#

 

$ThinProvisioned.AutoSize = $true

$ThinProvisioned.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$ThinProvisioned.Location = New-Object System.Drawing.Point(10, 20)

$ThinProvisioned.Name = "ThinProvisioned"

$ThinProvisioned.Size = New-Object System.Drawing.Size(89, 17)

$ThinProvisioned.TabIndex = 10

$ThinProvisioned.TabStop = $true

$ThinProvisioned.Text = "Thin Provisioned VM"

$ThinProvisioned.UseVisualStyleBackColor = $true

 

$HostHwsensor.AutoSize = $true

$HostHwsensor.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HostHwsensor.Location = New-Object System.Drawing.Point(10, 40)

$HostHwsensor.Name = "HostHwsensor"

$HostHwsensor.Size = New-Object System.Drawing.Size(89, 17)

$HostHwsensor.TabIndex = 10

$HostHwsensor.TabStop = $true

$HostHwsensor.Text = "Host Hardware Sensor"

$HostHwsensor.UseVisualStyleBackColor = $true

$HostHwsensor.Add_Click({

   

    

    $SettingMoreMailLabel.Visible = $false

    $VMCountperHost.Checked = $false

    $VMCountperDatastore.Checked = $false

    $VirtualSwitch.Checked = $false

    $VirtualPortgroup.Checked = $false

    $VMsDeatilsFull.Checked = $false

    $VMsConnectedCDRom.checked = $false

    $VMsConnectedDSISO.Checked = $false

    $VMsConnectedFloppy.Checked = $false

    Get-EsxiHostName

 

   

})

 

Function Get-EsxiHostName{

    if($Global:con.IsConnected -eq $true){

        $GetHostNameall = Get-VMHost

        $GetHostName = $GetHostNameall.Name | Sort-Object

        $HostSensorLabel.Text = $Global:con.Name

            Foreach ($GetHost in $GetHostName)

            {

                $Global:HostNameCombo.Items.Add($GetHost);

            }

        $Form2.ShowDialog() | Out-Null

    } else

    {

              [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

              $HostHwsensor.Checked = $false

    }

}

 

<#

 

$HostHwsensor.AutoSize = $true

$HostHwsensor.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HostHwsensor.Location = New-Object System.Drawing.Point(10, 40)

$HostHwsensor.Name = "HostHwsensor"

$HostHwsensor.Size = New-Object System.Drawing.Size(89, 17)

$HostHwsensor.TabIndex = 10

$HostHwsensor.TabStop = $true

$HostHwsensor.Text = "Host Hardware Sensor"

$HostHwsensor.UseVisualStyleBackColor = $true

$HostHwsensor.Add_Click({

    Get-VMHostNameAll

    Write-Host $Global:VCStatus

   

    $SettingMoreMailLabel.Visible = $false

    $VMCountperHost.Checked = $false

    $VMCountperDatastore.Checked = $false

    $VirtualSwitch.Checked = $false

    $VirtualPortgroup.Checked = $false

    $VMsDeatilsFull.Checked = $false

    $VMsConnectedCDRom.checked = $false

    $VMsConnectedDSISO.Checked = $false

    $VMsConnectedFloppy.Checked = $false

    $Form2.ShowDialog() | Out-Null

   

})

#>

 

#

#

#

#  DRSRulewithCluster

#

#

#

 

$DRSRulewithCluster.AutoSize = $true

$DRSRulewithCluster.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$DRSRulewithCluster.Location = New-Object System.Drawing.Point(10, 60)

$DRSRulewithCluster.Name = "DRSRulewithCluster"

$DRSRulewithCluster.Size = New-Object System.Drawing.Size(89, 17)

$DRSRulewithCluster.TabIndex = 10

$DRSRulewithCluster.TabStop = $true

$DRSRulewithCluster.Text = "DRS Rule"

$DRSRulewithCluster.UseVisualStyleBackColor = $true

$DRSRulewithCluster.Add_Click({

   

    $SettingMoreMailLabel.Visible = $false

    $VMCountperHost.Checked = $false

    $VMCountperDatastore.Checked = $false

    $VirtualSwitch.Checked = $false

    $VirtualPortgroup.Checked = $false

    $VMsDeatilsFull.Checked = $false

    $VMsConnectedCDRom.checked = $false

    $VMsConnectedDSISO.Checked = $false

    $VMsConnectedFloppy.Checked = $false

})

#

#

# vSANStoragePolicyDetails

#

#

#

$vSANStoragePolicyDetails.AutoSize = $true

$vSANStoragePolicyDetails.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$vSANStoragePolicyDetails.Location = New-Object System.Drawing.Point(10, 80)

$vSANStoragePolicyDetails.Name = "vSANStoragePolicyDetails"

$vSANStoragePolicyDetails.Size = New-Object System.Drawing.Size(89, 17)

$vSANStoragePolicyDetails.TabIndex = 10

$vSANStoragePolicyDetails.TabStop = $true

$vSANStoragePolicyDetails.Text = "vSAN Storage Policy "

$vSANStoragePolicyDetails.UseVisualStyleBackColor = $true

$vSANStoragePolicyDetails.Add_Click({

   

    $SettingMoreMailLabel.Visible = $false

    $VMCountperHost.Checked = $false

    $VMCountperDatastore.Checked = $false

    $VirtualSwitch.Checked = $false

    $VirtualPortgroup.Checked = $false

    $VMsDeatilsFull.Checked = $false

    $VMsConnectedCDRom.checked = $false

    $VMsConnectedDSISO.Checked = $false

    $VMsConnectedFloppy.Checked = $false

})

#

#

#

$ThickProvisioned.AutoSize = $true

$ThickProvisioned.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$ThickProvisioned.Location = New-Object System.Drawing.Point(170, 20)

$ThickProvisioned.Name = "ThickProvisioned"

$ThickProvisioned.Size = New-Object System.Drawing.Size(89, 17)

$ThickProvisioned.TabIndex = 10

$ThickProvisioned.TabStop = $true

$ThickProvisioned.Text = "Thick Provisioned VM"

$ThickProvisioned.UseVisualStyleBackColor = $true

#

#

#

$LogHost.AutoSize = $true

$LogHost.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$LogHost.Location = New-Object System.Drawing.Point(170, 20)

$LogHost.Name = "ThickProLogHostvisioned"

$LogHost.Size = New-Object System.Drawing.Size(89, 17)

$LogHost.TabIndex = 10

$LogHost.TabStop = $true

$LogHost.Text = "Thick Provisioned VM"

$LogHost.UseVisualStyleBackColor = $true

#

#

#

 

 

##

#

#

# VirtualMachineGroup

#

#

#

 

$VirtualmachineGroup.Controls.AddRange(@($VMCountperDatastore, $VMCountperHost, $VirtualSwitch, $VirtualPortgroup, $VMsDeatilsFull,$VMsConnectedCDRom, $VMsConnectedDSISO, $VMsConnectedFloppy

))

$VirtualmachineGroup.Location = New-Object System.Drawing.Point(5, 230)

$VirtualmachineGroup.Name = "VirtualmachineGroup"

$VirtualmachineGroup.Size = New-Object System.Drawing.Size(425, 100)

$VirtualmachineGroup.TabIndex = 1

$VirtualmachineGroup.TabStop = $false

$VirtualmachineGroup.Text = "Virtual Machine Option"

#

#

#

$VMCountperHost.AutoSize = $true

$VMCountperHost.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMCountperHost.Location = New-Object System.Drawing.Point(10, 20)

$VMCountperHost.Name = "VMCountperHost"

$VMCountperHost.Size = New-Object System.Drawing.Size(89, 17)

$VMCountperHost.TabIndex = 10

$VMCountperHost.TabStop = $true

$VMCountperHost.Text = "VM Count per Host"

$VMCountperHost.UseVisualStyleBackColor = $true

$VMCountperHost.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

$VMCountperDatastore.AutoSize = $true

$VMCountperDatastore.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMCountperDatastore.Location = New-Object System.Drawing.Point(10, 40)

$VMCountperDatastore.Name = "VMCountperDatastore"

$VMCountperDatastore.Size = New-Object System.Drawing.Size(89, 17)

$VMCountperDatastore.TabIndex = 10

$VMCountperDatastore.TabStop = $true

$VMCountperDatastore.Text = "VM Count per Datastore"

$VMCountperDatastore.UseVisualStyleBackColor = $true

$VMCountperDatastore.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

$VirtualSwitch.AutoSize = $true

$VirtualSwitch.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VirtualSwitch.Location = New-Object System.Drawing.Point(10, 60)

$VirtualSwitch.Name = "VirtualSwitch"

$VirtualSwitch.Size = New-Object System.Drawing.Size(89, 17)

$VirtualSwitch.TabIndex = 10

$VirtualSwitch.TabStop = $true

$VirtualSwitch.Text = "Virtual Switch"

$VirtualSwitch.UseVisualStyleBackColor = $true

$VirtualSwitch.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

 

$VirtualPortgroup.AutoSize = $true

$VirtualPortgroup.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VirtualPortgroup.Location = New-Object System.Drawing.Point(10, 80)

$VirtualPortgroup.Name = "VirtualPortgroup"

$VirtualPortgroup.Size = New-Object System.Drawing.Size(89, 17)

$VirtualPortgroup.TabIndex = 10

$VirtualPortgroup.TabStop = $true

$VirtualPortgroup.Text = "Virtual PortGroup"

$VirtualPortgroup.UseVisualStyleBackColor = $true

$VirtualPortgroup.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

 

$VMsDeatilsFull.AutoSize = $true

$VMsDeatilsFull.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMsDeatilsFull.Location = New-Object System.Drawing.Point(170, 20)

$VMsDeatilsFull.Name = "VMsDeatilsFull"

$VMsDeatilsFull.Size = New-Object System.Drawing.Size(89, 17)

$VMsDeatilsFull.TabIndex = 10

$VMsDeatilsFull.TabStop = $true

$VMsDeatilsFull.Text = "VM Details"

$VMsDeatilsFull.UseVisualStyleBackColor = $true

$VMsDeatilsFull.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

####

 

 

$VMsConnectedCDRom.AutoSize = $true

$VMsConnectedCDRom.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMsConnectedCDRom.Location = New-Object System.Drawing.Point(170, 40)

$VMsConnectedCDRom.Name = "VMsConnectedCDRom"

$VMsConnectedCDRom.Size = New-Object System.Drawing.Size(89, 17)

$VMsConnectedCDRom.TabIndex = 10

$VMsConnectedCDRom.TabStop = $true

$VMsConnectedCDRom.Text = "VMs Connected to CD-ROM"

$VMsConnectedCDRom.UseVisualStyleBackColor = $true

$VMsConnectedCDRom.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

 

$VMsConnectedDSISO.AutoSize = $true

$VMsConnectedDSISO.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMsConnectedDSISO.Location = New-Object System.Drawing.Point(170, 60)

$VMsConnectedDSISO.Name = "VMsConnectedDSISO"

$VMsConnectedDSISO.Size = New-Object System.Drawing.Size(89, 17)

$VMsConnectedDSISO.TabIndex = 10

$VMsConnectedDSISO.TabStop = $true

$VMsConnectedDSISO.Text = "VMs with Datastore ISO"

$VMsConnectedDSISO.UseVisualStyleBackColor = $true

$VMsConnectedDSISO.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

$VMsConnectedFloppy.AutoSize = $true

$VMsConnectedFloppy.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VMsConnectedFloppy.Location = New-Object System.Drawing.Point(170, 80)

$VMsConnectedFloppy.Name = "VMsConnectedFloppy"

$VMsConnectedFloppy.Size = New-Object System.Drawing.Size(89, 17)

$VMsConnectedFloppy.TabIndex = 10

$VMsConnectedFloppy.TabStop = $true

$VMsConnectedFloppy.Text = "VMs Connected to Floppy"

$VMsConnectedFloppy.UseVisualStyleBackColor = $true

$VMsConnectedFloppy.Add_Click({

    $SettingMoreMailLabel.Visible = $false

    $vSANStoragePolicyDetails.Checked = $false

})

 

 

$SettingMoreMailCheckBox.AutoSize = $true

$SettingMoreMailCheckBox.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$SettingMoreMailCheckBox.Location = New-Object System.Drawing.Point(330, 355)

$SettingMoreMailCheckBox.Name = "SettingMoreMailCheckBox"

$SettingMoreMailCheckBox.Size = New-Object System.Drawing.Size(89, 17)

$SettingMoreMailCheckBox.TabIndex = 16

$SettingMoreMailCheckBox.Text = "Mail Send.."

$SettingMoreMailCheckBox.UseVisualStyleBackColor = $true

 

$SettingMoreMailLabel.AutoSize = $true

$SettingMoreMailLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$SettingMoreMailLabel.ForeColor = [System.Drawing.Color]::FromArgb(0,192,0)

$SettingMoreMailLabel.Location = New-Object System.Drawing.Point(330, 380)

$SettingMoreMailLabel.Name = "lconnected"

$SettingMoreMailLabel.Size = New-Object System.Drawing.Size(24, 13)

$SettingMoreMailLabel.TabIndex = 9

$SettingMoreMailLabel.BackColor = "Transparent"

$SettingMoreMailLabel.Text = ""

 

 

 

$RunButtonSettingMore.Location = New-Object System.Drawing.Point(150,360)

$RunButtonSettingMore.Name = "RunButtonSettingMore"

$RunButtonSettingMore.Size = New-Object System.Drawing.Size(105, 35)

$RunButtonSettingMore.TabIndex = 5

$RunButtonSettingMore.Text = "Execute......"

$RunButtonSettingMore.UseVisualStyleBackColor = $true

$RunButtonSettingMore.Add_Click($Setting_More_Events)

 

$Setting_More_Events={

$objStatusBar.Text = "Please wait work is in Progress..."

$SettingMoreMailLabel.Visible = $false

if($VMCountperHost.Checked -eq $true){

           $Global:mailSubject = $VMCountperHost.Text

           $objStatusBar.Text ="Generating VM Count per Host Report! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! VM Count per Host Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VMCountperHost

                        $VMCountperHost.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VMCountperHost.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VMCountperHost.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VMCountperDatastore.Checked -eq $true){

           $Global:mailSubject = $VMCountperDatastore.Text

           $objStatusBar.Text ="Generating VMs Count per Datastore Report! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! VMs Count per Datastore Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VMCountperDatastore

                        $VMCountperDatastore.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VMCountperDatastore.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VMCountperDatastore.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VirtualSwitch.Checked -eq $true){

          $Global:mailSubject = $VirtualSwitch.Text

           $objStatusBar.Text ="Generating Virtual Switch Report! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! Virtual Switch Details Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VirtualSwitchInfo

                        $VirtualSwitch.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VirtualSwitch.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VirtualSwitch.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VirtualPortgroup.Checked -eq $true){

           $Global:mailSubject = $VirtualPortgroup.Text

           $objStatusBar.Text ="Generating Virtual Port Groups Report! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! Virtual Port Groups Details Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VirualPortGroupsInfo

                        $VirtualPortgroup.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VirtualPortgroup.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VirtualPortgroup.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VMsDeatilsFull.Checked -eq $true){

           $Global:mailSubject = $VMsDeatilsFull.Text

           $objStatusBar.Text ="Generating Virtual Machine Report! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! Virtual Machine Details Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VMsDeatilsFull

                        $VMsDeatilsFull.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VMsDeatilsFull.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VMsDeatilsFull.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VMsConnectedCDRom.Checked -eq $true){

           $Global:mailSubject = $VMsConnectedCDRom.Text

           $objStatusBar.Text ="Generating VMs with CD-ROM connected at 'Power ON'! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! VMs with CD-ROM connected at 'Power ON'! Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VMsConnectedtoCDROM

                        $VMsConnectedCDRom.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VMsConnectedCDRom.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VMsConnectedCDRom.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($VMsConnectedDSISO.Checked -eq $true){

           $Global:mailSubject = $VMsConnectedDSISO.Text

           $objStatusBar.Text ="GeneratingVMs with CD-ROM connected to ‘Datastore ISO file’!! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! VMs with CD-ROM connected to ‘Datastore ISO file’! Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-VMsConnectedtoDSISO

                        $VMsConnectedDSISO.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $VMsConnectedDSISO.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $VMsConnectedDSISO.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($DRSRulewithCluster.Checked -eq $true){

           $Global:mailSubject = $DRSRulewithCluster.Text

           $objStatusBar.Text ="Generating DRS Rule! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! DRS Rule Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-DRSRulewithClusterVM

                        $DRSRulewithCluster.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $DRSRulewithCluster.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $DRSRulewithCluster.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($vSANStoragePolicyDetails.Checked -eq $true){

           $Global:mailSubject = $vSANStoragePolicyDetails.Text

           $objStatusBar.Text ="Generating vSANStoragePolicyDetails! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! vSANStoragePolicyDetails Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-vSANStoragePolicywithVM

                        $vSANStoragePolicyDetails.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendAttachReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $vSANStoragePolicyDetails.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $vSANStoragePolicyDetails.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

       

elseif($ThinProvisioned.Checked -eq $true){

           $Global:mailSubject = $ThinProvisioned.Text

           $objStatusBar.Text ="Generating Thin Provisioned VMs! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! Thin  Provisioned VMs Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-ThickThinProvisionedVMs -diskformat thin

                        $ThinProvisioned.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $ThinProvisioned.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $ThinProvisioned.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

elseif($ThickProvisioned.Checked -eq $true){

           $Global:mailSubject = $ThickProvisioned.Text

           $objStatusBar.Text ="Generating Thick Provisioned VMs! Please Wait.."

           [System.Windows.Forms.MessageBox]::Show("You Choose! Thick  Provisioned VMs Report..")

            if(-NOT ([string]::IsNullOrEmpty($tserver.Text))){

                    $Global:daily = $Global:con.IsConnected

                   $Global:vc = $Global:con

                    if($Global:daily -eq $true){

                        $Global:VCStatus = $daily

                        Get-ThickThinProvisionedVMs -diskformat thick

                        $ThickProvisioned.Checked = $false

                    if($SettingMoreMailCheckBox.Checked -eq $true){

                        Mail-SendReport

                        Write-Host "Mail Send..." -ForegroundColor Cyan

                        $objStatusBar.Text ="Mail Send.."

                        Write-Host "Done" -ForegroundColor Yellow

                        $SettingMoreMailCheckBox.Checked = $false

                        $SettingMoreMailLabel.Visible =$true

                        $SettingMoreMailLabel.Text ="Mail Send.."

                    }

                }

                else

                {

                       [System.Windows.Forms.MessageBox]::Show("You are not connected to vCenter")

                       $ThickProvisioned.Checked = $false

                       $SettingMoreMailCheckBox.Checked = $false

                }

        }

         else

           {

                   [System.Windows.Forms.MessageBox]::Show("You have not selected vCenter ! Please select first..")

                   $ThickProvisioned.Checked = $false

                   $SettingMoreMailCheckBox.Checked = $false

           }

        }

 

        else

        {

            [System.Windows.Forms.MessageBox]::Show("You have not selected any option")

            $SettingMoreMailCheckBox.Checked = $false

        }

}

 

# Output  TabControl

#

$output.Controls.Add($UserInput)

$Output.Controls.Add($dataGridResult)

$Output.Controls.Add($VMOptionGrp)

$output.Location = New-Object System.Drawing.Point(4, 22)

$output.Name = "output"

$output.Padding = New-Object System.Windows.Forms.Padding(3)

$output.Size = New-Object System.Drawing.Size(434, 342)

$output.TabIndex = 4

$output.Text = "Output"

$output.UseVisualStyleBackColor = $true

#

# TextBox for IP FileName

#

$UserInput.Controls.Add($Filename2)

$UserInput.Controls.Add($buttonFileName)

$UserInput.Location = New-Object System.Drawing.Point(15, 10)

$UserInput.Name = "UserInput"

$UserInput.Size= New-Object System.Drawing.Size(393, 48)

$UserInput.TabIndex = 0

$UserInput.TabStop = $false

$UserInput.Text = "User Input"

#

#

#

# To Attach buttonFileName output tab for ip

#

$buttonFileName.Location = New-Object System.Drawing.Point(300, 16)

$buttonFileName.Name = "buttonFileName"

$buttonFileName.Size = New-Object System.Drawing.Size(75, 23)

$buttonFileName.TabIndex = 5

$buttonFileName.Text = "...."

$buttonFileName.UseVisualStyleBackColor = $true

$buttonFileName.Add_Click($buttonFileName_ip)

$buttonFileName_ip={

    $rmail.Visible = $false

 

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $dialog3 = New-Object System.Windows.Forms.OpenFileDialog

    $dialog3.DefaultExt = '.txt'

    $dialog3.Filter = 'All Files|*.txt;*.csv'

    $dialog3.FilterIndex = 0

    $dialog3.InitialDirectory = "$Global:filename"

    $dialog3.Multiselect = $false

    $dialog3.RestoreDirectory = $true

    $dialog3.Title = "Select a Input file"

    $dialog3.ValidateNames = $true

    $dialog3.ShowDialog()

    $Filename2.Text = $dialog3.FileName

}

#

# Group DataGrid OutPut

#

$dataGridResult.Location = New-Object System.Drawing.Point(6, 60)

$dataGridResult.Name = "dataGridResult"

$dataGridResult.Size = New-Object System.Drawing.Size(420, 225)

$dataGridResult.TabIndex = 0

$dataGridResult.TabStop = $false

$dataGridResult.Text = "Show"

$dataGridResult.Controls.Add($dataGridView1)

#

# groupBoc VMOptionGrp

#

 

$VMOptionGrp.Location = New-Object System.Drawing.Point(6, 290)

$VMOptionGrp.Name = "VMOptionGrp"

$VMOptionGrp.Size = New-Object System.Drawing.Size(420, 100)

$VMOptionGrp.TabIndex = 0

$VMOptionGrp.TabStop = $false

$VMOptionGrp.Text = "OptionVM"

#$VMOptionGrp.Controls.Add($Pingb)

$VMOptionGrp.Controls.AddRange(@($vmpingradioButton1,$vmosradioButton1,$Pingb))

#

#

#

# vmpingradioButton1

#

$vmpingradioButton1.AutoSize = $true

$vmpingradioButton1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$vmpingradioButton1.Location = New-Object System.Drawing.Point(33, 20)

$vmpingradioButton1.Name = "vmpingradioButton1"

$vmpingradioButton1.Size = New-Object System.Drawing.Size(97, 17)

$vmpingradioButton1.TabIndex = 0

$vmpingradioButton1.TabStop = $true

$vmpingradioButton1.Text = "Ping Status"

$vmpingradioButton1.UseVisualStyleBackColor = $true

$vmpingradioButton1.Add_Click({

 

    $rmail.Visible = $false

})

#

#

#

# vmosradioButton1

#

$vmosradioButton1.AutoSize = $true

$vmosradioButton1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$vmosradioButton1.Location = New-Object System.Drawing.Point(33, 45)

$vmosradioButton1.Name = "vmpingradioButton1"

$vmosradioButton1.Size = New-Object System.Drawing.Size(97, 17)

$vmosradioButton1.TabIndex = 0

$vmosradioButton1.TabStop = $true

$vmosradioButton1.Text = "OS Name"

$vmosradioButton1.UseVisualStyleBackColor = $true

$vmosradioButton1.Add_Click({

 

    $rmail.Visible = $false

})

 

#

#

#

$richTextBox1 = New-Object System.Windows.Forms.RichTextBox

$richTextBox1.Location  = New-Object System.Drawing.Point(6, 30)

$richTextBox1.Size = New-Object System.Drawing.Size(410, 190)

#$dataGridResult.Controls.Add($richTextBox1)

 

#

#

$dataGridView1.ColumnHeadersHeightSizeMode = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::AutoSize

$dataGridView1.Location = New-Object System.Drawing.Point(6, 15)

$dataGridView1.Name = "DGVservices"

$dataGridView1.Size = New-Object System.Drawing.Size(406, 201)

$dataGridView1.TabIndex = 0

$dataGridView1.AllowUserToOrderColumns = $True

 

#

# TextBox for File

#

$Filename2.Location = New-Object System.Drawing.Point(40, 16)

$Filename2.Name = "Filename2"

$Filename2.Multiline = $true

$Filename2.Size = New-Object System.Drawing.Size(220, 20)

$Filename2.TabIndex = 133

#$Filename2.Text = "$env:COMPUTERNAME"

$Filename2.Text = ''

#$Filename2.DataBindings.DefaultDataSourceUpdateMode = 0

 

#

# Ping Button

#

$Pingb.Location = New-Object System.Drawing.Point(333,70)

$Pingb.Name = "Pingb"

$Pingb.Size = New-Object System.Drawing.Size(75, 23)

$Pingb.TabIndex = 5

$Pingb.Text = "Details"

$Pingb.UseVisualStyleBackColor = $true

$Pingb.Add_Click($ping_response)

 

$ping_response={

$objStatusBar.Text = "Please wait PING Man is wotking..."

if($vmpingradioButton1.Checked -eq $true){

    Ping-Response

    }

    elseif($vmosradioButton1.Checked -eq $true){

        OSType-Response

        Write-Host "not"

    }

$objStatusBar.Text ="Ping Got.."

 

}

#

# groupBox9

#

$groupBox9.Controls.Add($textBox9)

$groupBox9.Controls.Add($textBox8)

$groupBox9.Controls.Add($textBox7)

$groupBox9.Controls.Add($textBox6)

$groupBox9.Controls.Add($textBox5)

$groupBox9.Controls.Add($textBox4)

$groupBox9.Controls.Add($label18)

$groupBox9.Controls.Add($bSend)

$groupBox9.Controls.Add($attach)

$groupBox9.Controls.Add($label17)

$groupBox9.Controls.Add($label20)

$groupBox9.Controls.Add($lport)

$groupBox9.Controls.Add($lfrom)

$groupBox9.Controls.Add($lto)

$groupBox9.Controls.Add($lsubject)

$groupBox9.Location = New-Object System.Drawing.Point(11, 15)

$groupBox9.Name = "groupBox9"

$groupBox9.Size = New-Object System.Drawing.Size(396, 236)

$groupBox9.TabIndex = 0

$groupBox9.TabStop = $false

$groupBox9.Text = "groupBox9"

#

# groupBox10

#

$groupBox10.Location = New-Object System.Drawing.Point(12, 257)

$groupBox10.Name = "groupBox10"

$groupBox10.Size = New-Object System.Drawing.Size(396, 130)

$groupBox10.TabIndex = 1

$groupBox10.TabStop = $false

$groupBox10.Text = "groupBox10"

#

# lsubject

#

$lsubject.AutoSize = $true

$lsubject.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lsubject.Location = New-Object System.Drawing.Point(48, 16)

$lsubject.Name = "lsubject"

$lsubject.Size = New-Object System.Drawing.Size(50, 13)

$lsubject.TabIndex = 0

$lsubject.Text = "Subject"

#

# lto

#

$lto.AutoSize = $true

$lto.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lto.Location = New-Object System.Drawing.Point(48, 47)

$lto.Name = "lto"

$lto.Size = New-Object System.Drawing.Size(22, 13)

$lto.TabIndex = 1

$lto.Text = "To"

#

# lfrom

#

$lfrom.AutoSize = $true

$lfrom.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lfrom.Location = New-Object System.Drawing.Point(48, 77)

$lfrom.Name = "lfrom"

$lfrom.Size = New-Object System.Drawing.Size(34, 13)

$lfrom.TabIndex = 2

$lfrom.Text = "From"

#

# lport

#

$lport.AutoSize = $true

$lport.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$lport.Location = New-Object System.Drawing.Point(48, 108)

$lport.Name = "lport"

$lport.Size = New-Object System.Drawing.Size(30, 13)

$lport.TabIndex = 3

$lport.Text = "Port"

#

# label17

#

$label17.AutoSize = $true

$label17.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$label17.Location = New-Object System.Drawing.Point(48, 136)

$label17.Name = "label17"

$label17.Size = New-Object System.Drawing.Size(48, 13)

$label17.TabIndex = 4

$label17.Text = "SMTP"

#

 

# label20

#

$label20.AutoSize = $true

$label20.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$label20.ForeColor = [System.Drawing.Color]::Green

$label20.Location = New-Object System.Drawing.Point(48, 199)

$label20.Name = "label20"

$label20.Size = New-Object System.Drawing.Size(48, 13)

$label20.TabIndex = 4

$label20.Text = "Status"

#

#

#

# attach mail

#

$attach.Location = New-Object System.Drawing.Point(260, 207)

$attach.Name = "attach"

$attach.Size = New-Object System.Drawing.Size(75, 23)

$attach.TabIndex = 60

$attach.Text = "Attach.."

$attach.UseVisualStyleBackColor = $true

 

$attach.Add_Click($attch_reports)

 

$attch_reports={

$rmail.Visible = $false

[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$dialog = New-Object System.Windows.Forms.OpenFileDialog

$dialog.DefaultExt = '.txt'

$dialog.Filter = 'All Files|*.*'

$dialog.FilterIndex = 0

$dialog.InitialDirectory = "$Global:filename"

$dialog.Multiselect = $false

$dialog.RestoreDirectory = $true

$dialog.Title = "Mail Attachment"

$dialog.ValidateNames = $true

 

$dialog.ShowDialog()

$textBox9.Text = $dialog.FileName

 

}

 

 

<#

function open_CSV_File{

 

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog

    $openFileDialog.InitialDirectory = "C:\";

    $OpenFileDialog.Filter = "csv files (*.csv)|*.csv"

    "

    if ($OpenFileDialog.ShowDialog() -eq "OK"){

        $textbox_BrowseForCSV.Text = $OpenFileDialog.FileName

    }

}#>

 

# bSend

#

$bSend.Location = New-Object System.Drawing.Point(160, 207)

$bSend.Name = "bSend"

$bSend.Size = New-Object System.Drawing.Size(75, 23)

$bSend.TabIndex = 6

$bSend.Text = "Send.."

$bSend.UseVisualStyleBackColor = $true

$bSend.Add_Click($send_mail)

$send_mail={

$label20.Text = ""

$objStatusBar.Text = "Checking Status..."

$kb = $textBox9.Text

$ext = [System.IO.Path]::GetExtension($kb)

$check ='.xlsx'

if($check -ne $ext){

        $msubject = $textBox4.Text

        $msmptserver = 'smtp-server'

        $mport = '25'

        $mto = $textBox5.Text

        $mfrom = 'rohitvishwakarma@gmail.com'

        $mbody = Get-Content "$($textBox9.Text)"

        $message = New-Object Net.Mail.MailMessage($mfrom, $mto, $msubject, $mbody)

        $message.IsBodyHtml = $true;

        $message.body = $mbody

        $smtp = New-Object Net.Mail.SmtpClient($msmptserver)

        $smtp.Send($message)

        $label20.Text = "Mail Send..."

        }

       

        else

 

        {

        $msubject = $textBox4.Text

        $msmptserver = 'smtp-server'

        $mport = '25'

        $mto = $textBox5.Text

        $mfrom = 'rohitvishwakarma@gmail.com'

        $mbody = Get-Content "C:\Users\rovis\Documents\VC-Form\Excel.txt"

        $message = new-object System.Net.Mail.MailMessage ($mfrom, $mto, $msubject, $mbody)

        $attachment = $kb

        $attach = new-object Net.Mail.Attachment($attachment)

        $message.Attachments.Add($attach)

        $message.body = $mbody

        $smtp = new-object Net.Mail.SmtpClient($msmptserver)

        $smtp.Send($message)

        $label20.Text = "Mail Send..."

 

        }

    $objStatusBar.Text = "Done"

 

}

 

$label18.AutoSize = $true

$label18.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$label18.Location = New-Object System.Drawing.Point(48, 167)

$label18.Name = "label18"

$label18.Size = New-Object System.Drawing.Size(48, 13)

$label18.TabIndex = 7

$label18.Text = "Report"

#

# textBox4

#

$textBox4.Location = New-Object System.Drawing.Point(140, 16)

$textBox4.Name = "textBox4"

$textBox4.Size = New-Object System.Drawing.Size(216, 20)

$textBox4.TabIndex = 8

#

# textBox5

#

$textBox5.Location = New-Object System.Drawing.Point(140, 44)

$textBox5.Name = "textBox5"

$textBox5.Size = New-Object System.Drawing.Size(216, 20)

$textBox5.TabIndex = 9

$textBox5.Text = 'rohitvishwakarma@gmail.com'

 

#

# textBox6

#

$textBox6.Location = New-Object System.Drawing.Point(140, 77)

$textBox6.Name = "textBox6"

$textBox6.Size = New-Object System.Drawing.Size(216, 20)

$textBox6.TabIndex = 10

$textBox6.Text = 'rohitvishwakarma@gmail.com'

#

# textBox7

#

$textBox7.Location = New-Object System.Drawing.Point(140, 108)

$textBox7.Name = "textBox7"

$textBox7.Size = New-Object System.Drawing.Size(216, 20)

$textBox7.TabIndex = 11

$textBox7.Text = '25'

$textBox7.ReadOnly = $true

#

# textBox8

#

$textBox8.Location = New-Object System.Drawing.Point(140, 138)

$textBox8.Name = "textBox8"

$textBox8.Size = New-Object System.Drawing.Size(216, 20)

$textBox8.TabIndex = 12

$textBox8.Text = 'smtp-server'

$textBox8.ReadOnly = $true

#

# textBox9

#

$textBox9.Location = New-Object System.Drawing.Point(140, 164)

$textBox9.Name = "textBox9"

$textBox9.Size = New-Object System.Drawing.Size(216, 20)

$textBox9.TabIndex = 13

#

# ip

#

$ip.Location = New-Object System.Drawing.Point(50, 16)

$ip.Name = "ip"

$ip.Size = New-Object System.Drawing.Size(200, 20)

$ip.TabIndex = 133

$ip.ReadOnly = $true

#

 

# attach2  setting filedialog snapshot

#

$attach2.Location = New-Object System.Drawing.Point(300, 16)

$attach2.Name = "attach2"

$attach2.Size = New-Object System.Drawing.Size(75, 23)

$attach2.TabIndex = 5

$attach2.Text = "......."

$attach2.Enabled = $false

$attach2.UseVisualStyleBackColor = $true

$attach2.Add_Click($attach_ip)

$attach_ip={

[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$dialog2 = New-Object System.Windows.Forms.OpenFileDialog

$dialog2.DefaultExt = '.txt'

$dialog2.Filter = 'All Files|*.txt;*.csv'

$dialog2.FilterIndex = 0

$dialog2.InitialDirectory = "$Global:filename"

$dialog2.Multiselect = $false

$dialog2.RestoreDirectory = $true

$dialog2.Title = "Select a Input file"

$dialog2.ValidateNames = $true

 

$dialog2.ShowDialog()

$ip.Text = $dialog2.FileName;

}

 

#

# RadioButton   VCEvents

#

#

 

$VCEvents.AutoSize = $true

$VCEvents.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$VCEvents.Location = New-Object System.Drawing.Point(33, 23)

$VCEvents.Name = "VCEvents"

$VCEvents.Size = New-Object System.Drawing.Size(89, 17)

$VCEvents.TabIndex = 10

$VCEvents.TabStop = $true

$VCEvents.Text = "vCenter Events"

$VCEvents.UseVisualStyleBackColor = $true

$VCEvents.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false

 

#>

 

Set-UncheckAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

#

#

#

 

#

# checkBox2 CDP Info

#

 

 

$CDPDetails.AutoSize = $true

$CDPDetails.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$CDPDetails.Location = New-Object System.Drawing.Point(33, 43)

$CDPDetails.Name = "CDPDetails"

$CDPDetails.Size = New-Object System.Drawing.Size(89, 17)

$CDPDetails.TabIndex = 10

$CDPDetails.TabStop = $true

$CDPDetails.Text = "CDP Details"

$CDPDetails.UseVisualStyleBackColor = $true

$CDPDetails.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false

#>

Set-UncheckAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

 

#$checkBox2.AutoSize = $true

#$checkBox2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

#$checkBox2.Location = New-Object System.Drawing.Point(33, 43)

#$checkBox2.Name = "checkBox2"

#$checkBox2.Size = New-Object System.Drawing.Size(89, 17)

#$checkBox2.TabIndex = 1

#$checkBox2.Text = "VC Service Status"

#$checkBox2.UseVisualStyleBackColor = $true

#

# radiobutton HALogs

#

 

$HALogs.AutoSize = $true

$HALogs.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HALogs.Location = New-Object System.Drawing.Point(33, 66)

$HALogs.Name = "HALogs"

$HALogs.Size = New-Object System.Drawing.Size(89, 17)

$HALogs.TabIndex = 10

$HALogs.TabStop = $true

$HALogs.Text = "HA Logs"

$HALogs.UseVisualStyleBackColor = $true

$HALogs.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false

#>

Set-UncheckAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

 

#

# checkBox4 license

#

$license.AutoSize = $true

$license.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$license.Location = New-Object System.Drawing.Point(222, 20)

$license.Name = "license"

$license.Size = New-Object System.Drawing.Size(89, 17)

$license.TabIndex = 10

$license.TabStop = $true

$license.Text = " License Key"

$license.UseVisualStyleBackColor = $true

$license.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false

 

#>

Set-UncheckAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

 

#

 

# checkBox4 snapshotcreate

#

$snapshotcreate.AutoSize = $true

$snapshotcreate.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$snapshotcreate.Location = New-Object System.Drawing.Point(222, 43)

$snapshotcreate.Name = "snapshotcreate"

$snapshotcreate.Size = New-Object System.Drawing.Size(89, 17)

$snapshotcreate.TabIndex = 10

$snapshotcreate.TabStop = $true

$snapshotcreate.Text = "Snapshot Creation"

$snapshotcreate.UseVisualStyleBackColor = $true

$snapshotcreate.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $true

#>

 

Set-checkAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

 

#

# checkBox4 snapshotdelete

#

$snapshotdelete.AutoSize = $true

$snapshotdelete.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$snapshotdelete.Location = New-Object System.Drawing.Point(222, 66)

$snapshotdelete.Name = "snapshotdelete"

$snapshotdelete.Size = New-Object System.Drawing.Size(89, 17)

$snapshotdelete.TabIndex = 10

$snapshotdelete.TabStop = $true

$snapshotdelete.Text = "Snapshot Deleteion"

$snapshotdelete.UseVisualStyleBackColor = $true

$snapshotdelete.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $true    

#>

Set-checkAttachmentTextbox

Set-UncheckHostGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

 

})

 

#

# checkBox5  EsxiHostDetails

#

#

#

$EsxiHostDetails.AutoSize = $true

$EsxiHostDetails.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$EsxiHostDetails.Location = New-Object System.Drawing.Point(33, 23)

$EsxiHostDetails.Name = "EsxiHostDetails"

$EsxiHostDetails.Size = New-Object System.Drawing.Size(89, 17)

$EsxiHostDetails.TabIndex = 10

$EsxiHostDetails.TabStop = $true

$EsxiHostDetails.Text = "ESXi Host Details"

$EsxiHostDetails.UseVisualStyleBackColor = $true

$EsxiHostDetails.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false    

    $HALogs.Checked = $false    

#>

 

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

   

})

 

#

#

# RadioButton EsxiHostStatus

#

#

#

$EsxiHostStatus.AutoSize = $true

$EsxiHostStatus.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$EsxiHostStatus.Location = New-Object System.Drawing.Point(222, 23)

$EsxiHostStatus.Name = "EsxiHostStatus"

$EsxiHostStatus.Size = New-Object System.Drawing.Size(89, 17)

$EsxiHostStatus.TabIndex = 10

$EsxiHostStatus.TabStop = $true

$EsxiHostStatus.Text = "ESXi Host Status"

$EsxiHostStatus.UseVisualStyleBackColor = $true

$EsxiHostStatus.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false    

    $HALogs.Checked = $false    

 

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

   

})

 

 

#

#

#

# radiobutton  DS Usage

#

$dsusage.AutoSize = $true

$dsusage.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$dsusage.Location = New-Object System.Drawing.Point(33, 43)

$dsusage.Name = "dsusage"

$dsusage.Size = New-Object System.Drawing.Size(89, 17)

$dsusage.TabIndex = 10

$dsusage.TabStop = $true

$dsusage.Text = "Datastore Usage"

$dsusage.UseVisualStyleBackColor = $true

$dsusage.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false    

    $HALogs.Checked = $false    

 

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

   

})

 

# radiobutton  DS vSAN Usage

#

$dsvsanusage.AutoSize = $true

$dsvsanusage.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$dsvsanusage.Location = New-Object System.Drawing.Point(33, 66)

$dsvsanusage.Name = "dsvsanusage"

$dsvsanusage.Size = New-Object System.Drawing.Size(89, 17)

$dsvsanusage.TabIndex = 10

$dsvsanusage.TabStop = $true

$dsvsanusage.Text = "vSAN Datastore Usage"

$dsvsanusage.UseVisualStyleBackColor = $true

$dsvsanusage.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false       

    $HALogs.Checked = $false    

        

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

   

})

# radiobutton  CPU

#

$esxicpuutilization.AutoSize = $true

$esxicpuutilization.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$esxicpuutilization.Location = New-Object System.Drawing.Point(222, 43)

$esxicpuutilization.Name = "esxicpuutilization"

$esxicpuutilization.Size = New-Object System.Drawing.Size(89, 17)

$esxicpuutilization.TabIndex = 10

$esxicpuutilization.TabStop = $true

$esxicpuutilization.Text = " CPU Utilization"

$esxicpuutilization.UseVisualStyleBackColor = $true

$esxicpuutilization.Add_Click({

<#

    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false       

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

       

    

})

 

#

#

#

# radiobutton  Memory

#

$esximemoryutilization.AutoSize = $true

$esximemoryutilization.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$esximemoryutilization.Location = New-Object System.Drawing.Point(222, 66)

$esximemoryutilization.Name = "esximemoryutilization"

$esximemoryutilization.Size = New-Object System.Drawing.Size(89, 17)

$esximemoryutilization.TabIndex = 11

$esximemoryutilization.TabStop = $true

$esximemoryutilization.Text = " Memory Utilization"

$esximemoryutilization.UseVisualStyleBackColor = $true

$esximemoryutilization.Add_Click({

 

<#    $rmail.Visible = $false

    $radioButton1.Checked = $false   

    $radioButton2.Checked = $false   

    $radioButton3.Checked = $false   

    $radioButton4.Checked = $false

    $radioButton5.Checked = $false

    $license.Checked  = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $attach2.Enabled = $false       

    $HALogs.Checked = $false    

 #>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckVMsGroupSetting

})

 

#

#

# radioButton1

#

$radioButton1.AutoSize = $true

$radioButton1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$radioButton1.Location = New-Object System.Drawing.Point(33, 20)

$radioButton1.Name = "radioButton1"

$radioButton1.Size = New-Object System.Drawing.Size(97, 17)

$radioButton1.TabIndex = 0

$radioButton1.TabStop = $true

$radioButton1.Text = "Daily Health Check"

$radioButton1.UseVisualStyleBackColor = $true

$radioButton1.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false  

    $HALogs.Checked = $false    

    #>

 

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting

})

 

 

 

 

#

# radioButton2

#

$radioButton2.AutoSize = $true

$radioButton2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$radioButton2.Location = New-Object System.Drawing.Point(33, 43)

$radioButton2.Name = "radioButton2"

$radioButton2.Size = New-Object System.Drawing.Size(97, 17)

$radioButton2.TabIndex = 1

$radioButton2.TabStop = $true

$radioButton2.Text = "RvTools Report"

$radioButton2.UseVisualStyleBackColor = $true

$radioButton2.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false 

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting

})

 

#

# radioButton3

#

$radioButton3.AutoSize = $true

$radioButton3.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$radioButton3.Location = New-Object System.Drawing.Point(33, 66)

$radioButton3.Name = "radioButton3"

$radioButton3.Size = New-Object System.Drawing.Size(97, 17)

$radioButton3.TabIndex = 2

$radioButton3.TabStop = $true

$radioButton3.Text = "Snapshot Report"

$radioButton3.UseVisualStyleBackColor = $true

$radioButton3.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    

    $dsusage.Checked = $false  

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false 

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting

 

})

 

#

# radioButton4

#

$radioButton4.AutoSize = $true

$radioButton4.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$radioButton4.Location = New-Object System.Drawing.Point(222, 20)

$radioButton4.Name = "radioButton4"

$radioButton4.Size = New-Object System.Drawing.Size(97, 17)

$radioButton4.TabIndex = 3

$radioButton4.TabStop = $true

$radioButton4.Text = "No VMware Tools"

$radioButton4.UseVisualStyleBackColor = $true

$radioButton4.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false 

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

   

    $dsusage.Checked = $false

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false 

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting  

})

 

#

# radioButton5

#

$radioButton5.AutoSize = $true

$radioButton5.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$radioButton5.Location = New-Object System.Drawing.Point(222, 43)

$radioButton5.Name = "radioButton5"

$radioButton5.Size = New-Object System.Drawing.Size(97, 17)

$radioButton5.TabIndex = 3

$radioButton5.TabStop = $true

$radioButton5.Text = "OS Name"

$radioButton5.UseVisualStyleBackColor = $true

$radioButton5.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false 

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

 

    $dsusage.Checked = $false 

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false 

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting

})

#

# TemplateRadio

#

$TemplateRadio.AutoSize = $true

$TemplateRadio.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$TemplateRadio.Location = New-Object System.Drawing.Point(222, 63)

$TemplateRadio.Name = "TemplateRadio"

$TemplateRadio.Size = New-Object System.Drawing.Size(97, 17)

$TemplateRadio.TabIndex = 3

$TemplateRadio.TabStop = $true

$TemplateRadio.Text = "Template"

$TemplateRadio.UseVisualStyleBackColor = $true

$TemplateRadio.Add_Click({

<#

    $rmail.Visible = $false

    $esxicpuutilization.Checked = $false

    $esximemoryutilization.Checked = $false

    $license.checked = $false 

    $snapshotcreate.Checked = $false

    $snapshotdelete.Checked = $false

    $dsusage.Checked = $false 

    $dsvsanusage.Checked = $false

    $attach2.Enabled = $false 

    $HALogs.Checked = $false    

#>

Set-UncheckAttachmentTextbox

Set-UncheckvCenterGroupSetting

Set-UncheckMailStatus

Set-UncheckHostGroupSetting

})

 

#

#

# Checkbox vmmailcheckbox

#

$vmmailcheckbox.AutoSize = $true

$vmmailcheckbox.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$vmmailcheckbox.Location = New-Object System.Drawing.Point(330, 355)

$vmmailcheckbox.Name = "vmmailcheckbox"

$vmmailcheckbox.Size = New-Object System.Drawing.Size(89, 17)

$vmmailcheckbox.TabIndex = 16

$vmmailcheckbox.Text = "Mail Send.."

$vmmailcheckbox.UseVisualStyleBackColor = $true

 

 

# outputservername

#

$outputservername.AutoSize = $true

$outputservername.Location = New-Object System.Drawing.Point(19, 18)

$outputservername.Name = "outputservername"

$outputservername.Size = New-Object System.Drawing.Size(22, 13)

$outputservername.TabIndex = 0

$outputservername.Text = "VM"

#

# outputlogon

#

$outputlogon.AutoSize = $true

$outputlogon.Location = New-Object System.Drawing.Point(19, 45)

$outputlogon.Name = "outputlogon"

$outputlogon.Size = New-Object System.Drawing.Size(22, 13)

$outputlogon.TabIndex = 2

$outputlogon.Text = "Datastore"

#

# outputdatacenter

#

$outputdatacenter.AutoSize = $true

$outputdatacenter.Location = New-Object System.Drawing.Point(19, 73)

$outputdatacenter.Name = "outputdatacenter"

$outputdatacenter.Size = New-Object System.Drawing.Size(22, 13)

$outputdatacenter.TabIndex = 3

$outputdatacenter.Text = "Datacenter"

#

# outputcluster

#

$outputcluster.AutoSize = $true

$outputcluster.Location = New-Object System.Drawing.Point(19, 97)

$outputcluster.Name = "outputcluster"

$outputcluster.Size = New-Object System.Drawing.Size(35, 13)

$outputcluster.TabIndex = 4

$outputcluster.Text = "Cluster"

#

#

# outputhost

#

$outputhost.AutoSize = $true

$outputhost.Location = New-Object System.Drawing.Point(19, 124)

$outputhost.Name = "outputhost"

$outputhost.Size = New-Object System.Drawing.Size(35, 13)

$outputhost.TabIndex = 1

$outputhost.Text = "Host"

#

 

 

 

#

# ovCenterName

#

$ovCenterName.AutoSize = $true

$ovCenterName.Location = New-Object System.Drawing.Point(5, 18)

$ovCenterName.Name = "ovCenterName"

$ovCenterName.Size = New-Object System.Drawing.Size(22, 13)

$ovCenterName.TabIndex = 0

$ovCenterName.Text = "NA"

#

# oUserConnect

#

$oUserConnect.AutoSize = $true

$oUserConnect.Location = New-Object System.Drawing.Point(5, 45)

$oUserConnect.Name = "oUserConnect"

$oUserConnect.Size = New-Object System.Drawing.Size(22, 13)

$oUserConnect.TabIndex = 2

$oUserConnect.Text = "NA"

#

#

#

 

# oDomainName

#

$oDomainName.AutoSize = $true

$oDomainName.Location = New-Object System.Drawing.Point(5, 73)

$oDomainName.Name = "oDomainName"

$oDomainName.Size = New-Object System.Drawing.Size(22, 13)

$oDomainName.TabIndex = 3

$oDomainName.Text = "NA"

#

# oVersionName

#

$oVersionName.AutoSize = $true

$oVersionName.Location = New-Object System.Drawing.Point(5, 97)

$oVersionName.Name = "oVersionName"

$oVersionName.Size = New-Object System.Drawing.Size(35, 13)

$oVersionName.TabIndex = 4

$oVersionName.Text = "NA"

#

#

# oBuildversion

#

$oBuildversion.AutoSize = $true

$oBuildversion.Location = New-Object System.Drawing.Point(5, 124)

$oBuildversion.Name = "oBuildversion"

$oBuildversion.Size = New-Object System.Drawing.Size(35, 13)

$oBuildversion.TabIndex = 1

$oBuildversion.Text = "NA"

#

 

 

# Form1

#

$Form1.ClientSize = New-Object System.Drawing.Size(485, 527)

#$Form1.Controls.Add($brun)

$Form1.Controls.Add($bcancel)

$Form1.Controls.Add($rmail)

$Form1.Controls.Add($tabControl1)

$Form1.Controls.Add($menuStrip1)

$Form1.Name = "Form1"

$Form1.MaximizeBox = $false

$Form1.MinimizeBox = $false

$Form1.StartPosition = 'CenterScreen'

$Form1.Text = "VMware Automation Tools GUI"

 

 

#rohitcall

 

 

$Form2.ClientSize = New-Object System.Drawing.Size(300, 200)

$Form2.Name = "Form2"

$Form2.MaximizeBox = $false

$Form2.MinimizeBox = $false

$Form2.StartPosition = 'CenterScreen'

$Form2.Text = "Host Hardware Sensor"

$Form2.Controls.Add($HostNameCombo)

$Form2.Controls.Add($SelectHost)

$Form2.Controls.Add($CancelSensor)

$Form2.Controls.Add($HostSensorLabel)

$Form2.Controls.Add($HostSensorLabelName)

$Form2.Controls.Add($SelectHostSensorLabel2)

$Form2.Controls.Add($HWSensormailCheckBox)

$Form2.Controls.Add($HWSensorMailSent)

 

$Form2.Controls.Add($SelectHostSensorLabelName)

 

$HostSensorLabelName.AutoSize = $true

$HostSensorLabelName.Location = New-Object System.Drawing.Point(15, 20)

$HostSensorLabelName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HostSensorLabelName.Name = "hserver"

$HostSensorLabelName.ForeColor = [System.Drawing.Color]::Blue

 

$HostSensorLabelName.Size = New-Object System.Drawing.Size(38, 13)

$HostSensorLabelName.TabIndex = 6

$HostSensorLabelName.Text = "vCenter:-"

 

$HostSensorLabel.AutoSize = $true

$HostSensorLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HostSensorLabel.Location = New-Object System.Drawing.Point(70, 20)

$HostSensorLabel.Name = "lserver"

$HostSensorLabel.Size = New-Object System.Drawing.Size(38, 13)

$HostSensorLabel.TabIndex = 6

$HostSensorLabel.Text = "Server"

$HostSensorLabel.ForeColor = [System.Drawing.Color]::Magenta

 

 

 

 

 

$HostNameCombo.Location = New-Object System.Drawing.Point(15, 40)

$HostNameCombo.Name = "HostNameCombo"

$HostNameCombo.Size = New-Object System.Drawing.Size(163, 20)

$HostNameCombo.TabIndex = 0

$HostNameCombo.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList;

$HostNameCombo.add_SelectedValueChanged{

 

$SelectHostSensorLabelName.Visible = $true

$SelectHostSensorLabelName.Text = $HostNameCombo.Text

$HWSensorMailSent.Visible = $false

 

 

}

 

 

$SelectHostSensorLabel2.AutoSize = $true

$SelectHostSensorLabel2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$SelectHostSensorLabel2.Location = New-Object System.Drawing.Point(15, 70)

$SelectHostSensorLabel2.Name = "hnlserver"

$SelectHostSensorLabel2.ForeColor = [System.Drawing.Color]::Blue

$SelectHostSensorLabel2.Size = New-Object System.Drawing.Size(38, 13)

$SelectHostSensorLabel2.TabIndex = 6

$SelectHostSensorLabel2.Text = "You Selected Host:-"

 

 

$SelectHostSensorLabelName.AutoSize = $true

$SelectHostSensorLabelName.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$SelectHostSensorLabelName.Location = New-Object System.Drawing.Point(15, 90)

$SelectHostSensorLabelName.Name = "hnserver"

$SelectHostSensorLabelName.ForeColor = [System.Drawing.Color]::Magenta

$SelectHostSensorLabelName.Size = New-Object System.Drawing.Size(38, 13)

$SelectHostSensorLabelName.TabIndex = 6

$SelectHostSensorLabelName.Text = "Host"

$SelectHostSensorLabelName.Visible = $false

 

 

 

$SelectHost.Location = New-Object System.Drawing.Point(200, 40)

$SelectHost.Name = "SelectHost"

$SelectHost.Size = New-Object System.Drawing.Size(75, 23)

$SelectHost.TabIndex = 4

$SelectHost.Text = "Select Host"

$SelectHost.UseVisualStyleBackColor = $true

$SelectHost.Add_Click({

 

 

if( $HWSensormailCheckBox.Checked -eq $true){

Get-HostHardwareSensorStatus

Mail-SendReport

Write-Host "Mail Send..." -ForegroundColor Cyan

$HWSensorMailSent.Visible = $true

$HWSensormailCheckBox.Checked = $false

 

$HWSensorMailSent.Text = "Mail Send.."

Write-Host "Done" -ForegroundColor Yellow

 

}

else

 

{

 

Get-HostHardwareSensorStatus

$HWSensorMailSent.Visible = $true

$HWSensorMailSent.Text = "Mail Not Send.."

 

 

}

 

 

   

})

 

$HWSensormailCheckBox.AutoSize = $true

$HWSensormailCheckBox.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HWSensormailCheckBox.Location = New-Object System.Drawing.Point(200, 90)

$HWSensormailCheckBox.Name = "HWSensormailCheckBox"

$HWSensormailCheckBox.Size = New-Object System.Drawing.Size(89, 17)

$HWSensormailCheckBox.TabIndex = 16

$HWSensormailCheckBox.Text = "Mail Send.."

$HWSensormailCheckBox.UseVisualStyleBackColor = $true

 

 

 

 

 

 

 

$HWSensorMailSent.AutoSize = $true

$HWSensorMailSent.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point, 0)

$HWSensorMailSent.Location = New-Object System.Drawing.Point(15, 140)

$HWSensorMailSent.Name = "MailSend"

$HWSensorMailSent.ForeColor = [System.Drawing.Color]::Green

$HWSensorMailSent.Size = New-Object System.Drawing.Size(38, 13)

$HWSensorMailSent.TabIndex = 6

$HWSensorMailSent.Text = "Status.."

$HWSensorMailSent.Visible = $false

 

 

 

$CancelSensor.Location = New-Object System.Drawing.Point(200, 140)

$CancelSensor.Name = "CancelSensor"

$CancelSensor.Size = New-Object System.Drawing.Size(75, 23)

$CancelSensor.TabIndex = 2

$CancelSensor.Text = "Cancel"

$CancelSensor.UseVisualStyleBackColor = $true

$CancelSensor.DialogResult = 'Cancel'

$CancelSensor.Add_Click({

   

#    Remove-Variable HostHwsensor -Force -ErrorAction SilentlyContinue

    $HostHwsensor.Checked = $false

    $HostNameCombo.Items.Clear()

    $Form2.Close()

   

    

})

#>

 

 

#& "$PSScriptRoot\Users\rovis\Documents\SAP-RvTool\My-Script\Working-Script\Powershell-GUI\SubFunction.ps1"

 

$Form1.add_FormClosing({

if ($Global:con.IsConnected){ 

        Disconnect-VIServer $Global:con  -Confirm:$false

        }

    })

 

 

 

$Form1.ShowDialog()

# Release the Form

 

 

#$Form1.Dispose()

  
