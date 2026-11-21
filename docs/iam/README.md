# Windows Active Directory & IAM Lab

**Status: Active development** — domain controller, employee provisioning and departmental SMB authorization verified; workstation deployment and OU placement verified; employee sign-ins and Kerberos pending.

## Lab objectives

Build practical IAM administration experience with Windows Server 2025, Active Directory Domain Services, DNS, PowerShell, least privilege, and group-based permissions.

## Verified work

- Windows Server 2025 Desktop Experience installed on `IAM-DC01`.
- New `corp.iamlab.test` forest created at Windows Server 2025 functional level.
- DNS, NTDS and Netlogon services running; `dcdiag` Connectivity, Advertising and SysVolCheck passed.
- VMware host-only network configured; successful ping after scoped firewall rule.
- OUs and four departmental Global Security groups created.
- IT account Alex Morgan and IT group membership verified via PowerShell.

## Additional verified work and pending checks

- Alex Morgan and Jordan Lee are enabled and departmental memberships verified.
- `IAM-FS01` is installed, joined to the domain and placed in the Servers OU; secure channel verified.
- Departmental AGDLP nesting, SMB and NTFS ACLs verified. Four authorization scenarios passed (22/22 observations) on 2026-11-14; see [Lab 05](05-file-server-rbac-plan.md).
- SMB test session cleanup verified; IAM-CL01 deployed and domain trust/Workstations OU verified (2026-11-17).
- Pending: separate standard-user domain workstation sessions, Kerberos validation and remaining baseline checks.

## Contents

1. [Architecture](01-architecture.md)
2. [Domain-controller deployment](02-domain-controller-deployment.md)
3. [Directory and onboarding](03-directory-and-onboarding.md)
4. [Validation and troubleshooting](04-validation-and-troubleshooting.md)
5. [File-server RBAC lab and results](05-file-server-rbac-plan.md)

6. [Workstation deployment](06-workstation-deployment.md)
7. [IAM engineering learning plan](engineering-learning-plan.md)
8. [Scripting and automation curriculum](../automation/learning-plan.md)
9. [Blue Team and SOC learning plan](../security/blue-team-learning-plan.md)
10. [Active Directory basics — diagram and quick reference](../resources/active-directory-basics.md)

See [verification scripts](../../scripts/iam/README.md) for reusable read-only checks.
