Buscar el usuario Administrador del Dominio
Get-ADUser -Filter * | Where-Object {$_.Sid -Like "*-500"}
Tomar de un archivo los servidores y ver cual tiene remoting activado
Import-CSV "F:\Servidores.csv" | %{ echo $_.Server; Test-WSMan -Computer $_.Server}