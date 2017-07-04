$comps = Get-ADComputer -filter {(Name -Like "pc-7*" -or Name -Like "pc-8*")}  #| select {$_.name} | ft
#
$comps | foreach {
    #write-host $_.name
    $pc = $_.Name
    
    Enter-PSSession -ComputerName $pc
    $script = {openvpn.exe --version}
    #$script = {winrm quickconfig --quiet}
    $out = Invoke-Command -ComputerName $pc -ScriptBlock $script | select-string "OpenVPN 2"
    Exit-PsSession

    Write-Host $pc  ' '  $out
}

#$pc='pc-47'

#Enter-PSSession -ComputerName $pc
#$script = {openvpn.exe --version}
#Invoke-Command -ComputerName $pc -ScriptBlock $script | select-string "OpenVPN "
#Exit-PsSession