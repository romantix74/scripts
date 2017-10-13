﻿$vCenter="192.168.46.10"
$vCenterUser="administrator@ev2.secretcom.biz"
$vCenterUserPassword="^d6#kxoKK,aM"

Connect-VIServer $vCenter -User $vCenterUser -Password $vCenterUserPassword
$allvms = @()
$allhosts = @()
$hosts = Get-VMHost
$vms = Get-Vm

foreach($vmHost in $hosts){
  $hoststat = "" | Select HostName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin
  $hoststat.HostName = $vmHost.name
  
  $statcpu = Get-Stat -Entity ($vmHost)-start (get-date).AddDays(-30) -Finish (Get-Date)-MaxSamples 10000 -stat cpu.usage.average
  $statmem = Get-Stat -Entity ($vmHost)-start (get-date).AddDays(-30) -Finish (Get-Date)-MaxSamples 10000 -stat mem.usage.average

  $cpu = $statcpu | Measure-Object -Property value -Average -Maximum -Minimum
  $mem = $statmem | Measure-Object -Property value -Average -Maximum -Minimum
  
  $hoststat.CPUMax = $cpu.Maximum
  $hoststat.CPUAvg = $cpu.Average
  $hoststat.CPUMin = $cpu.Minimum
  $hoststat.MemMax = $mem.Maximum
  $hoststat.MemAvg = $mem.Average
  $hoststat.MemMin = $mem.Minimum
  $allhosts += $hoststat
}
$allhosts | Select HostName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin | Export-Csv "c:\vmware_reports\Hosts.csv" -noTypeInformation

foreach($vm in $vms){
  $vmstat = "" | Select VmName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin
  $vmstat.VmName = $vm.name
  
  $statcpu = Get-Stat -Entity ($vm)-start (get-date).AddDays(-30) -Finish (Get-Date)-MaxSamples 10000 -stat cpu.usage.average
  $statmem = Get-Stat -Entity ($vm)-start (get-date).AddDays(-30) -Finish (Get-Date)-MaxSamples 10000 -stat mem.usage.average

  $cpu = $statcpu | Measure-Object -Property value -Average -Maximum -Minimum
  $mem = $statmem | Measure-Object -Property value -Average -Maximum -Minimum
  
  $vmstat.CPUMax = $cpu.Maximum
  $vmstat.CPUAvg = $cpu.Average
  $vmstat.CPUMin = $cpu.Minimum
  $vmstat.MemMax = $mem.Maximum
  $vmstat.MemAvg = $mem.Average
  $vmstat.MemMin = $mem.Minimum
  $allvms += $vmstat
}
$allvms | Select VmName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin | Export-Csv "c:\vmware_reports\VMs.csv" -noTypeInformation

