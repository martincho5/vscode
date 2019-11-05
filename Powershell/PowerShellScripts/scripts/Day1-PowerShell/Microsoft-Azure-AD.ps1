##############################################################################
# 
# This script demonstrates how to interact with Microsoft Azure Active 
# Directory via PowerShell.  You will need an Azure AD account first, which
# is free: http://azure.microsoft.com/en-us/services/active-directory/
#
### Software Prerequisites ###################################################
# 
# Install latest version of the "Microsoft Online Services Sign-in Assistant".
# Last Seen At: http://go.microsoft.com/fwlink/?LinkId=286152
#
#
# Install latest version of "Windows Azure AD Module". 
# Last Seen At: http://go.microsoft.com/fwlink/p/?linkid=236297   
#
##############################################################################



# Import the Azure AD PowerShell module:
Import-Module -Name MSOnline


# List the cmdlets provided by the module:
Get-Command -Module MSOnline


# Connect and authenticate to Azure AD, where your username will
# be similar to '<yourusername>@<yourdomain>.onmicrosoft.com':
$creds = Get-Credential
Connect-MsolService -Credential $creds


# Get subscriber company contact information:
Get-MsolCompanyInformation


# Get subscription and license information:
Get-MsolSubscription | Format-List *
Get-MsolAccountSku   | Format-List *


# Get Azure AD users:
Get-MsolUser


# Get list of Azure AD management roles:
Get-MsolRole


# Show the members of each management role:
Get-MsolRole | ForEach { "`n`n" ; "-" * 30 ; $_.Name ; "-" * 30 ; Get-MsolRoleMember -RoleObjectId $_.ObjectId | ForEach { $_.DisplayName } }  



