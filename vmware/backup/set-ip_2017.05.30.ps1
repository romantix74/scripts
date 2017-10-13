$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="master"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0


#$ScriptText = "New-NetIPAddress –IPAddress 10.5.9.66 –InterfaceAlias Ethernet0 -AddressFamily IPv4 –PrefixLength 24 -DefaultGateway 10.5.9.1;
#Set-DnsClientServerAddress -InterfaceAlias Ethernet0 -ServerAddresses 10.5.9.10,10.5.9.11;
#ipconfig;"


#Invoke-VMScript -VM $VM -ScriptText $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword

#Get-VM -name "pc_46" | Invoke-VMScript $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword

$ScriptText2 = "netsh interface ipv4 set address 'Ethernet0' static 10.5.9.100 255.255.255.0 10.5.9.1 1; netsh interface ipv4 set dnsserver 'Ethernet0' static 10.5.9.10 primary;netsh interface ipv4 add dns name='Ethernet0' addr=10.5.9.11 index=2"

Get-VM -name "pc_80" | Invoke-VMScript $ScriptText2 -GuestUser $GuestUser -GuestPassword $GuestPassword

#$VM = Get-VM -name "pc_78"
#get-item "c:\temp\*.*" | Copy-VMGuestFile -Destination "c:\temp\" -VM $VM -GuestToLocal -Force -GuestUser $GuestUser -GuestPassword $GuestPassword

#Copy-VMGuestFile -Source c:\temp\test.txt -destination c:\temp\ -VM pc_79 -LocalToGuest -Force -GuestUser $GuestUser -GuestPassword $GuestPassword