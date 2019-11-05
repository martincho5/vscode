#
# Script para verificar sitio web www.uade.edu.ar
# Desarrollado por: Martín Ferrini
# Version: 1.0
# Última modificación: 30/06/2015
#

$web = New-Object Net.WebClient
$websites = Get-Content "D:\Temp\websites.txt"
ForEach ($webpage in $websites) {
$output = $web.DownloadString($webpage)
$peso = ($web.DownloadString($webpage)).length
    if ($peso -lt 100000) {
        $EmailSubject = "No Anda la web de UADE en " + $webpage
        Send-MailMessage -from "CACAWUATE <cachalote@uade.edu.ar>" -to "Martincho <mferrini@uade.edu.ar>" -subject $EmailSubject  -body $output -smtpServer aspmail.uade.edu.ar
        }
}