Get-ADComputer -filter * | select {$_.name} | ft

Get-ADComputer -Identity pc-27  | Get-WmiObject -Class win32_groupuser -ComputerName {$_}
#Get-WmiObject -Class win32_groupuser -ComputerName pc-27 #-Filter "Domain= ad’"