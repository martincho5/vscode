Get-ChildItem c:\ -Recurse | ? { $_.Versioninfo.OriginalFilename -match "uade.exe|oemsetup.exe|startup.exe|psexec.c|admin" } | fl VersionInfo
Get-ChildItem d:\ -Recurse | ? { $_.Versioninfo.OriginalFilename -match "uade.exe|oemsetup.exe|startup.exe|psexec.c" } | fl VersionInfo

Get-ChildItem D:\ -Recurse | ? { $_.Versioninfo.OriginalFilename -contains 'uade.exe' } | fl VersionInfo

Get-ChildItem C:\Windows\notepad.exe | Format-List VersionInfo

Get-ChildItem c:\windows\system32\sethc.exe | Format-List VersionInfo