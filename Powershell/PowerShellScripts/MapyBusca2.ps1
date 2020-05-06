New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191"| Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE3results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE4\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE4results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE2results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE1results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE1results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp", "shell.asp" ,"190.192.245.191" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE2results2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "jcancela" , "config.asp" , "shell.asp" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE3results2.csv
D:
Remove-PSDrive J