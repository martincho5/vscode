$Attachment = "c:\Tools\Archivos.csv"
$DateToCompare = (Get-date).AddDays(-1)
Get-Childitem –recurse | where-object {$_.lastwritetime –gt $DateToCompare} | Export-CSV $Attachment
Send-MailMessage -from "CACAWUATE <cachalote@uade.edu.ar>" -to "Martincho <mferrini@uade.edu.ar>" -subject "Archivos Modificados Ayer" -body "Attach con los archivos modificados ayer." -Attachment $Attachment -smtpServer aspmail.uade.edu.ar
