Add-Type -Path "C:\Oracle\Oracle.ManagedDataAccess.dll"

$query = "SELECT B.NYA, B.DEPARTAMENTO, B.SECCION, B.DEPTOUBICA, SUBSTR(P.""usuarioRed"", LENGTH('UADE\') + 1) AS USUARIO, B.CATEGORIAEMP
FROM (
    SELECT *
    FROM BUXIS.VW_DEPTO_SEC_PERS_BIS FT
    WHERE UPPER(FT.CATEGORIAEMP) = 'ADMINISTRATIVO' OR UPPER(FT.CATEGORIAEMP) = 'DOCENTE FUNCIONAL'
    UNION
    SELECT *
    FROM BUXIS.VW_DEPTO_SEC_PERS_BIS PT
    WHERE UPPER(PT.CATEGORIAEMP) = 'DOCENTE HORARIO'
    AND NOT EXISTS (SELECT * FROM BUXIS.VW_DEPTO_SEC_PERS_BIS FT2
                    WHERE (UPPER(FT2.CATEGORIAEMP) = 'ADMINISTRATIVO' OR UPPER(FT2.CATEGORIAEMP) = 'DOCENTE FUNCIONAL')
                    AND FT2.IDPERSONA = PT.IDPERSONA) 
)B
JOIN PIA.""AP_Perso"" P
ON P.""id"" = B.IDPERSONA 
AND P.""usuarioRed"" IS NOT NULL
AND P.""id"" NOT IN (820903, 501397, 829650, 829651, 829652, 829655, 965335) -- miembros CA --
UNION
SELECT PERSO.""apellido"" || ', ' || PERSO.""nombre"" AS NYA, DEPAR.""nombre"" AS DEPARTAMENTO,
    NULL AS SECCION, NULL AS DEPTOUBICA, 
    SUBSTR(PERSO.""usuarioRed"", LENGTH('UADE\') + 1) AS USUARIO, 'Pasante' AS CATEGORIAEMP 
FROM ""AP_Perso"" PERSO
JOIN ""AP_TipPe"" TIPPE 
    ON ( TIPPE.""personaId"" = PERSO.""id"" AND TIPPE.""tipo"" = 53 )
JOIN ""EA_Depar"" DEPAR 
    ON ( DEPAR.""id"" = TIPPE.""departamentoId"" ) 
WHERE TIPPE.""tipoExterno"" = 35377 
    AND TRUNC(TIPPE.""fechaHasta"") >= TRUNC(SYSDATE) 
    AND TIPPE.""estado"" = 101 "

$connectionString = 'User ID=zzzz;Password=passrod;Data Source=(DESCRIPTION=
    (LOAD_BALANCE=yes)
    (ADDRESS_LIST=
      (ADDRESS=
        (PROTOCOL=TCP)
        (HOST=servidores)
        (PORT=1521)
      )
    )
    (CONNECT_DATA=
      (SERVER=dedicated)
      (SERVICE_NAME=PIA)
    )
  )'
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionString)
$fecha = Get-Date
$fechaInicio = 'Comienzo script ' + $fecha 
$pathLog = "C:\Procesos\LOGS\ActualizaGAL\LogActualizaGAL.txt"
Add-Content -Path $pathLog -Value $fechaInicio
$cuerpoMail = $fechaInicio + "<br>"
$pathUsers = "C:\Procesos\LOGS\ActualizaGAL\LogUsuarios.txt"
try{
    $connection.open()
}
catch{
    Add-Content -Path $pathLog -Value $_
    $cuerpoMail = $cuerpoMail + $_ + "<br>"
}
$command=$connection.CreateCommand()
$command.CommandText=$query
try{
    $reader=$command.ExecuteReader()
}
catch{
    Add-Content -Path $pathLog -Value $_
    $cuerpoMail = $cuerpoMail + $_ + "<br>"
}

while ($reader.Read()) {
    try{
        $nombre = $reader.GetString(0)
        $usuario = $reader.GetString(4)
        $tipoemp = $reader.GetString(5)
        $departamento = ''
        $seccion = ''
        $ubicacion = ''
        if(!($reader.IsDBNUll(1))) { 
            $departamento = $reader.GetString(1) 
            Set-ADUser -Identity $usuario -Department $departamento           
        }
        
        if(!($reader.IsDBNUll(2))) { 
            $seccion = $reader.GetString(2)
            Set-ADUser -Identity $usuario -Office $seccion            
        }
        
        if(!($reader.IsDBNUll(3))) { 
            $ubicacion = $reader.GetString(3)
            Set-ADUser -Identity $usuario -StreetAddress $ubicacion            
        }
        
        Set-ADUser -Identity $usuario -Add @{extensionAttribute7 = "GAL"}
        $agrabar = $nombre + '; ' + $usuario + '; ' + $tipoemp + '; ' + $departamento + '; ' + $seccion + '; ' + $ubicacion
        Add-Content -Path $pathUsers -Value $agrabar
    }
    catch{
        Add-Content -Path $pathLog -Value $_
        Add-Content -Path $pathLog -Value $usuario
        $cuerpoMail = $cuerpoMail + $_ + " "
        $cuerpoMail = $cuerpoMail + $usuario + "<br>"
    }
}
$connection.Close()
$fecha = Get-Date
$fechaFin = 'Fin script ' + $fecha 
Add-Content -Path $pathLog -Value $fechaFin
$cuerpoMail = $cuerpoMail + $fechaFin
#Send-MailMessage -From "Procesos <procesos@xxx.xx.xx>" -To "Tecnologia <tecnologia1@xxx.xx.xx>" -Subject "Proceso actualizacion GAL" -Body "Finalizo el proceso para actualizar la GAL" -Attachments C:\Procesos\LOGS\ActualizaGAL\LogActualizaGAL.txt -Priority High -dno onSuccess, onFailure -SmtpServer "aspmail.xxx.xx.xx"
Send-MailMessage -From "Procesos <procesos@xxx.xx.xx>" -To "Tecnologia <tecnologia1@xxx.xx.xx>" -Subject "Proceso actualizacion GAL" -Body $cuerpoMail -BodyAsHtml -Priority High -dno onSuccess, onFailure -SmtpServer "aspmail.xxx.xx.xx"
