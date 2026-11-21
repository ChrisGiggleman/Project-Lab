# Windows Troubleshooting Reference — 200 Commands

> A searchable toolkit for Windows troubleshooting, infrastructure, identity, and security labs.

**Source note:** This is an independently assembled set of 200 Windows CMD / PowerShell examples, **not a verified transcription** of the LinkedIn post. The short link did not expose its complete list for checking. [Open the original LinkedIn post](https://lnkd.in/p/e7-nkN2S).

**Scope:** 200 distinct command examples in 10 categories. Command behavior, availability, and options depend on Windows version and edition.

[Back to the learning library](cloud-learning-games.md) · [Project-Lab home](../../README.md)

## Important safety and usage notes

- **Reference only:** do not run these 200 commands as a script or in sequence. Choose a diagnostic step for an actual symptom.
- **Inspect** usually means read-only; output may still expose usernames, IPs, group membership, device IDs, or paths. **Changes**, **Disruptive**, and **Recovery / high risk** require authorization, backups, and rollback planning.
- **PS** indicates Windows PowerShell / compatible PowerShell. Other commands are shown in CMD style. **Admin** means elevated permissions may be needed; **WinRE** means the Windows Recovery Environment.
- Replace example hostnames, folder paths, drive letters, and domain names. Confirm actual drive letters in WinRE; these may not match normal Windows.
- Never expose BitLocker recovery information, tokens, credentials, production data, or sensitive event logs in a public repo. Avoid reset or recovery actions on managed devices without approval.

## Categories

- [1. System repair and health](#1-system-repair-and-health)
- [2. IP and DNS](#2-ip-and-dns)
- [3. Networking and Wi-Fi](#3-networking-and-wi-fi)
- [4. Disk, files, and storage](#4-disk-files-and-storage)
- [5. Processes, services, and events](#5-processes-services-and-events)
- [6. Windows Update and servicing](#6-windows-update-and-servicing)
- [7. Startup and recovery](#7-startup-and-recovery)
- [8. Accounts, AD and policy](#8-accounts-ad-and-policy)
- [9. Firewall, security and encryption](#9-firewall-security-and-encryption)
- [10. PowerShell diagnostics](#10-powershell-diagnostics)

## Commands

### 1. System repair and health

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 1 | `winver` | View Windows build | Inspect |
| 2 | `ver` | Show command interpreter OS version | Inspect |
| 3 | `systeminfo` | Display OS and hardware summary | Inspect |
| 4 | `msinfo32` | Open System Information | Inspect |
| 5 | `dxdiag` | Open DirectX diagnostic report | Inspect |
| 6 | `perfmon` | Open Performance Monitor | Inspect |
| 7 | `perfmon /rel` | Open Reliability Monitor | Inspect |
| 8 | `resmon` | Open Resource Monitor | Inspect |
| 9 | `taskmgr` | Open Task Manager | Inspect |
| 10 | `msconfig` | Inspect system startup configuration | Inspect |
| 11 | `sfc /verifyonly` | Scan protected files without repairing | Admin likely |
| 12 | `sfc /scannow` | Scan and repair protected system files | Changes, Admin likely |
| 13 | `DISM /Online /Cleanup-Image /CheckHealth` | Quick component store health status | Admin likely |
| 14 | `DISM /Online /Cleanup-Image /ScanHealth` | Check component store for corruption | Admin likely |
| 15 | `DISM /Online /Cleanup-Image /RestoreHealth` | Repair component store | Changes, Admin likely |
| 16 | `driverquery /v` | Inspect installed driver details | Inspect |
| 17 | `pnputil /enum-devices /problem` | List problem devices | Inspect |
| 18 | `pnputil /enum-drivers` | List installed driver packages | Inspect |
| 19 | `powercfg /energy` | Generate an energy efficiency report | Admin likely |
| 20 | `powercfg /batteryreport` | Generate a battery health report | Inspect |

### 2. IP and DNS

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 21 | `ipconfig` | Show IP information | Inspect |
| 22 | `ipconfig /all` | Show detailed adapter configuration | Inspect |
| 23 | `ipconfig /displaydns` | Display local DNS cache | Inspect |
| 24 | `ipconfig /flushdns` | Clear local DNS cache | Changes |
| 25 | `ipconfig /registerdns` | Re-register DNS client names | Changes |
| 26 | `ipconfig /release` | Release DHCP address; disconnects network | Disruptive |
| 27 | `ipconfig /renew` | Request a new DHCP lease | Changes |
| 28 | `ping 1.1.1.1` | Test basic IPv4 connectivity | Inspect |
| 29 | `ping -n 4 example.com` | Send four hostname probes | Inspect |
| 30 | `ping -6 ::1` | Test local IPv6 loopback | Inspect |
| 31 | `tracert example.com` | Trace network route | Inspect |
| 32 | `pathping example.com` | Analyze hops and packet loss | Inspect |
| 33 | `nslookup example.com` | Resolve hostname using DNS | Inspect |
| 34 | `nslookup -type=mx example.com` | Query MX records | Inspect |
| 35 | `nslookup -type=txt example.com` | Query TXT records | Inspect |
| 36 | `netsh interface ipv4 show config` | Inspect IPv4 configuration | Inspect |
| 37 | `netsh interface ipv6 show addresses` | Inspect IPv6 addresses | Inspect |
| 38 | `netsh winsock show catalog` | Inspect Winsock providers | Inspect |
| 39 | `netsh winsock reset` | Reset Winsock configuration | Disruptive, Admin likely |
| 40 | `netsh int ip reset` | Reset TCP/IP configuration | Disruptive, Admin likely |

### 3. Networking and Wi-Fi

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 41 | `getmac /v` | Inspect MAC addresses | Inspect |
| 42 | `arp -a` | Inspect ARP/neighbor cache | Inspect |
| 43 | `route print` | Inspect routing table | Inspect |
| 44 | `netstat -ano` | Inspect listeners, connections, PIDs | Inspect |
| 45 | `netstat -abno` | Include executable names; requires admin | Inspect |
| 46 | `netstat -e` | Inspect interface statistics | Inspect |
| 47 | `netsh interface show interface` | Inspect interface states | Inspect |
| 48 | `netsh interface ipv4 show interfaces` | Inspect IPv4 interfaces | Inspect |
| 49 | `netsh wlan show interfaces` | Inspect Wi-Fi connection | Inspect |
| 50 | `netsh wlan show drivers` | Inspect wireless driver features | Inspect |
| 51 | `netsh wlan show profiles` | List saved Wi-Fi profile names | Sensitive output |
| 52 | `netsh wlan show networks mode=bssid` | Inspect nearby Wi-Fi networks | Inspect |
| 53 | `netsh winhttp show proxy` | Inspect WinHTTP proxy | Inspect |
| 54 | `netsh winhttp reset proxy` | Reset system WinHTTP proxy | Disruptive, Admin likely |
| 55 | `netsh trace show status` | Inspect network tracing session | Inspect |
| 56 | `netsh trace stop` | Stop active network tracing session | Changes |
| 57 | `Test-NetConnection -ComputerName example.com -Port 443` | PowerShell test of TCP 443 | PS |
| 58 | `Get-NetTCPConnection -State Listen` | List listening TCP connections | PS |
| 59 | `Resolve-DnsName example.com` | PowerShell DNS lookup | PS |
| 60 | `Get-DnsClientServerAddress` | Inspect configured DNS resolvers | PS |

### 4. Disk, files, and storage

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 61 | `chkdsk C:` | Inspect volume for filesystem errors | Inspect |
| 62 | `chkdsk C: /scan` | Online volume check where supported | Inspect |
| 63 | `chkdsk C: /f` | Attempt filesystem repairs; potential reboot | Disruptive, Admin likely |
| 64 | `fsutil volume diskfree C:` | Inspect disk free space | Inspect |
| 65 | `fsutil fsinfo drives` | List drive letters | Inspect |
| 66 | `fsutil dirty query C:` | Inspect volume dirty flag | Inspect |
| 67 | `Get-Volume` | List volumes | PS |
| 68 | `Get-Disk` | List disks | PS |
| 69 | `Get-Partition` | List disk partitions | PS |
| 70 | `Get-PhysicalDisk` | Inspect physical disks | PS |
| 71 | `Get-StoragePool` | Inspect Windows storage pools | PS |
| 72 | `Get-FileHash 'C:\path\file.iso' -Algorithm SHA256` | Hash a sample file; replace path | PS |
| 73 | `icacls "C:\path"` | Inspect folder/file permissions | Inspect |
| 74 | `attrib "C:\path\file.txt"` | Inspect file attributes | Inspect |
| 75 | `compact /q "C:\path"` | Inspect NTFS compression status | Inspect |
| 76 | `robocopy "C:\Source" "D:\Backup" /L /E` | Preview recursive copy | Inspect |
| 77 | `robocopy "C:\Source" "D:\Backup" /E /COPY:DAT /R:1 /W:1` | Perform backup copy; check paths | Changes |
| 78 | `where.exe notepad` | Locate program executable | Inspect |
| 79 | `dir /a "C:\path"` | List files, including hidden entries | Inspect |
| 80 | `tree "C:\path" /f` | Show recursive directory tree | Inspect |

### 5. Processes, services, and events

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 81 | `tasklist` | List processes | Inspect |
| 82 | `tasklist /svc` | Map processes to Windows services | Inspect |
| 83 | `tasklist /fi "status eq running"` | Filter active tasks | Inspect |
| 84 | `sc query` | List active services | Inspect |
| 85 | `sc query wuauserv` | Inspect Windows Update service | Inspect |
| 86 | `sc qc wuauserv` | Inspect service configuration | Inspect |
| 87 | `sc queryex wuauserv` | Inspect service PID | Inspect |
| 88 | `services.msc` | Open Services management | Inspect |
| 89 | `eventvwr.msc` | Open Event Viewer | Inspect |
| 90 | `wevtutil el` | List event logs | Inspect |
| 91 | `wevtutil qe System /c:20 /rd:true /f:text` | View last 20 System events | Inspect |
| 92 | `wevtutil gl System` | Inspect System event log configuration | Inspect |
| 93 | `Get-WinEvent -ListLog *` | PowerShell list event logs | PS |
| 94 | `Get-WinEvent -LogName System -MaxEvents 20` | Read recent System events | PS |
| 95 | `Get-Process \| Sort-Object CPU -Descending \| Select-Object -First 10` | Top cumulative CPU processes | PS |
| 96 | `Get-Service` | List service states | PS |
| 97 | `Get-Service -Name wuauserv` | Inspect update service in PowerShell | PS |
| 98 | `Get-CimInstance Win32_Service \| Select-Object Name,State,StartMode` | Inspect service details | PS |
| 99 | `Get-ScheduledTask` | Inspect scheduled tasks | PS |
| 100 | `Get-ScheduledTask \| Where-Object State -eq 'Ready'` | Inspect ready scheduled tasks | PS |

### 6. Windows Update and servicing

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 101 | `start ms-settings:windowsupdate` | Open Windows Update Settings | Inspect |
| 102 | `Get-Service wuauserv,bits,cryptsvc` | Inspect servicing services | PS |
| 103 | `Get-HotFix` | View reported installed hotfixes | PS |
| 104 | `Get-HotFix \| Sort-Object InstalledOn -Descending \| Select-Object -First 20` | View recent reported hotfixes | PS |
| 105 | `DISM /Online /Get-Packages` | List servicing packages | Admin likely |
| 106 | `DISM /Online /Get-Features /Format:Table` | List Windows optional features | Admin likely |
| 107 | `DISM /Online /Get-Capabilities` | List Windows capabilities | Admin likely |
| 108 | `DISM /Online /Get-Intl` | Inspect international settings | Admin likely |
| 109 | `DISM /Online /Cleanup-Image /AnalyzeComponentStore` | Check component store footprint | Admin likely |
| 110 | `DISM /Online /Cleanup-Image /StartComponentCleanup` | Remove superseded components | Changes, Admin likely |
| 111 | `Get-WindowsUpdateLog` | Compile readable update log | PS |
| 112 | `Get-WindowsOptionalFeature -Online` | PowerShell inspect optional features | PS |
| 113 | `Get-WindowsCapability -Online` | PowerShell inspect capabilities | PS |
| 114 | `Get-WindowsPackage -Online` | PowerShell inspect packages | PS |
| 115 | `cscript.exe //nologo %windir%\System32\slmgr.vbs /dlv` | Show license detail | Inspect |
| 116 | `cscript.exe //nologo %windir%\System32\slmgr.vbs /xpr` | Show license expiration | Inspect |
| 117 | `Get-ComputerInfo \| Select-Object WindowsProductName,OsVersion,OsBuildNumber` | Inspect Windows build | PS |
| 118 | `systeminfo \| findstr /B /C:"OS Name" /C:"OS Version"` | Filter Windows version info on English system | Inspect |
| 119 | `Get-CimInstance Win32_QuickFixEngineering \| Select-Object HotFixID,InstalledOn` | Inspect QFE hotfix records | PS |
| 120 | `reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion` | Read display version registry value | Inspect |

### 7. Startup and recovery

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 121 | `bcdedit /enum` | Inspect boot configuration | Admin likely |
| 122 | `bcdedit /enum all` | Inspect all boot entries | Admin likely |
| 123 | `bcdedit /export C:\BCD-backup` | Export BCD backup | Changes, Admin likely |
| 124 | `reagentc /info` | Inspect Windows recovery status | Inspect |
| 125 | `reagentc /enable` | Enable Windows Recovery Environment | Changes, Admin likely |
| 126 | `shutdown /r /o /t 0` | Reboot immediately to advanced startup | Disruptive |
| 127 | `shutdown /r /t 60 /c "Planned restart"` | Schedule reboot in 60 seconds | Disruptive |
| 128 | `shutdown /a` | Abort pending shutdown when possible | Changes |
| 129 | `bootrec /scanos` | Scan for installed Windows from WinRE | WinRE, Inspect, Admin likely |
| 130 | `bootrec /rebuildbcd` | Rebuild BCD from WinRE | WinRE, Recovery / high risk, Admin likely |
| 131 | `bootrec /fixmbr` | Repair MBR boot code on legacy systems | WinRE, Recovery / high risk, Admin likely |
| 132 | `bootrec /fixboot` | Repair boot sector on supported systems | WinRE, Recovery / high risk, Admin likely |
| 133 | `bcdboot C:\Windows /s S: /f UEFI` | Rebuild UEFI boot files; verify letters | WinRE, Recovery / high risk, Admin likely |
| 134 | `mountvol` | Display volume mount points | Inspect |
| 135 | `mountvol C: /L` | Display mounted volume GUID | Inspect |
| 136 | `Get-ComputerRestorePoint` | List restore points where available | PS |
| 137 | `rstrui.exe` | Open System Restore UI | Inspect |
| 138 | `bcdedit /enum firmware` | Inspect UEFI boot entries | Admin likely |
| 139 | `Get-CimInstance Win32_StartupCommand` | Inspect startup items | PS |
| 140 | `Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'` | Inspect user Run key | PS |

### 8. Accounts, AD and policy

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 141 | `whoami` | Display current user | Inspect |
| 142 | `whoami /all` | Inspect current security token | Sensitive output |
| 143 | `whoami /groups` | Inspect token groups | Inspect |
| 144 | `whoami /priv` | Inspect token privileges | Inspect |
| 145 | `whoami /user` | Inspect account SID | Inspect |
| 146 | `net user` | List local user accounts | Inspect |
| 147 | `net user %USERNAME%` | Inspect current local-named account | Inspect |
| 148 | `net localgroup` | List local groups | Inspect |
| 149 | `net localgroup Administrators` | Inspect local Administrators group (English) | Inspect |
| 150 | `net accounts` | Inspect local password policy | Inspect |
| 151 | `gpresult /r` | Inspect applied Group Policy | Inspect |
| 152 | `gpresult /h "%TEMP%\gpresult.html"` | Export Group Policy report | Sensitive output |
| 153 | `gpupdate /force` | Refresh Group Policy; may cause restart | Changes |
| 154 | `klist` | List Kerberos tickets | Sensitive output |
| 155 | `klist tickets` | Inspect Kerberos cache | Sensitive output |
| 156 | `nltest /dsgetdc:corp.example.test` | Find domain controller; replace domain | Inspect |
| 157 | `nltest /sc_query:corp.example.test` | Inspect secure channel; replace domain | Inspect |
| 158 | `Get-LocalUser` | Inspect local user accounts | PS |
| 159 | `Get-LocalGroup` | Inspect local groups | PS |
| 160 | `Get-LocalGroupMember -Group Administrators` | Inspect local administrators (English) | PS |

### 9. Firewall, security and encryption

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 161 | `netsh advfirewall show allprofiles` | Inspect firewall profiles | Inspect |
| 162 | `netsh advfirewall firewall show rule name=all` | Inspect all firewall rules | Inspect |
| 163 | `netsh advfirewall monitor show firewall` | Inspect active firewall state | Inspect |
| 164 | `Get-NetFirewallProfile` | Inspect Windows firewall profiles | PS |
| 165 | `Get-NetFirewallRule -Enabled True \| Select-Object -First 20` | Sample enabled firewall rules | PS |
| 166 | `Get-NetFirewallPortFilter \| Select-Object -First 20` | Sample firewall port filters | PS |
| 167 | `Get-MpComputerStatus` | Inspect Defender status | PS |
| 168 | `Get-MpThreat` | Inspect Defender threat history | PS, Sensitive output |
| 169 | `Get-MpThreatDetection` | Inspect Defender detections | PS, Sensitive output |
| 170 | `Get-MpPreference` | Inspect Defender preferences and exclusions | PS, Sensitive output |
| 171 | `Update-MpSignature` | Update Defender intelligence | PS, Changes |
| 172 | `Start-MpScan -ScanType QuickScan` | Run Defender quick scan | PS, Changes |
| 173 | `manage-bde -status` | Inspect BitLocker status | Inspect |
| 174 | `manage-bde -protectors -get C:` | Inspect BitLocker protectors; sensitive | Sensitive output |
| 175 | `Get-BitLockerVolume` | Inspect encrypted volume status | PS |
| 176 | `Get-Tpm` | Inspect TPM | PS |
| 177 | `Confirm-SecureBootUEFI` | Check Secure Boot on UEFI | PS |
| 178 | `auditpol /get /category:*` | Inspect auditing settings | Inspect |
| 179 | `secedit /export /cfg "%TEMP%\secpol.cfg"` | Export security policy (sensitive report) | Sensitive output, Admin likely |
| 180 | `Get-AuthenticodeSignature 'C:\Windows\System32\notepad.exe'` | Inspect file digital signature | PS |

### 10. PowerShell diagnostics

| # | Command | Purpose | Notes |
|---:|---|---|---|
| 181 | `Get-ComputerInfo \| Select-Object CsName,WindowsProductName,OsVersion` | Inspect computer and OS | PS |
| 182 | `Get-CimInstance Win32_OperatingSystem \| Select-Object Caption,Version,LastBootUpTime` | Inspect operating system | PS |
| 183 | `Get-CimInstance Win32_BIOS \| Select-Object Manufacturer,SMBIOSBIOSVersion` | Inspect BIOS | PS |
| 184 | `Get-CimInstance Win32_Processor \| Select-Object Name,LoadPercentage` | Inspect CPU | PS |
| 185 | `Get-CimInstance Win32_PhysicalMemory \| Select-Object Capacity,Speed` | Inspect RAM | PS |
| 186 | `Get-Counter '\Processor(_Total)\% Processor Time'` | Sample CPU counter (English) | PS |
| 187 | `Get-Counter '\Memory\Available MBytes'` | Sample memory counter (English) | PS |
| 188 | `Get-CimInstance Win32_LogicalDisk \| Select-Object DeviceID,Size,FreeSpace` | Inspect logical disk space | PS |
| 189 | `Test-Path 'C:\Windows\System32'` | Test path existence | PS |
| 190 | `Get-Acl 'C:\Windows' \| Format-List` | Inspect Windows directory ACL | PS |
| 191 | `Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' \| Select-Object DisplayName,DisplayVersion` | Inspect installed desktop apps | PS |
| 192 | `Get-AppxPackage \| Select-Object -First 20 Name,Version` | Inspect packaged apps | PS |
| 193 | `Get-ExecutionPolicy -List` | Inspect PowerShell execution policy | PS |
| 194 | `Get-Command *-NetAdapter` | Discover networking cmdlets | PS |
| 195 | `Get-Help Get-Service -Examples` | Inspect service cmdlet help | PS |
| 196 | `Get-Module -ListAvailable` | Inspect PowerShell modules | PS |
| 197 | `Get-PSDrive` | Inspect PowerShell drives | PS |
| 198 | `Test-WSMan localhost` | Test local WS-Management endpoint | PS |
| 199 | `Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'` | Inspect system environment variables | PS |
| 200 | `Get-Process -Name explorer -ErrorAction SilentlyContinue` | Inspect Explorer process | PS |

## Troubleshooting workflow

1. Record the symptom, impact, timeline, error message, and affected users/devices.
2. Start with read-only commands: OS state, event logs, network details, service health and policy.
3. Compare results with a known-working baseline, then form a narrow hypothesis.
4. If changes are necessary, verify authorization, document expected impact, and prepare rollback.
5. Apply the minimum necessary repair, retest the symptom, and save a sanitized troubleshooting record.

## Documentation

- [Microsoft Windows command-line reference](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
- [System File Checker](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc)
- [Check Disk](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/chkdsk)
- [Repair Windows image with DISM](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/repair-a-windows-image?view=windows-11)
- [Windows Recovery Environment](https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/use-winre-to-troubleshoot-startup-issue)
- [Original LinkedIn post (full list not independently accessed)](https://lnkd.in/p/e7-nkN2S)

*Compiled November 20, 2026. This is a learning and diagnostic reference, not an automated repair tool.*