# Conectarse al tenant e importar los comandos para Exchange
# Previamente tiene que estar instalado el módulo MSOnline

$credential = Get-Credential
Import-Module MsOnline
connect-msolservice –credential $credential
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" –AllowRedirection
Import-PSSession $exchangeSession -DisableNameChecking

(Get-ADGroup -Identity "PIA_ALUMNO" -Properties Members).Members | Get-ADUser | Select UserPrincipalName | Export-Csv "d:\Temp\alumnos.csv"
Import-Csv “d:\Temp\alumnos.csv” | foreach {Add-UnifiedGroupLinks -Identity “USRALUMNOS” -Links $_.UserPrincipalName -LinkType Members}


Set-UnifiedGroupLinks -Identity “USRALUMNOS” -HiddenFromAddressListsEnabled $true 


(Get-UnifiedGroupLinks -Identity "USRALUMNOS" -LinkType Members -ResultSize Unlimited).Count

