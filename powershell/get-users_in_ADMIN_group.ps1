#$comps = Get-ADComputer -filter * | select {$_.name} | ft

For ($i=26; $i -lt 76; $i++) {                #(Get-ADComputer -filter * | select {$_.name})) {
    #Write-Host pc-$i
    $computername = "pc-$i"
    [ADSI]$S = "WinNT://$computername"
    $S.children.where({$_.class -eq 'group'}) |
    Select @{Name="Computername";Expression={$_.Parent.split("/")[-1] }},
    @{Name="Name";Expression={$_.name.value}},
    @{Name="Members";Expression={
    [ADSI]$group = "$($_.Parent)/$($_.Name),group"
    $members = $Group.psbase.Invoke("Members")
    ($members | ForEach-Object {
    $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
    }) -join ";"
    }} | Select-String "Администраторы"
}

