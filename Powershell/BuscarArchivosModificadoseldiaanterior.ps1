# Busca todos los archivos modificados el día anterior
$DateToCompare = (Get-date).AddDays(-1)
Get-Childitem –recurse | where { ! $_.PSIsContainer } | where-object {$_.lastwritetime –gt $DateToCompare}

