$Users = (Get-ADUSer -Filter *).count
$Computers = (Get-ADComputer -Filter *).count
$Groups = (Get-ADGroup -Filter *).count
$Distribution_Groups = (Get-ADGroup -Filter {GroupCategory -eq "Distribution"}).count
$Security_Groups = (Get-ADGroup -Filter {GroupCategory -eq "Security"}).count

Write-Host "Number of users: $Users"
Write-Host "Number of computers: $Computers"
Write-Host "Number of groups: $Groups"
Write-Host "Number of distribution groups: $Distribution_Groups"
Write-Host "Number of security groups: $Security_Groups"