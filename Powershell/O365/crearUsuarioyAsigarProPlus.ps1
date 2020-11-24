Import-Module MSONLINE
Connect-MsolService

$AccountSkuId = "uadeeduar:STANDARDWOFFPACK_FACULTY"
$LicenseOptions = New-MsolLicenseOptions -AccountSkuId $AccountSkuId

"Importando lista de usuarios"
$Users = Import-Csv C:\alumnos.csv
"Carga completa"

"Empezando asignacion"
$Users | ForEach-Object {

New-MsolUser -UserPrincipalName $_.USUARIO -DisplayName $_.DisplayName -FirstName $_.NOMBRE -LastName $_.APELLIDO -Password $_.DNI -StrongPasswordRequired 0 -ForceChangePassword 1 -Department $_.U_ACADEMICA -UsageLocation "AR" -LicenseAssignment $AccountSkuId

"Usuario creado: " + $_.UserPrincipalName
}
"Asignacion Finalizada"