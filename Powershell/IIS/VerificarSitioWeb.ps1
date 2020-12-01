$web = New-Object Net.WebClient
$web | Get-Member
$web.DownloadString("http://uade-c/")
"{0} bytes" -f ($web.DownloadString("http://uade-c/")).length.toString("###,###,##0")
