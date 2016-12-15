####################################################################################
#@author - Jerome Themee
#@version - 1.0
#date - 12/15/2015
####################################################################################

$client = New-Object System.Net.WebClient
$client.DownloadFile('http://devup.fr')
$client 