$dir = Get-ChildItem -Path "F:\Temp\LogsPigmea" -Exclude *bin, *txt, *csv, *xls*
foreach($f in $dir) {(Get-Content $f.FullName) | Add-Content .\Full.txt}