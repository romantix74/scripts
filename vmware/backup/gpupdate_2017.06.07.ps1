$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="master"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0

#--------------------------------------------------------
$VM_prefix = "pc_"
$vm_count = 9
#0..25 | foreach {
Get-VM -location "win8" | foreach {
    #write-host $_
    $pc_num = $_
    write-host $pc_num
    $VM_name= $_ #$VM_prefix + $pc_num
    $ip_octet = $_+20
    write-host $ip_octet    
    $ScriptText = "gpupdate"
    #$ScriptText = "winrm quickconfig -quiet"
    Get-VM -name $VM_name | where {$_.powerstate -eq "PoweredOn"} | Invoke-VMScript $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword
    sleep 15
}



