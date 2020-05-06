$sourceVHD = "C:\ConvertVHD\DiscoMoodle.vhd"
$destinationVHD = "https://moodleazure3470.blob.core.windows.net/vhds/DiscoMoodle.vhd"
$ResourceGroupName ="moodleazure"
 
Add-AzureRmVhd -LocalFilePath $sourceVHD -Destination $destinationVHD -ResourceGroupName $ResourceGroupName