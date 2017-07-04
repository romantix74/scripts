$comps = Get-ADComputer -filter * | select {$_.name} | ft
#Get-ADComputer pc-57 | get-wmiobject win32_service -filter "name='ADWS'"  | ft
#get-ciminstance win32_service -comp pc-57

For ($i=76; $i -lt 123; $i++) {   #(Get-ADComputer -filter * | select {$_.name})) {
    $pc = "pc-$i"
    Write-Host $pc
    Copy-Item -Path C:\temp\reboot.bat -Destination \\$pc\C$\Users\ro.AD\Desktop\
}
#$pc='pc-26'

#Copy-Item -Path C:\temp\reboot.bat -Destination \\$pc\C$\Users\master2\Desktop

