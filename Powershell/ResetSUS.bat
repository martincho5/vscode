Rem - Batch script to delete duplicate SusClientIDs 
Rem - Implement this script as a "Startup" or "Logon"  script 
Rem - Script creates an output file called %Systemdrive%\SUSClientID.log 
Rem - If the %Systemdrive%\SUSClientID.log is already present, then the script simply exits

@Echo off 
if exist %systemdrive%\SUSClientID.log goto end 
net stop wuauserv 
net stop bits 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f  > %systemdrive%\SUSClientID.log 2>&1 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f  >> %systemdrive%\SUSClientID.log 2>&1 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f  >> %systemdrive%\SUSClientID.log 2>&1 
net start wuauserv 
wuauclt.exe /resetauthorization /detectnow          
:end 
exit