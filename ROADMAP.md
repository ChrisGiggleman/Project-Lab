# Project-Lab Roadmap

Last updated: **2026-11-13**

Status vocabulary: **Verified** (command/output observed), **Completed—reported** (user reports success, not yet independently verified), **In progress**, **Planned**.

## Phase 1 — Windows IAM Foundation

- [x] Provision a Windows Server 2025 VM in VMware Workstation (verified)
- [x] Configure host-only VMnet1 with a static domain controller address (verified)
- [x] Diagnose host-to-guest ping and add a narrowly scoped ICMP firewall rule (verified)
- [x] Deploy AD DS and DNS; create `corp.iamlab.test` with Windows Server 2025 forest/domain levels (verified)
- [x] Confirm NTDS, DNS and Netlogon are running; `dcdiag` connectivity, advertising and SYSVOL checks passed (verified)
- [x] Create OUs for employees, groups, privileged and service accounts, servers and workstations (verified)
- [x] Create IT user Alex Morgan and validate AD attributes (verified)
- [x] Create departmental global security groups (verified)
- [x] Verify IT group contains Alex Morgan (verified)
- [x] Create Finance user Jordan Lee (completed—reported; next verify details and membership)
- [ ] Confirm DNS SRV records, SYSVOL and NETLOGON SMB shares with recorded output

## Phase 2 — Resource authorization

- [x] Create the second VMware VM configuration, `IAM-FS01` (completed—reported)
- [x] Install Windows Server 2025 Standard Evaluation on `IAM-FS01`, configure Administrator account, sign in, and verify `hostname`/OS version (verified by in-guest PowerShell screenshot)
- [x] Verify IAM-FS01 source address `192.168.191.11` and configured DNS server `192.168.191.10`; DNS A/SRV resolution and LDAP/Kerberos TCP checks succeeded (screenshots verified)
- [ ] Verify VMware Tools and VMnet1 host-only adapter details / subnet mask and default gateway (not yet independently verified)
- [x] Verify AD DNS A record (`corp.iamlab.test` → `192.168.191.10`) and LDAP DC discovery SRV record from IAM-FS01 using DNS server `192.168.191.10` (screenshot verified)
- [x] Confirm LDAP TCP 389 and Kerberos TCP 88 reachable from `192.168.191.11` (`TcpTestSucceeded : True`)
- [x] Join `IAM-FS01` to `corp.iamlab.test` (Server Manager domain membership screenshot verified)
- [x] Verify IAM-FS01 domain membership, computer secure channel (`Test-ComputerSecureChannel : True`), and domain controller discovery (`nltest /dsgetdc` successfully returns IAM-DC01) — screenshot verified
- [x] Verify IAM-FS01 AD computer object exists and is enabled; ADUC shows it under `IAM-Lab/Servers` (GUI screenshot, 2026-11-13)
- [x] Independently verify `IAM-FS01` post-move Distinguished Name is `CN=IAM-FS01,OU=Servers,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test` (PowerShell screenshot, 2026-11-13)
- [x] Create and validate four departmental global security groups (verified previously)
- [x] Create `DL_IT_Share_RW` and `DL_Finance_Share_RW` and verify group nesting: `GG_IT_Employees` inside IT permission group and `GG_Finance_Employees` inside Finance permission group (PowerShell screenshot, 2026-11-13)
- [x] Verify `DL_Finance_Share_RW` is DomainLocal / Security (screenshot)
- [x] Confirm `DL_IT_Share_RW` is DomainLocal / Security in PowerShell (screenshot, 2026-11-13)
- [x] Create and verify `C:\LabShares\IT` and `C:\LabShares\Finance` directories on IAM-FS01 (PowerShell screenshot, 2026-11-13)
- [x] Inspect inherited NTFS permissions on IT and Finance folders; both show broad inherited BUILTIN\\Users rights (read/execute and create/append) plus SYSTEM and Administrators Full Control (screenshot 2026-11-13)
- [x] Back up 3 ACLs in `C:\IAM-Lab-ACL-Backup\before-ntfs-change.acl` (0 failures, screenshot 2026-11-13)
- [x] Apply explicit grants to IT for SYSTEM and Administrators Full Control and `CORP\DL_IT_Share_RW` Modify; disable inheritance with `/inheritance:r` (commands succeeded, screenshot 2026-11-13)
- [x] Verify IT folder final DACL: SYSTEM and Administrators Full Control; `CORP\DL_IT_Share_RW` Modify; no broad Users/Everyone ACEs; all ACEs explicit and `AreAccessRulesProtected=True` (2026-11-13 screenshot)
- [ ] Apply and verify Finance folder equivalent scoped DACL (SYSTEM and Administrators Full Control; `CORP\DL_Finance_Share_RW` Modify; inheritance disabled)
- [ ] Set least-privilege NTFS permissions and create IT and Finance SMB shares
- [ ] Verify authorized access and cross-department denial with non-privileged test users
- [ ] Document results with sanitized screenshots and PowerShell output

## Phase 3 — IAM operations

- [ ] Join a Windows client VM to the domain
- [ ] Demonstrate joiner/mover/leaver lifecycle tasks
- [ ] Build PowerShell scripts for repeatable, auditable provisioning
- [ ] Configure GPOs for sample workstation controls
- [ ] Practice least privilege, privileged account separation, and access reviews
- [ ] Add event log review for authentication and account changes

## Phase 4 — DevOps & monitoring

- [x] Docker/WSL2 foundation validated (documented in linked repository)
- [x] Nginx Proxy Manager deployment documented
- [x] Uptime Kuma deployment documented
- [ ] Linux troubleshooting challenge write-ups
- [ ] Git branching exercises and GitHub Actions practice
- [ ] Explore Grafana metrics and dashboards
- [ ] Evaluate Wazuh and other monitoring tools based on host resources

## Phase 5 — Cloud identity

- [ ] Choose an eligible Microsoft Entra test tenant and review licensing needs
- [ ] Study SSO integration (SAML/OIDC), Conditional Access, and user provisioning
- [ ] Run a documented identity access review exercise

## Candidate Security Projects — Backlog (13 ideas)

- [x] Capture all **13** ideas and original reference links in [Security Portfolio Backlog](SECURITY-PORTFOLIO-BACKLOG.md).
- [ ] Review source links, feasibility, tool licenses, hardware limits, risk boundaries and fit before selecting a project.
- [ ] Select a next project **after** finishing the active IAM-FS01 AD object organization / AGDLP and file share authorization tests.
- [ ] Produce a scoped architecture, test plan and evidence checklist for any selected candidate.
- [ ] Verify and document actual findings, limitations and mitigations before describing a new project as complete.

The **Active Directory Lab** idea extends the ongoing Windows IAM lab; do not count it as a second completed implementation. Suggested candidates after IAM are SIEM Log Analysis and SOC Detection & Response, contingent on resources and scope.

## Portfolio quality gates

For each completed lab: include purpose, environment, step summary, proof of testing, risk/security notes, mistakes and fixes, and the next improvement. Never mark future scenarios as completed before validation.