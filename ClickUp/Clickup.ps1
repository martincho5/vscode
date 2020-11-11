$headers = @{
    Authorization="pk_XXXX"
    Content='application/json'
}

#$response = Invoke-RestMethod 'https://api.clickup.com/api/v2/user' -Headers $headers
#Write-Output $response
#$response2 = Invoke-RestMethod 'https://api.clickup.com/api/v2/team' -Headers $headers
#Write-Output $response2
#$response3 = Invoke-RestMethod 'https://api.clickup.com/api/v2/team/3001554/space?archived=false' -Headers $headers
#Write-Output $response3

$response4 = Invoke-RestMethod 'https://api.clickup.com/api/v2/space/3002509/folder?archived=false' -Headers $headers 
#Write-Output $response4.folders

ForEach ($folders in $response4.folders) {
    #Write-Output 'Carpeta:' $folders.name
    ForEach ($lista in $folders.lists) {
        #Write-Output 'Lista:' $lista.name
        $invoca =  'https://api.clickup.com/api/v2/list/'+ $lista.id +'/task?archived=false'
        $response5 = Invoke-RestMethod $invoca -Headers $headers
        ForEach ($tareas in $response5.tasks) {
            #Write-Output 'Tareas:' $tareas.name 
            ConvertTo-Json $tareas
        }    
    }
}



