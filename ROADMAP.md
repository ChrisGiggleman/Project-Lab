# Project-Lab Roadmap

Last updated: **2026-11-17**

Status vocabulary: **Verified** (command/output observed), **Completed—reported** (user reports success, not yet independently verified), **In progress**, **Planned**.

## Integrated learning priorities

**Next session:** Inspect IAM-CL01 local privileges, validate separate employee domain sign-ins and Kerberos, repeat departmental access tests by DNS name, and review outstanding SYSVOL/NETLOGON checks before GPO and read-only PowerShell reporting. Workstation deployment and OU placement are verified; prior 4/4 SMB scenarios remain verified.

- **Primary track:** workforce IAM and enterprise administration; [IAM engineering plan](docs/iam/engineering-learning-plan.md).
- **Cross-cutting skill:** [scripting and automation curriculum](docs/automation/learning-plan.md) — PowerShell first, then Python, Bash, SQL/SPL/KQL; use guided practice followed by independent exercises and testing.
- **Complementary track:** [Blue Team and SOC plan](docs/security/blue-team-learning-plan.md) — TryHackMe practice alongside independent lab telemetry, SIEM, detection, vulnerability management and incident response.
- **Infrastructure:** retain existing [DevOps plan](docs/devops/learning-plan.md); introduce Docker, Git, cloud and Terraform when prerequisites are satisfied.
- **Resources:** [Learning resource library](docs/resources/cloud-learning-games.md) and [13-project backlog](SECURITY-PORTFOLIO-BACKLOG.md).

These are integrated learning tracks, not simultaneous deployments. Continue SC-300 preparation alongside the lab. Validate hardware capacity, licensing, isolation and budget before choosing tools.

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
- [x] Create Finance user Jordan Lee (verified enabled account and Finance membership, 2026-11-14)
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
- [x] Apply and verify Finance folder scoped DACL: SYSTEM and Administrators FullControl; `CORP\DL_Finance_Share_RW` Modify; all entries explicit; `AreAccessRulesProtected=True` (PowerShell screenshots 2026-11-13)
- [x] Verify least-privilege NTFS DACLs on both IT and Finance departmental folders
- [x] Create and verify `IT` SMB share on IAM-FS01: path `C:\LabShares\IT`, access-based enumeration enabled, Administrators Full and `CORP\DL_IT_Share_RW` Change, with no broad-access share grants (PowerShell screenshots, 2026-11-13)
- [x] Create and verify `Finance` SMB share: path `C:\LabShares\Finance`, Administrators Full and `CORP\DL_Finance_Share_RW` Change, no broad access, AccessBased enumeration (PowerShell screenshots, 2026-11-14)
- [x] Verify authorized access and cross-department denial with non-privileged test users (4/4 scenarios; 22/22 checklist observations, 2026-11-14)
- [x] Document results with sanitized PowerShell evidence transcription in [Lab 05](docs/iam/05-file-server-rbac-plan.md); raw screenshots not published
- [x] Clean up test SMB connection (net use and Get-SmbConnection empty, 2026-11-14)
- [ ] Validate separate standard-user domain workstation sessions and Kerberos

## Phase 3 — IAM operations

- [x] Join Windows 11 client IAM-CL01 to the domain; secure channel and DC discovery verified (2026-11-17)
- [x] Verify workstation Secure Boot, TPM, static IP/DNS and Workstations OU placement; see [Lab 06](docs/iam/06-workstation-deployment.md)
- [ ] Demonstrate joiner/mover/leaver lifecycle tasks
- [ ] Build PowerShell scripts for repeatable, auditable provisioning
- [ ] Configure GPOs for sample workstation controls
- [ ] Practice least privilege, privileged account separation, and access reviews
- [ ] Add event log review for authentication and account changes

- [ ] Inventory and audit service accounts; distinguish human and workload identities
- [ ] Develop read-only PowerShell reports and progressively test reusable JML scripts with rollback
- [ ] Validate authentication, authorization and audit events before expanding monitoring

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

## Phase 6 — SOC and defensive security

- [ ] Practice TryHackMe SOC investigations; retain original notes without publishing restricted content
- [ ] Enable scoped Windows audit policy and Sysmon; verify controlled events
- [ ] Assess hardware and deploy one SIEM (Wazuh proposed); ingest lab telemetry and validate a detection
- [ ] Learn Splunk SPL and Sentinel KQL using suitable training/sandbox environments
- [ ] Document identity-related alerts, triage, false-positive tests and incident reports
- [ ] Evaluate Sigma/YARA, vulnerability assessment, Wireshark/Zeek/Suricata, threat intelligence and forensics in sequence
- [ ] See [Blue Team learning plan](docs/security/blue-team-learning-plan.md) for tool references and evidence requirements

## Phase 7 — IAM engineering and cloud integrations

- [ ] Study AuthN/AuthZ, federation, provisioning, LDAP, SAML, OAuth, OIDC, JWT, SCIM, WebAuthn and certificates
- [ ] Evaluate and deploy isolated Keycloak; configure SSO for two mock applications
- [ ] Practice Microsoft Graph/REST APIs and mock SCIM provisioning/deprovisioning
- [ ] Implement simulated access certification, access request workflow and privileged-account audits
- [ ] Explore IGA/PAM platforms (SailPoint, Saviynt, CyberArk, BeyondTrust) only with suitable licensed training access
- [ ] Evaluate AWS IAM/CIEM, Terraform, workload identities and secrets management in a cost-controlled sandbox
- [ ] See [IAM engineering plan](docs/iam/engineering-learning-plan.md) for learning outcomes and dependencies

## Candidate Security Projects — Backlog (13 ideas)

- [x] Capture all **13** ideas and original reference links in [Security Portfolio Backlog](SECURITY-PORTFOLIO-BACKLOG.md).
- [ ] Review source links, feasibility, tool licenses, hardware limits, risk boundaries and fit before selecting a project.
- [ ] Select a next project **after** closing the remaining workstation/Kerberos validation and core IAM operations milestones.
- [ ] Produce a scoped architecture, test plan and evidence checklist for any selected candidate.
- [ ] Verify and document actual findings, limitations and mitigations before describing a new project as complete.

The **Active Directory Lab** idea extends the ongoing Windows IAM lab; do not count it as a second completed implementation. Suggested candidates after IAM are SIEM Log Analysis and SOC Detection & Response, contingent on resources and scope.

## Portfolio quality gates

For each completed lab: include purpose, environment, step summary, proof of testing, risk/security notes, mistakes and fixes, and the next improvement. Never mark future scenarios as completed before validation.