# Changelog

## 2026-11-13 — IT NTFS DACL verified; Finance next
- Final `icacls` and `Get-Acl` output showed exactly three explicit Allow entries on `C:\LabShares\IT`: SYSTEM FullControl, Administrators FullControl, and `CORP\DL_IT_Share_RW` Modify/Synchronize.
- No broad `Users`, `Everyone`, or `Authenticated Users` ACEs remained; `IsInherited=False` for each entry and `AreAccessRulesProtected=True`.
- IT folder NTFS access **configuration verified**, but effective per-user access through SMB remains untested.
- Next: apply and independently verify equivalent least-privilege DACL on `C:\LabShares\Finance`. Do not create SMB shares until both ACLs have been verified.

## 2026-11-13 — IT folder NTFS ACL change applied (validation pending)
- `icacls C:\LabShares /save C:\IAM-Lab-ACL-Backup\before-ntfs-change.acl /T` completed for all three objects, with 0 failures.
- On IAM-FS01, `icacls` successfully applied explicit SYSTEM and Administrators FullControl and `CORP\DL_IT_Share_RW` Modify to the IT folder.
- `icacls C:\LabShares\IT /inheritance:r` succeeded, removing inherited ACEs from the IT folder.
- **Still pending:** read-only final `icacls`/`Get-Acl` verification that no broad entries remain and required entries are present; no Finance permissions or SMB shares have yet been modified/created.

## 2026-11-13 — NTFS permission baseline inspected
- Read-only `Get-Acl` inspection on IAM-FS01 showed both department folders inheriting `BUILTIN\\Users` ReadAndExecute, AppendData, and CreateFiles permissions, as well as inherited SYSTEM and Administrators FullControl. The Finance folder also shows an explicit Administrators FullControl ACE.
- Broad inheritance needs removal on each child folder before publishing departmental SMB shares. Next: save ACL backup, disable inheritance on IT and grant SYSTEM/Administrators full control and the IT resource group Modify, then inspect resulting ACL before modifying Finance.
- No NTFS permission changes or SMB shares have yet been verified.

## 2026-11-13 — AGDLP scope complete and lab folders created
- PowerShell confirmed `DL_IT_Share_RW` has `GroupScope = DomainLocal` and `GroupCategory = Security`; Finance group scope/category and both Global group nestings were confirmed previously.
- On IAM-FS01, `Get-ChildItem C:\LabShares -Directory` returned both `Finance` and `IT` directories at their intended paths.
- No NTFS access modifications or SMB shares have been configured yet; next step is a read-only ACL inspection followed by a scoped permissions plan preserving SYSTEM and Administrators access.

## 2026-11-13 — Resource-level security group nesting verified
- ADUC shows `DL_IT_Share_RW` and `DL_Finance_Share_RW` alongside the four departmental Global security groups under `IAM-Lab/Groups`.
- `Get-ADGroupMember DL_IT_Share_RW` returned exactly the intended `GG_IT_Employees` group in the displayed output; Finance returned `GG_Finance_Employees`.
- PowerShell screenshot confirms `DL_Finance_Share_RW` is DomainLocal / Security; IT resource group scope is not fully visible and is pending explicit confirmation.
- Next action: create new empty IT/Finance folders on IAM-FS01, then configure and validate least-privilege NTFS/SMB permissions before exposing shares. No file-share access tests have been performed yet.

## 2026-11-13 — IAM-FS01 Servers OU move confirmed in PowerShell
- A fresh `Get-ADComputer -Identity IAM-FS01 | Select Name,DistinguishedName` query confirmed `CN=IAM-FS01,OU=Servers,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test`.
- The earlier `CN=Computers` result came from before the move; this new independent test confirms the final OU location.
- Next lab step: create domain-local groups `DL_IT_Share_RW` and `DL_Finance_Share_RW` in the IAM-Lab Groups OU and nest departmental Global groups. Actual SMB/NTFS permissions remain unconfigured and untested.

## 2026-11-13 — IAM-FS01 computer account organization
- `Get-ADComputer` on IAM-DC01 confirmed IAM-FS01 is enabled and identified as Windows Server 2025 Standard Evaluation; initial distinguished name was in the default `CN=Computers` container.
- Active Directory Users and Computers screenshot now shows IAM-FS01 beneath `IAM-Lab/Servers`, indicating the object was moved in the GUI.
- A fresh post-move PowerShell distinguished-name verification is still pending; existing PowerShell output predates or does not yet reflect the move.
- Next: independently confirm `CN=IAM-FS01,OU=Servers,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test` before creating resource permission groups and shares.

## 2026-11-12 — Captured 13 cybersecurity portfolio ideas
- Added [Security Portfolio Backlog](SECURITY-PORTFOLIO-BACKLOG.md) covering 4 Detection & Response ideas, 3 Threat Intelligence & Investigation ideas, 5 Security Engineering ideas, and 1 AI & Security idea.
- Preserved all 13 supplied source links without claiming their destinations were reviewed.
- Defined a consistent recruiter-facing documentation/evidence standard: objective, architecture, test methodology, findings, limitations, lessons learned and sanitization.
- Preserved the Windows Active Directory project as the active lab; its extra project idea is treated as an extension rather than a new completed project.

## 2026-11-11 — IAM-FS01 computer trust confirmed
- On IAM-FS01, `Get-CimInstance Win32_ComputerSystem` reported `PartOfDomain : True` and `Domain : corp.iamlab.test`.
- `Test-ComputerSecureChannel -Verbose` returned `True` and reported that the secure channel with the domain is in good condition.
- `nltest /dsgetdc:corp.iamlab.test` successfully discovered `IAM-DC01.corp.iamlab.test` at `192.168.191.10`.
- AD computer account location has not yet been verified; next action is to inspect and relocate IAM-FS01 into the lab Servers OU. No SMB/NTFS shares have been configured yet.

## 2026-11-11 — IAM-FS01 joined to Active Directory
- Verified IAM-FS01 source IP `192.168.191.11` and DNS server `192.168.191.10` in PowerShell screenshot.
- Verified TCP connectivity from IAM-FS01 to IAM-DC01 on LDAP 389 and Kerberos 88 (`TcpTestSucceeded : True`).
- Server Manager shows `IAM-FS01` joined to `corp.iamlab.test` with the domain firewall profile enabled.
- Next: run secure-channel validation on the member server, verify the AD computer object, and organize the server account in the Servers OU. SMB/NTFS shares have not yet been created.

## 2026-11-11 — IAM-FS01 Active Directory DNS discovery verified
- On IAM-FS01, an explicit query to `192.168.191.10` returned the `corp.iamlab.test` A record (`192.168.191.10`).
- An LDAP DC discovery SRV query returned target `iam-dc01.corp.iamlab.test` and its A record (`192.168.191.10`).
- Windows DNS service discovery succeeded; the guest adapter's assigned DNS server and static IP still need confirmation before domain join.

## 2026-11-11 — IAM-FS01 identity and OS verified
- Verified Windows Server 2025 Standard Evaluation (build 10.0.26100) from PowerShell executed inside IAM-FS01.
- Verified in-guest hostname `IAM-FS01` and successful local Administrator sign-in.
- Next: validate VMware Tools and configure VMnet1 static IP/DNS before attempting a domain join.

## 2026-11-11 — IAM-FS01 installation milestone
- Reported IAM-FS01 Windows Server setup reached the local Administrator account creation stage; in-guest sign-in, edition, hostname and network settings still need verification.
- Kept domain join, file shares and permission testing marked as incomplete.

## 2026-11-11 — Portfolio launch
- Created the central Project-Lab portfolio and linked related IAM, Docker, proxy, monitoring and analytics repositories.
- Documented Windows Server 2025 installation, Active Directory forest, DNS, initial IAM directory layout and group checks.
- Recorded the firewall troubleshooting exercise and successful host-to-VM ping.
- Recorded Jordan Lee onboarding as user-reported completion, awaiting the next independent PowerShell verification.
- Recorded IAM-FS01 as VM configuration created; Windows Server installation and resource-permissions validation are planned.
- Added reusable read-only verification scripts, lab documentation, screenshot guidance and issue template.

## 2026-11-10 — Windows Active Directory foundation
- Installed IAM-DC01 on VMware Workstation using Windows Server 2025 Desktop Experience.
- Configured VMware VMnet1 host-only networking and a fixed lab IP address.
- Created the corp.iamlab.test forest with AD DS, DNS, and Global Catalog.
- Validated key domain services and domain-controller diagnostics.
- Created departmental OUs, fictional user accounts and four global departmental security groups.
