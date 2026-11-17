# Lab 05 — SMB File Server & Role-Based Access (Authorization verified)

> **Status (2026-11-14):** Both departmental shares and NTFS ACLs verified; all four employee authorization scenarios passed using explicit non-privileged domain credentials over SMB. IAM-FS01 domain trust and OU placement verified. VMware Tools and detailed adapter settings remain pending.

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
- [x] Back up three ACLs to `C:\IAM-Lab-ACL-Backup\before-ntfs-change.acl` (icacls success screenshot).
- [x] Apply explicit IT folder grants: SYSTEM FullControl, Administrators FullControl, `CORP\DL_IT_Share_RW` Modify; remove inherited ACEs using `icacls /inheritance:r` (commands succeeded).
- [x] Validate final IT folder DACL and inheritance disabled: explicit SYSTEM and Administrators Full Control and `CORP\DL_IT_Share_RW` Modify/Synchronize; no broad access ACEs; `AreAccessRulesProtected=True` (screenshot, 2026-11-13).
- [x] Apply and validate Finance scoped NTFS ACL: SYSTEM/Administrators FullControl, `CORP\DL_Finance_Share_RW` Modify/Synchronize; all ACEs explicit, `AreAccessRulesProtected=True` (screenshots 2026-11-13).
- [x] Configure and independently verify both IT and Finance NTFS ACLs preserving SYSTEM/Administrators Full Control and only the matching domain-local group Modify.
- [x] Create and validate `\\IAM-FS01\IT` SMB share backed by `C:\LabShares\IT`, with AccessBased enumeration, `BUILTIN\Administrators` Full, and `CORP\DL_IT_Share_RW` Change; no broad share-level grants visible (2026-11-13 screenshots).
- [x] Create and validate `\\IAM-FS01\Finance` SMB share backed by `C:\LabShares\Finance`, with AccessBased enumeration, Administrators Full, and `CORP\DL_Finance_Share_RW` Change.
- [x] Create IT and Finance resource-level security groups in the IAM-Lab Groups OU (ADUC screenshot).
- [x] Verify both `DL_Finance_Share_RW` and `DL_IT_Share_RW` are DomainLocal / Security (PowerShell screenshots; IT confirmed 2026-11-13).
- [x] Nest `GG_IT_Employees` into `DL_IT_Share_RW` (Get-ADGroupMember screenshot verified).
- [x] Nest `GG_Finance_Employees` into `DL_Finance_Share_RW` (Get-ADGroupMember screenshot verified).
- [x] Apply resource access through domain-local groups using both share and NTFS permissions.
- [ ] Test user access in separate standard-user sessions; preserve administrative and SYSTEM access.
- [x] Record successful authorized access and denied unauthorized access.

## Verified effective access matrix — 2026-11-14
| User | IT Share | Finance Share |
|---|---|---|
| Alex Morgan (`GG_IT_Employees`) | Allow — passed | Deny — passed |
| Jordan Lee (`GG_Finance_Employees`) | Deny — passed | Allow — passed |

## Evidence / completion criteria
Show successful domain join, expected security-group nesting, share/NTFS permissions, allowed and denied access under non-privileged identities, and a troubleshooting reflection. Don't label this lab complete until actual access testing succeeds.


## Verified testing evidence (sanitized transcription)

- `Get-ADUser` returned enabled `alex.morgan` and `jordan.lee`; direct departmental and recursive resource-group membership matched the design. AD authorization-group output showed no Administrators, Domain Admins or Enterprise Admins for either user. IAM-FS01 local Administrators contained only Domain Admins and the local Administrator; Backup Operators and Remote Desktop Users were empty.
- Host TCP 445 test to 192.168.191.11 succeeded via VMnet1. `Get-SmbConnection` confirmed explicit employee credentials and SMB 3.1.1.
- Each employee listed their own share, created a synthetic file, wrote/read content, appended/read a second line, deleted the file and obtained `Test-Path = False`. Both cross-department listing and file creation returned PermissionDenied / UnauthorizedAccessException.
- Four scenarios passed (22/22 checklist observations, including authentication and connection checks; not 22 independent attack scenarios).
- Troubleshooting: initial AD cmdlet unavailable on wrong server; moved to AD-capable environment. Alex encountered error 86 before success. Jordan encountered errors 1326 and 1907 before success; exact password remediation not observed. Alex's SMB connection briefly remained after mapping removal, but final connection listed Jordan only.
- Limitations: IP-based SMB from host using explicit domain credentials, not separate domain workstation interactive logons or proof of Kerberos. Combined SMB/NTFS enforcement verified, not each ACL layer independently; no exhaustive privilege audit. Raw screenshots not published to avoid unrelated host/account details.
- Cleanup verified 2026-11-14: Finance mapping removed, net use and Get-SmbConnection empty. Domain-joined client subsequently deployed; see [Lab 06](06-workstation-deployment.md). Employee sign-ins and Kerberos tests still pending.
