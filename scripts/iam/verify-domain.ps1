# Read-only verification — run in PowerShell on IAM-DC01
$ErrorActionPreference = 'Continue'

Write-Host "=== DOMAIN CONTROLLER ==="
hostname

Write-Host "=== ACTIVE DIRECTORY DOMAIN ==="
Get-ADDomain | Select-Object DNSRoot,DomainMode,NetBIOSName,PDCEmulator | Format-List

Write-Host "=== FOREST ==="
Get-ADForest | Select-Object Name,ForestMode,GlobalCatalogs | Format-List

Write-Host "=== SERVICES ==="
Get-Service -Name NTDS,DNS,Netlogon | Select-Object Name,Status | Format-Table -AutoSize

Write-Host "=== LDAP DNS SERVICE RECORD ==="
Resolve-DnsName -Name '_ldap._tcp.dc._msdcs.corp.iamlab.test' -Type SRV -Server 127.0.0.1

Write-Host "=== SYSVOL & NETLOGON SHARES ==="
Get-SmbShare -Name SYSVOL,NETLOGON -ErrorAction Continue | Select-Object Name,Path

Write-Host "=== DC DIAGNOSTICS ==="
dcdiag /test:Advertising /test:SysVolCheck
