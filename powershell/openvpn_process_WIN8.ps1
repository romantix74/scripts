$comps = Get-ADComputer -filter * | select {$_.name} | ft
#Get-ADComputer pc-57 | get-wmiobject win32_service -filter "name='ADWS'"  | ft
#get-ciminstance win32_service -comp pc-57

#For ($i=26; $i -lt 76; $i++) {                #(Get-ADComputer -filter * | select {$_.name})) {
#    #Write-Host pc-$i
#    $computername = "pc-$i"
   
#}
$pc='pc-47'

Enter-PSSession -ComputerName $pc
$script = {set-service WMPNetworkSvc -StartupType Disabled -Status Stopped}
#$script = {set-service OpenVPNService -StartupType Automatic -Status Stopped}
Invoke-Command -ComputerName $pc -ScriptBlock $script

Exit-PsSession