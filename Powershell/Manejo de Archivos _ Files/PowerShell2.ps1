Get-ChildItem C:\Windows\system32\ -Recurse | ? { $_.Versioninfo.OriginalFilename -contains 'cmd.exe' } | fl VersionInfo 

Get-ChildItem C:\Windows\system32\sethc* | ? { $_.Versioninfo.OriginalFilename -contains 'cmd.exe'} | fl VersionInfo
Set-Service Remoteregistry -StartupType Disabled
Stop-Service Remoteregistry

Get-EventLog -LogName Security -InstanceID 682 | Where-Object { $_.message -match 'bvenning' } | Format-List -Property *
Get-EventLog -LogName Security -InstanceID 682 | Where-Object { $_.message -match 'SABATO' } | Format-List -Property *
Get-EventLog -LogName Security -InstanceID 682 | Select-Object Timegenerated, EntryType, MachineName, Message -AutoSize| Export-Csv c:\tools\Log.csv -NoTypeInformation

Get-EventLog -LogName Security -InstanceID 682 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *

Get-EventLog -COMPUTERNAME XX1 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX2 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX3 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX1 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX2 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX3 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *
Get-EventLog -COMPUTERNAME XX4 -LogName Security -InstanceID 538 | Where-Object { $_.message -match 'sdopazo' } | Format-List -Property *


Get-EventLog -LogName Security -InstanceID 4724, 627, 628, 4723 | Select-Object EventID, MachineName, Message, TimeGenerated | Export-Csv d:\temp\event.csv

192.168.135.0    255.255.255.0      172.16.31.1       1