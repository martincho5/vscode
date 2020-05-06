New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE3posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE4\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE4posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE2posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE1posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE1posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE2posts1.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE3posts1.csv
D:
Remove-PSDrive J