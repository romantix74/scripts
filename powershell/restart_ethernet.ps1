While ($true) {
    if ( -not (Test-Connection 8.8.8.8)) {
        $Adapter = Get-WmiObject Win32_NetworkAdapter | ? {$_.NetConnectionID -match 'Ethernet'}
        $Adapter.Disable();
        sleep 5
        $Adapter.Enable();
        $date = Get-Date
        echo $date'  adapter restarted'
        echo $date'  adapter restarted' >> 'C:\Users\Администратор\Desktop\restarts.txt'
    }
Get-Date
}