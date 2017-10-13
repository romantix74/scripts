$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

# Specify the VM you want to clone
$clone = "pc_SYSPREP_2"

# specify to which host clone VM
$ESXi = "192.168.46.12"

# Specify the datastore or datastore cluster placement
$ds = "mainStore"

# Specify vCenter Server Virtual Machine & Templates folder
$Folder = "win8"

# Specify the VM name to the left of the - sign
$VM_prefix = "pc_"

$vm_count = 10

#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0

#Get-VM -name pc_1*

0..$vm_count | foreach {
    #write-host $_
    $pc_num = $_ + 135
    write-host $pc_num
    #$y="{0:1}" -f $_
    $VM_name= $VM_prefix + $pc_num
    write-host $VM_Name
    New-VM -Name $VM_Name -VM "pc_SYSPREP_2" -VMHost "192.168.46.11" -Datastore "mainStore" -Location "win8_2"
    sleep 600
#New-VM -Name $VM_Name -VM $clone -VMHost $ESXi -Datastore $ds -Location $Folder 
#New-VM -Name pc_51 -VM "pc_SYSPREP_2" -VMHost "192.168.46.12" -Datastore "mainStore" -Location "win8"

}