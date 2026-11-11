# IAM Lab Verification Scripts

PowerShell scripts in this folder are **read-only examples** designed for the isolated training forest. They do not create, modify or delete Active Directory objects.

- [verify-domain.ps1](verify-domain.ps1): Verify AD domain/forest, services, DNS discovery and SYSVOL shares.
- [verify-identities.ps1](verify-identities.ps1): Check fictional test users, departmental security groups and membership.

Run only on systems you own or administer, using a sufficiently privileged account. Review all output before sharing screenshots to avoid exposing information not intended for publication.

Example:

```powershell
.\verify-domain.ps1
.\verify-identities.ps1
```

Some checks need PowerShell's ActiveDirectory module and Windows Server RSAT/AD DS tools.
