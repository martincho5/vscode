Get-ChildItem -recurse | Select-String -pattern "UPLSave" | group path | select name
Get-ChildItem -recurse | Select-String -pattern "if request" | Export-CSV c:\
Get-ChildItem -recurse | Select-String -pattern "ASPX Shell by LT"
Get-ChildItem -recurse | Select-String -pattern "186.138.18.37"
Get-ChildItem -recurse | Select-String -pattern "2015-07-01 09:02:36"
Get-ChildItem -recurse | Select-String -pattern "190.0.163.43" , "186.138.18.37" , "181.228.179.131", "181.170.232.14" , "192.240.114.82" , "200.16.89.156" , "201.252.78.15"
