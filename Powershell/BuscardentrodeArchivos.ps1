# Para buscar dentro de Archivos un patron
Get-ChildItem -recurse | Select-String -pattern "UPLSave" | group path | select name
Get-ChildItem -recurse | Select-String -pattern "if request" | Export-CSV c:\
Get-ChildItem -recurse | Select-String -pattern "ASPX Shell by LT" | Export-CSV d:\
Get-ChildItem -recurse | Select-String -pattern "186.138.18.37" 
Get-ChildItem -recurse | Select-String -pattern "powershell" | Export-CSV d:\sabato.csv
Get-ChildItem -recurse | Select-String -pattern "192.168.64" | Export-CSV d:\sabato.csv

