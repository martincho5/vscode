Get-ChildItem -Recurse | where { ! $_.PSIsContainer } | % {  
$a = [System.IO.File]::ReadAllBytes($_.FullName);

$header = "{0:X2}" -f $a[0]
$header += "{0:X2}" -f $a[1]

If ($header -eq "4D5A") {Write-Host $_.FullName
Write-Host "File contains an EXE header."}
}