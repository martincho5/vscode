Get-ChildItem "F:\Temp\LogsPigmea" | ? {$_.extension -eq ".log"} | Select-String -Pattern error -AllMatches -SimpleMatch | group path | Select Count, Name, @{Name=’Group’;Expression={$_.Group[0]}} | Sort-Object -Property Count | Export-CSV Logs.csv

| group path | Select Count, Name, @{Name=’Group’;Expression={[string]::join(“;”, ($_.Group))}} | Export-CSV Logs.csv

| Select-String -Pattern error -AllMatches -SimpleMatch | Sort-Object -Unique