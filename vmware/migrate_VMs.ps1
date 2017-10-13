$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$src = "192.168.46.11"
$dst = "192.168.46.12"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0


Foreach ($VM in (Get-VM pc_10[0-9] -location $src )){
    
    #$VM  | Move-VM -destination $dst
	#sleep 20
	write-host $VM.Name + "has been migrated"
}
 

