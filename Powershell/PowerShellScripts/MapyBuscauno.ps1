New-PSDrive -Name I -PSProvider FileSystem -root \\BRYDE3\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195"| Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE3results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\BRYDE4\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195"| Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE4results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\BRYDE2\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195"| Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE2results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\BRYDE1\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE1results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\CACHALOTE1\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE1results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\CACHALOTE2\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE2results.csv
D:
Remove-PSDrive I
New-PSDrive -Name I -PSProvider FileSystem -root \\CACHALOTE3\C$\Windows\System32\Logfiles
I:
Get-ChildItem -recurse | Select-String -pattern "200.49.193.195" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE3results.csv
D:
Remove-PSDrive I