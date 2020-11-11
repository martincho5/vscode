$fecha = Get-Date
$fechaInicio = 'Comienzo script ' + $fecha 
Add-Content -Path "C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt" -Value $fechaInicio
try{
    Get-ADGroupMember -Identity 'DocentesHorarios' -Server 'ServerDC.xxx.xx.xx' | ForEach-Object {Remove-ADGroupMember "DocentesHorarios" $_ -Confirm:$false}
}
catch{
    Add-Content -Path "C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt" -Value $_
}
Add-Type -Path "C:\Oracle\Oracle.ManagedDataAccess.dll"
$query = "select a.portal_usuario, a.cedide_mf
from maefunc_tbl_persona a, maefunc_tbl_posiciones b
where a.cod_mf=b.cod_mf 
and a.fecha_efectiva=(select max(a1.fecha_efectiva) from maefunc_tbl_persona a1 where a1.cod_mf=a.cod_mf)
and b.fecha_efectiva=(select max(b1.fecha_efectiva) from maefunc_tbl_posiciones b1 where b1.cod_mf_pos=b.cod_mf_pos)
and b.clasif_emp='P'
and b.fec_egr_mf is null
and b.fec_desv_mf is null"
$connectionString = 'User ID=segapp;Password=a3ara3a;Data Source=(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = xxx.xxx.xxx)(PORT = 1521))
   (LOAD_BALANCE = yes)
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = PIA)
    )
  )'
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionString)
$cuerpoMail = $fechaInicio + "<br>"
try{
    $connection.open()
}
catch{
    Add-Content -Path "C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt" -Value $_
    $cuerpoMail = $cuerpoMail + $_ + "<br>"
}
$command=$connection.CreateCommand()
$command.CommandText=$query
$reader=$command.ExecuteReader()
while ($reader.Read()) {
    try{
        $usuario = $reader.GetString(0);
        #Set-ADUser -Identity $usuario -Add @{extensionAttribute2 = $reader.GetString(1)}
        Add-ADGroupMember DocentesHorarios $reader.GetString(0) 
    }
    catch{
        Add-Content -Path "C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt" -Value $_
        $cuerpoMail =$cuerpoMail + $_ + "<br>"
    }
}
$connection.Close()
$fecha = Get-Date
$fechaFin = 'Fin script ' + $fecha 
$cuerpoMail = $cuerpoMail + $fechaFin
Add-Content -Path "C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt" -Value $fechaFin
Send-MailMessage -From "Procesos <procesos@xxx.xx.xx>" -To "Tecnologia <tecnologia1@xxx.xx.xx>" -Subject "Proceso poblar grupo AD Docentes Horarios" -Body $cuerpoMail -BodyAsHtml -Priority High -dno onSuccess, onFailure -SmtpServer "aspmail.xxx.xx.xx"
#Send-MailMessage -From "Procesos <procesos@xxx.xx.xx>" -To "dgarraffo@xxx.xx.xx" -Subject "Proceso poblar grupo AD Docentes Horarios" -Body $cuerpoMail -Attachments C:\Procesos\LOGS\GrupoADDocentesHorarios\LogADGrupoDocHorarios.txt -Priority High -dno onSuccess, onFailure -SmtpServer "aspmail.xxx.xx.xx"
