# Lab 03 — Directory Layout, Employee Provisioning and Security Groups

## OU structure

```text
corp.iamlab.test
└── IAM-Lab
    ├── Employees
    │   ├── IT
    │   ├── Human Resources
    │   ├── Finance
    │   └── Security
    ├── Groups
    ├── Privileged Accounts
    ├── Service Accounts
    ├── Servers
    └── Workstations
```

The hierarchy was built using Active Directory Users and Computers (ADUC). An accidental extra `IAM-Lab` OU level was identified and corrected without deleting the child OUs. The built-in Domain Controllers OU remains unchanged.

## Fictional employee test accounts
| Name | Account | Department | Title | Verification |
|---|---|---|---|---|
| Alex Morgan | `alex.morgan` | IT | IT Support Technician | Enabled account, attributes and OU verified by PowerShell |
| Jordan Lee | `jordan.lee` | Finance | Financial Analyst | Created and configured, user-reported; PowerShell evidence pending |

The organization and company name **IAM Lab Corporation** are fictional.

## Department groups (verified)
All groups are **Global / Security** and stored in `OU=Groups,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test`.

- `GG_IT_Employees`
- `GG_HR_Employees`
- `GG_Finance_Employees`
- `GG_Security_Employees`

PowerShell validation confirmed Alex Morgan as a member of `GG_IT_Employees`. Jordan's Finance group membership should be verified in the next exercise.

## Concepts
- **Organizational Units (OUs)** organize directory objects and support administration, delegation and GPO scope; OU placement **does not grant a file share permission**.
- **Global security groups** gather users with the same department/role.
- **Domain-local groups** (planned) represent resource-specific permissions.
- **AGDLP:** Accounts → Global Groups → Domain Local Groups → Permissions.

## Upcoming lifecycle scenarios
1. Joiner: Create employee account, place in department OU, assign required group.
2. Mover: Change department, remove obsolete group memberships and assign approved replacements.
3. Leaver: Disable account, review sessions and remove access according to policy.
4. Access review: Verify group membership and evidence that it remains justified.
