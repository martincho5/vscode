$SB={ Start-Process -FilePath 'wusa.exe' -ArgumentList "C:\temp\Windows6.1-KBxxxxx-x64.msu /extract C:\temp\" -Wait -PassThru }
    
Invoke-Command -ComputerName testcomputer -ScriptBlock $SB

$SB={ Start-Process -FilePath 'dism.exe' -ArgumentList "/online /add-package /PackagePath:C:\temp\KBxxxxxx.cab" -Wait -PassThru }

Invoke-Command -ComputerName testcomputer -ScriptBlock $SB