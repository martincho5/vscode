New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE3blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE4\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE4blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE2blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\BRYDE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\BRYDE1blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE1\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE1blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE2\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE2blanco2.csv
D:
Remove-PSDrive J
New-PSDrive -Name J -PSProvider FileSystem -root \\CACHALOTE3\C$\Windows\System32\Logfiles
J:
Get-ChildItem -recurse | Select-String -pattern "POST /blanco.asp","190.242.75.180","192.240.114.82","201.140.212.131","201.140.212.142","181.15.149.157","190.18.98.149","10.100.118.28" | Select Line, Filename | Export-CSV -NoTypeInformation -Path D:\temp\CACHALOTE3blanco2.csv
D:
Remove-PSDrive J