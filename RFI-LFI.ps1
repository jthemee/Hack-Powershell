####################################################################################
#@author - Jerome Themee
#@version - 1.0
#date - 12/15/2015
####################################################################################

Begin {
    $web = New-Object System.Net.WebClient
    $flag = $false
    }
Process {
    While ($flag -eq $false) {
        Try {
            $url = read-host "entrez l'URL du SITE"
            $web.DownloadString($url)
            $flag = $True
            }
        Catch {
            Write-host -fore Red -nonewline "Access down..."
            }
        }
    }    
End {
    Write-Host -fore Green "Access is back"
    }