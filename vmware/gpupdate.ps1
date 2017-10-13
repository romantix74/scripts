$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ro"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0

#--------------------------------------------------------
$VM_prefix = "pc_"
$vm_count = 9
#0..25 | foreach {
Get-VM -location "win8_2" | where {$_.powerstate -eq "PoweredOn"} | foreach {
    $VM_name= $_ #$VM_prefix + $pc_num    
    write-host $_    
    $ScriptText = "gpupdate"
    #$ScriptTest = "openvpn --version"    
    $_ | Invoke-VMScript $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword
    sleep 1
}



