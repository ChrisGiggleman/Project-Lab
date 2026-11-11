# Windows Active Directory & IAM Lab

**Status: Active development** — first domain controller and basic identity provisioning completed; file-server authorization testing planned.

## Lab objectives

Build practical IAM administration experience with Windows Server 2025, Active Directory Domain Services, DNS, PowerShell, least privilege, and group-based permissions.

## Verified work

- Windows Server 2025 Desktop Experience installed on `IAM-DC01`.
- New `corp.iamlab.test` forest created at Windows Server 2025 functional level.
- DNS, NTDS and Netlogon services running; `dcdiag` Connectivity, Advertising and SysVolCheck passed.
- VMware host-only network configured; successful ping after scoped firewall rule.
- OUs and four departmental Global Security groups created.
- IT account Alex Morgan and IT group membership verified via PowerShell.

## Reported / pending

- Jordan Lee's Finance onboarding was reported complete; PowerShell verification of account and membership is pending.
- `IAM-FS01` VM configuration exists, but its OS is not yet installed.
- SMB/NTFS access control has not yet been tested.

## Contents

1. [Architecture](01-architecture.md)
2. [Domain-controller deployment](02-domain-controller-deployment.md)
3. [Directory and onboarding](03-directory-and-onboarding.md)
4. [Validation and troubleshooting](04-validation-and-troubleshooting.md)
5. [Planned file-server RBAC lab](05-file-server-rbac-plan.md)

See [verification scripts](../../scripts/iam/README.md) for reusable read-only checks.
