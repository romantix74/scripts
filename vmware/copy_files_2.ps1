$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="ad.f00.at\ro"
$GuestPassword="KvOIRID1"
#$GuestPassword="3kFCg%E0Q#xG"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0

get-vm pc_26 | foreach {
    write-host $_.Name
#$VM = Get-VM -name "pc_76"
#get-item "c:\temp\reboot.bat" | Copy-VMGuestFile -Destination "c:\temp\" -VM $VM -GuestToLocal -Force -GuestUser $GuestUser -GuestPassword $GuestPassword

    Copy-VMGuestFile -Source c:\temp\reboot.bat -destination c:\Users\master2\ -VM $_ -LocalToGuest -Force -GuestUser $GuestUser -GuestPassword $GuestPassword

}