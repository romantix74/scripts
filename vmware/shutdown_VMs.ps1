$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0



Foreach ($VM in (Get-VM  pc_10[0-9] -location "win8_2" | Where {$_.powerstate -eq "PoweredOn"})){
    # Shutdown the guest cleanly
    $VM  | Shutdown-VMGuest -Confirm:$false
	sleep 10
	write-host $VM.Name + "has been halted"
}
 

