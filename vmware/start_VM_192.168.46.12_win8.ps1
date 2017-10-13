$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ro"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0



Foreach ($VM in (Get-VM pc_* -location "192.168.46.12" | Where {$_.powerstate -eq "PoweredOff"})){
    # Shutdown the guest cleanly
    $VM  | Start-VM -Confirm:$false
	sleep 60
	write-host $VM.Name + "has been started"
}

#Get-VM -location "win8" | Where {$_.powerstate -eq "PoweredOn"} 

