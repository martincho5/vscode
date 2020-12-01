$Computers = Get-ADComputer -Filter 'OperatingSystem -eq "Windows 7 Professional"'
$LogPath = "\\excaliber\shared\brad\reports"

$Log = @()
ForEach ($Computer in $Computers.name)
    { ForEach ($Drive in "C","D")
       {   $Log  = ForEach ($PST in ($PSTS = Get-ChildItem -path ("\\" "$Computer" "\" "$Drive" "$\") -Include *.pst -Exclude internet* -Recurse -Force -erroraction silentlycontinue))
          {   New-Object PSObject -Property @{
              ComputerName = $Computer
              Path = $PST.DirectoryName
              FileName = $PST.BaseName
              Size = "{0:N2} MB" -f ($PST.Length / 1mb)
              Date = $PST.LastWriteTime                      
              }
           }
        }
     }   
        

$Log | Export-Csv $LogPath\PSTLocation.csv -NoTypeInformation



