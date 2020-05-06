### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "D:\webroot"
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER A EVENT IS DETECTED
    $action = { $path = $Event.SourceEventArgs.FullPath
                $changeType = $Event.SourceEventArgs.ChangeType
                $logline = "$(Get-Date), $changeType, $path"
                if ($changeType -like "Renamed" -or $changeType -like "Created"-or $changeType -like "Changed") {
                    $nombrearchivo = Split-Path $path -Leaf
                    $fecha = Get-Date -Format d.M.yyyy.HH.mm
                    $savepath = "C:\Tools\"
                    $fullnamepath = $savepath + $fecha + $nombrearchivo 
                    Copy-Item $path -Destination $fullnamepath -Force
                }
                Add-content "C:\Tools\log.txt" -value $logline
              }    
### DECIDE WHICH EVENTS SHOULD BE WATCHED + SET CHECK FREQUENCY  
    $created = Register-ObjectEvent $watcher "Created" -Action $action
    $changed = Register-ObjectEvent $watcher "Changed" -Action $action
    $deleted = Register-ObjectEvent $watcher "Deleted" -Action $action
    $renamed = Register-ObjectEvent $watcher "Renamed" -Action $action
    while ($true) {sleep 5}