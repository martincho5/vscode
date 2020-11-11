Get-WmiObject -Class Win32_PerfFormattedData_W3SVC_WebService -ComputerName XX1 | Where {$_.Name -eq "_Total"} | % {$_.CurrentConnections}

Get-WmiObject -Class Win32_PerfFormattedData_W3SVC_WebService -ComputerName XX2 | Where {$_.Name -eq "Webcampus2"} | % {$_.CurrentConnections}