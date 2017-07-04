#$comps = Get-ADComputer -filter * | select {$_.name} | ft
#Get-ADComputer pc-57 | get-wmiobject win32_service -filter "name='ADWS'"  | ft
#get-ciminstance win32_service -comp pc-57

For ($i=122; $i -lt 123; $i++) {   #(Get-ADComputer -filter * | select {$_.name})) {    
    $pc = "pc-$i"
    Write-Host $pc
    Remove-Item "\\$pc\C$\Program Files\OpenVPN\config\*"
    Copy-Item -Path "C:\Users\ro\Desktop\out\$pc\auth.txt" -Destination "\\$pc\C$\Program Files\OpenVPN\config\"
    Copy-Item -Path "C:\Users\ro\Desktop\out\$pc\secretvpn.net.ovpn" -Destination "\\$pc\C$\Program Files\OpenVPN\config\"
}


