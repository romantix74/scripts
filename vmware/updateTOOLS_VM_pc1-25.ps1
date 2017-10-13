$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ro"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0



Foreach ($VM in (Get-VM -location "win8_2" | Where {$_.powerstate -eq "PoweredOn"})){
    # Shutdown the guest cleanly
    $VM.name
	$VM  | Update-Tools  #-Confirm:$false
	sleep 15
	write-host $VM.Name + "has been updated"
}

#Get-VM -location "win8" | Where {$_.powerstate -eq "PoweredOn"} 

