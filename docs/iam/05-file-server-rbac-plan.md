# Lab 05 — SMB File Server & Role-Based Access (Planned)

> **Status:** `IAM-FS01` Windows Server 2025 Standard Evaluation booted and local Administrator login succeeded. `hostname` output confirmed IAM-FS01 and the OS reported build 10.0.26100. LDAP 389 and Kerberos 88 connections to the DC succeeded from `192.168.191.11`, and Server Manager shows domain `corp.iamlab.test`. Secure-channel verification passed (`Test-ComputerSecureChannel : True`) and `nltest` discovered IAM-DC01. AD computer object placement in the lab Servers OU is now confirmed by post-move PowerShell. VMware Tools and SMB/NTFS permissions are still pending. The departmental folders have been created and verified but no share or NTFS access enforcement has been tested.

## Scenario
Two fictional employees have different permissions: Alex (IT) should be able to access IT resources, while Jordan (Finance) should be able to access Finance resources. Each should be denied access to the other department's share.

## Planned setup
- `IAM-FS01`: Windows Server 2025 member server, VMware VMnet1 Host-only.
- Proposed static address: `192.168.191.11/24`; DNS `192.168.191.10`.
- Domain: `corp.iamlab.test`.
- **Do not** promote the file server to a domain controller.

## Implementation checklist
- [x] Install Windows Server and create local Administrator account on IAM-FS01; verify in-guest sign-in and edition (screenshot evidence)
- [x] Confirm Windows hostname IAM-FS01 (verified using `hostname`).
- [ ] Confirm VMware Tools and Host-only VMnet1 configuration.
- [x] Verify domain name A record and LDAP SRV discovery by explicitly querying DNS server `192.168.191.10` from IAM-FS01 (screenshot verified).
- [x] Verify source IP `192.168.191.11`, configured DNS server `192.168.191.10`, and LDAP/Kerberos TCP 389/88 connectivity from IAM-FS01 (screenshot verified).
- [ ] Confirm netmask, gateway and VMware Tools/VMnet1 configuration.
- [x] Join the server to `corp.iamlab.test` (Server Manager domain membership screenshot verified).
- [x] Confirm IAM-FS01 secure channel and discover domain controller (`Test-ComputerSecureChannel` returned `True`; `nltest /dsgetdc:corp.iamlab.test` succeeded).
- [x] Verify IAM-FS01 computer object exists, is enabled, and identifies as Windows Server 2025 Standard Evaluation (PowerShell screenshot).
- [x] ADUC visually shows IAM-FS01 under `OU=Servers,OU=IAM-Lab` following a move (GUI screenshot).
- [x] Confirm the post-move Distinguished Name in PowerShell: `CN=IAM-FS01,OU=Servers,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test` (screenshot verified, 2026-11-13).
- [x] Create and verify `C:\LabShares\IT` and `C:\LabShares\Finance` folders with PowerShell (2026-11-13 screenshot).
- [x] Review ACLs for both folders: inherited BUILTIN\\Users Read/Execute, CreateFiles, AppendData; inherited SYSTEM/Administrators Full Control (Finance also has explicit Administrators Full Control); screenshot 2026-11-13.
- [ ] Back up current ACLs outside the shares and safely remove broad inherited rights from one department folder at a time; validate effective DACL after each change.
- [ ] Configure appropriate NTFS ACLs preserving SYSTEM and Administrators Full Control.
- [ ] Create IT and Finance SMB shares after NTFS access is validated.
- [x] Create IT and Finance resource-level security groups in the IAM-Lab Groups OU (ADUC screenshot).
- [x] Verify both `DL_Finance_Share_RW` and `DL_IT_Share_RW` are DomainLocal / Security (PowerShell screenshots; IT confirmed 2026-11-13).
- [x] Nest `GG_IT_Employees` into `DL_IT_Share_RW` (Get-ADGroupMember screenshot verified).
- [x] Nest `GG_Finance_Employees` into `DL_Finance_Share_RW` (Get-ADGroupMember screenshot verified).
- [ ] Apply resource access through domain-local groups using both share and NTFS permissions.
- [ ] Test user access in separate standard-user sessions; preserve administrative and SYSTEM access.
- [ ] Record successful authorized access and denied unauthorized access.

## Intended access matrix — not yet validated
| User | IT Share | Finance Share |
|---|---|---|
| Alex Morgan (`GG_IT_Employees`) | Allow | Deny |
| Jordan Lee (`GG_Finance_Employees`) | Deny | Allow |

## Evidence / completion criteria
Show successful domain join, expected security-group nesting, share/NTFS permissions, allowed and denied access under non-privileged identities, and a troubleshooting reflection. Don't label this lab complete until actual access testing succeeds.
