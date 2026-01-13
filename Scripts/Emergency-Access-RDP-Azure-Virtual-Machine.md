# If you locked yourself out of your VM

- Most likely the RDP inbound firewall rule is not enabled, the VM is using the "wrong" firewall profile or something bad happened
- Either wait for Intune to push/sync firewall rule or use serial console (Azure VM > Serial Console) to create a firewall rule via PowerShell
  - https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/windows/serial-console-windows#use-cmd-or-powershell-in-serial-console
- `cmd`
- `ch -si 1`
- Press `Enter` and enter your built-in admin credentials (you can reset your VM's built-in administrator through Azure VM > Reset Password)
  - Username without domain
  - In the domain field just press Enter
  - Enter password
- Once logged in, write `powershell`
- Check which profile is active `(Get-NetConnectionProfile).NetworkCategory`
- Check profile settings `Get-NetFirewallProfile -PolicyStore ActiveStore`
- Add firewall rules (TCP should be sufficient)
  - `New-NetFirewallRule -DisplayName "0 - EMERGENCY - RDP (TCP)" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 3389 -RemoteAddress $RemoteAddress -Profile Any -Enabled True | Out-Null`
  - `New-NetFirewallRule -DisplayName "0 - EMERGENCY - RDP (UDP)" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 3389 -RemoteAddress $RemoteAddress -Profile Any -Enabled True | Out-Null`
