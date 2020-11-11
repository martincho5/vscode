$Attachment = "c:\Tools\Archivos.csv"
$DateToCompare = (Get-date).AddDays(-1)
Get-Childitem d:\Webroot\ –recurse | where-object {$_.lastwritetime –gt $DateToCompare} | Export-CSV $Attachment
Send-MailMessage -from "CACAWUATE <XXX@domain>" -to "XXX <XX@domain>" -subject "Archivos Modificados Ayer" -body "Attach con los archivos modificados ayer." -Attachment $Attachment -smtpServer aspmail.uade.edu.ar