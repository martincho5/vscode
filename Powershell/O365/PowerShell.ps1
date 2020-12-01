Install-Module -Name AzureAD
Connect-AzureAD
(Get-AzureADUser -SearchString mbuzzetti).AssignedPlans

(Get-AzureADUser -SearchString ggironte).AssignedPlans



$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
New-ComplianceSearchAction -SearchName "Phishing3" -Purge -PurgeType SoftDelete
Get-ComplianceSearchAction