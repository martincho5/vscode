New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE3blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE4\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE4blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE2blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE1blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE1blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE2blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "blanco.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE3blanco2.csv
D:
Remove-PSDrive J