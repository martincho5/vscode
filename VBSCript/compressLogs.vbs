WScript.Echo "Press to start zipping log files."

Dim objFs
' Dim objFsCheck
Dim objFolder
Dim objSubFolder
Dim objFile
Dim objWShell
Set objWShell = CreateObject("WScript.Shell")
Set objFs = CreateObject("Scripting.FileSystemObject")
Set objFsCheck = CreateObject("Scripting.FileSystemObject")

strLogPath = "V:\LOGSIIS"

'If objFs.FolderExists(strLogPath) Then
     Wscript.Echo strLogPath
     Set objFolder = objFs.GetFolder(strLogPath)
     
     For Each objSubFolder in objFolder.subFolders
        Wscript.Echo strLogPath & objSubFolder.Name
     Next
'End If

WScript.Echo "Zip Successful."