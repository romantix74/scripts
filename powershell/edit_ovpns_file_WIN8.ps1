
For ($i=9; $i -lt 10; $i++) {   #(Get-ADComputer -filter * | select {$_.name})) {
    $pc = "pc-0$i"
    Write-Host $pc
    $path = "\\$pc\C$\Program Files\OpenVPN\config\*.ovpn"
    
    # список файлов в директории конфигов опенвпн
    $files = Get-ChildItem -Path $path -Recurse # -Filter "*.ovpn*" 
    echo $files

    # обрабатываем каждый файл
    $files | foreach {
        $c = get-content $_
        if ($c.IndexOf('pull-filter ignore "dhcp-option DNS"') -eq '-1') {
            $c[0] += [System.Environment]::NewLine+'pull-filter ignore "dhcp-option DNS"'`
                +[System.Environment]::NewLine+'pull-filter ignore "block-outside-dns"'

            #echo $c.IndexOf('verb *')
            echo $c | Out-File $_ -Encoding utf8
        } 
        else {
            write-host "already pushed"
        }
        
    }
}



