describe 'Check Server'{
    context 'checking windows feature'{
        it 'Making sure AD domain sevices is installed'{
            $domain=Invoke-Command -ComputerName server01 -ScriptBlock {
                    Get-WindowsFeature -Name AD-Domain-Services
            }
        }


    }
    context 'checking windows feature'{
        it 'Making sure windows update service is running'
    }
}
