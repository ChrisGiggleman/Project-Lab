# Project-Lab Roadmap

Last updated: **2026-11-11**

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
- [ ] Install the Windows Server OS on `IAM-FS01`
- [ ] Configure static IP and DNS pointing at the domain controller
- [ ] Join `IAM-FS01` to `corp.iamlab.test`
- [ ] Create departmental global groups and domain-local resource access groups (AGDLP)
- [ ] Create IT and Finance SMB shares with NTFS and share permissions
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

## Portfolio quality gates

For each completed lab: include purpose, environment, step summary, proof of testing, risk/security notes, mistakes and fixes, and the next improvement. Never mark future scenarios as completed before validation.