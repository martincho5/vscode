Get-ChildItem 'D:\Webroot' -Recurse | Sort {$_.LastWriteTime} | select -last 1



Get-ChildItem 'D:\Webroot' -Recurse -Exclude *.txt, *.xls, *.html, *.pdf, *.jpg | Sort {$_.LastWriteTime} | select -last 80

Get-ChildItem C:\ -Recurse -force -filter "*.rdp"| Where-Object {$_.mode -match "h"}