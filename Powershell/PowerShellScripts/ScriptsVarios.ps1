Get-ChildItem C:\Windows\system32\ -Recurse | ? { $_.Versioninfo.OriginalFilename -contains 'cmd.exe' } | fl VersionInfo 

Get-ChildItem C:\Windows\system32\sethc* | ? { $_.Versioninfo.OriginalFilename -contains 'cmd.exe'} | fl VersionInfo
Set-Service Remoteregistry -StartupType Disabled
Stop-Service Remoteregistry

Get-EventLog -LogName Security -InstanceID 682 | Where-Object { $_.message -match 'bvenning' } | Format-List -Property *
Get-EventLog -LogName Security -InstanceID 682 | Where-Object { $_.message -match 'SABATO' } | Format-List -Property *