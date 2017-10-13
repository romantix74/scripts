$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

$GuestUser="master"
$GuestPassword="KvOIRID1"
#---------------------------------------
write-host "Connecting to vCenter Server $vCenter" -foreground green

Connect-VIserver $vCenter -user $vCenterUser -password $vCenterUserPassword -WarningAction 0


$ScriptText = "Remove-Item 'C:\Program Files\OpenVPN\config\*'"

Get-VM -name "pc_11[0-9]*" | Invoke-VMScript $ScriptText -GuestUser $GuestUser -GuestPassword $GuestPassword

