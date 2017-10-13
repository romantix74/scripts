$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ro"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0



Foreach ($VM in (Get-VM -location "pc_1-25" | Where {$_.powerstate -eq "PoweredOn"})){
    
    $VM.name
	$VM  | Restart-VMGuest -Confirm:$false
	sleep 20
	write-host $VM.Name + "has reboted"
}

#Get-VM -location "win8" | Where {$_.powerstate -eq "PoweredOn"} 

