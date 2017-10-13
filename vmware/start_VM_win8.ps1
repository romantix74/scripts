$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ro"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0

#-location "192.168.46.11"
Foreach ($VM in (Get-VM pc_9[0-9]  | Where {$_.powerstate -eq "PoweredOff"})){
    
    $VM  | Start-VM -Confirm:$false
	sleep 600
	write-host $VM.Name + "has been started"
}


