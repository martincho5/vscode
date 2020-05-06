Remove-WSManInstance winrm/config/Listener -SelectorSet @{Address="*";Transport="http"}
New-WSManInstance winrm/config/Listener -SelectorSet @{Address="IP:172.16.31.101";Transport="http"}

TrustedHosts es solo cuando te queres conectar desde una maquina que no está dentro del domino

Cd WSMan:\localhost\client
Set-Item –Path TrustedHosts –Value * –Force