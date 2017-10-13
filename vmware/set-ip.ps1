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
120..129 | foreach {
    #write-host $_
    $pc_num = $_
    write-host $pc_num
    $VM_name= $VM_prefix + $pc_num
    $ip_octet = $_+20
    write-host $ip_octet
    $ScriptText = "netsh interface ipv4 set address 'Ethernet0' static 10.5.9."+ $ip_octet + " 255.255.255.0 10.5.9.1 1; netsh interface ipv4 set dnsserver 'Ethernet0' static 10.5.9.10 primary;netsh interface ipv4 add dns name='Ethernet0' addr=10.5.9.11 index=2"
    #$ScriptText = "gpupdate"
    Get-VM -name $VM_name | where {$_.powerstate -eq "PoweredOn"} | Invoke-VMScript $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword
    sleep 15
}

#$ScriptText2 = "netsh interface ipv4 set address 'Ethernet0' static 10.5.9.100 255.255.255.0 10.5.9.1 1; netsh interface ipv4 set dnsserver 'Ethernet0' static 10.5.9.10 primary;netsh interface ipv4 add dns name='Ethernet0' addr=10.5.9.11 index=2"

#Get-VM -name "pc_80" | Invoke-VMScript $ScriptText2 -GuestUser $GuestUser -GuestPassword $GuestPassword

