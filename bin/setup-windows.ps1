fsutil behavior set Disable8dot3 1 | Out-Null
fsutil behavior set DisableLastAccess 1 | Out-Null
fsutil behavior set SymlinkEvaluation L2L:1 L2R:0 R2R:0 R2L:0 | Out-Null

Set-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" `
    -Name PagingFiles -Value "" -Type MultiString


netsh advfirewall set allprofiles state on | Out-Null
netsh advfirewall set allprofiles firewallpolicy "blockinboundalways,allowoutbound" | Out-Null

Set-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" `
    -Name AutoShareServer -Value 0 -Type dword

if (!(Test-Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI")) {
    New-Item "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" `
        -ItemType Registry
}

Set-ItemProperty `
    -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" `
    -Name EnableSecureCredentialPrompting -Value 1 -Type dword


Set-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" `
    -Name MoveImages -Value 1 -Type dword

bcdedit.exe /set nx AlwaysOn | Out-Null

Set-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" `
    -Name DisableExceptionChainValidation -Value 0 -Type dword
