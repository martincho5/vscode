###########################################################################
#
# The following are examples for scripting KeePass with PowerShell.
#
# For KeePass object classes, see:
#        http://keepassps.codeplex.com/SourceControl/latest#keepass.ps1
#
# Version: 1.0
#  Author: Enclave Consulting LLC, Jason Fossen
#   Legal: Public domain.  Script provided "AS IS" without warranties or
#          or guarantees of any kind.  Use at your own risk.
###########################################################################





###########################################################################
#
# Helper Function: Convert secure string back into plaintext
#
###########################################################################

Function Convert-FromSecureStringToPlaintext ( $SecureString )
{
    [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString))
}



###########################################################################
#
# Load the classes from KeePass.exe:
#
###########################################################################
$KeePassProgramFolder = Dir C:\'Program Files (x86)'\KeePass* | Select-Object -Last 1 
$KeePassEXE = Join-Path -Path $KeePassProgramFolder -ChildPath "KeePass.exe"
[Reflection.Assembly]::LoadFile($KeePassEXE) 




###########################################################################
#
# To open a KeePass database, the decryption key is required, and this key
# may be a constructed from a password, key file, Windows user account, 
# and/or other information sources.  
#
###########################################################################

# $CompositeKey represents a key, possibly constructed from multiple sources of data.
# The other key-related objects are added to this, the composite key.
$CompositeKey = New-Object -TypeName KeePassLib.Keys.CompositeKey  #From KeePass.exe
 
# The currently logged on Windows user account can be added to a composite key. 
$KcpUserAccount = New-Object -TypeName KeePassLib.Keys.KcpUserAccount  #From KeePass.exe

# A key file can be added to a composite key.
$KeyFilePath = 'F:\OutlookStuff\KeePassDatabase_DO_NOT_DELETE.keyfile' 
$KcpKeyFile = New-Object -TypeName KeePassLib.Keys.KcpKeyFile($KeyFilePath)

# A password can be added to a composite key.
$Password = Read-Host -Prompt "Enter passphrase" -AsSecureString 
$Password = Convert-FromSecureStringToPlaintext -SecureString $Password
$KcpPassword = New-Object -TypeName KeePassLib.Keys.KcpPassword($Password) 

# Add the Windows user account key to the $CompositeKey:
#$CompositeKey.AddUserKey( $KcpUserAccount ) 
$CompositeKey.AddUserKey( $KcpPassword ) 
$CompositeKey.AddUserKey( $KcpKeyFile ) 



###########################################################################
#
# To open a KeePass database, the path to the .KDBX file is required.
#
###########################################################################

$IOConnectionInfo = New-Object KeePassLib.Serialization.IOConnectionInfo
$IOConnectionInfo.Path = 'F:\OutlookStuff\KeePass2Database_DO_NOT_DELETE.kdbx'



###########################################################################
#
# To open a KeePass database, an object is needed to record status info.
# In this case, the progress status information is ignored.
#
###########################################################################

$StatusLogger = New-Object KeePassLib.Interfaces.NullStatusLogger



###########################################################################
#
# Open the KeePass database with key, path and logger objects.
# $PwDatabase represents a KeePass database.
#
###########################################################################

$PwDatabase = New-Object -TypeName KeePassLib.PwDatabase  #From KeePass.exe
$PwDatabase.Open($IOConnectionInfo, $CompositeKey, $StatusLogger)



###########################################################################
#
# List the entries from a particular group named 'Websites-1'.
#
###########################################################################

$Group = $PwDatabase.RootGroup.Groups | Where { $_.Name -eq 'Websites-1' } 

$Group.GetEntries($True) |
ForEach { $_.Strings.ReadSafe("Title") + " : " + $_.Strings.ReadSafe("UserName") } 



###########################################################################
#
# Add an entry to the database.
#
###########################################################################

function New-KeePassEntry ( $TopLevelGroupName, $Title, $UserName, $Password, $URL, $Notes )
{
    # This only works for a top-level group, not a nested subgroup:
    $PwGroup = $PwDatabase.RootGroup.Groups | where { $_.name -eq $TopLevelGroupName }  
    
    # The $True arguments allow new Uuid and timestamps to be created automatically:
    $PwEntry = New-Object -TypeName KeePassLib.PwEntry( $PwGroup, $True, $True ) 

    # Protected strings are encrypted in memory:
    $Title = New-Object KeePassLib.Security.ProtectedString($True, $Title)
    $User = New-Object KeePassLib.Security.ProtectedString($True, $UserName)
    $PW = New-Object KeePassLib.Security.ProtectedString($True, $Password)
    $URL = New-Object KeePassLib.Security.ProtectedString($True, $URL)
    $Notes = New-Object KeePassLib.Security.ProtectedString($True, $Notes)

    $PwEntry.Strings.Set("Title", $Title)
    $PwEntry.Strings.Set("UserName", $User)
    $PwEntry.Strings.Set("Password", $PW)
    $PwEntry.Strings.Set("URL", $URL)
    $PwEntry.Strings.Set("Notes", $Notes)

    $PwGroup.AddEntry($PwEntry, $True)

    # Notice that the database is saved!
    $StatusLogger = New-Object KeePassLib.Interfaces.NullStatusLogger
    $PwDatabase.Save($StatusLogger) 

}


New-KeePassEntry -TopLevelGroupName 'Wireless' -Title 'Testing88' -UserName "UserTest99" -Password "Pazzwurd" -URL "http://www.sans.org/sec505" -Notes "Some notes here."   



###########################################################################
#
# List all entries.
#
###########################################################################

$PwDatabase.RootGroup.GetEntries($True) |
ForEach { $_.Strings.ReadSafe("Title") + " : " + $_.Strings.ReadSafe("UserName") } 



###########################################################################
#
# Close the open database.
#
###########################################################################

$PwDatabase.Close()

 


