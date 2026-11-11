# Lab 05 — SMB File Server & Role-Based Access (Planned)

> **Status:** `IAM-FS01` virtual machine created; OS installation has not started. No share or NTFS access enforcement has been tested.

## Scenario
Two fictional employees have different permissions: Alex (IT) should be able to access IT resources, while Jordan (Finance) should be able to access Finance resources. Each should be denied access to the other department's share.

## Planned setup
- `IAM-FS01`: Windows Server 2025 member server, VMware VMnet1 Host-only.
- Proposed static address: `192.168.191.11/24`; DNS `192.168.191.10`.
- Domain: `corp.iamlab.test`.
- **Do not** promote the file server to a domain controller.

## Implementation checklist
- [ ] Install Windows Server on IAM-FS01 and configure its hostname.
- [ ] Set static IP and DNS to IAM-DC01; verify domain name resolution.
- [ ] Join the server to `corp.iamlab.test` and restart.
- [ ] Create IT and Finance folders and SMB shares.
- [ ] Create domain-local groups `DL_IT_Share_RW` and `DL_Finance_Share_RW`.
- [ ] Nest `GG_IT_Employees` into `DL_IT_Share_RW`.
- [ ] Nest `GG_Finance_Employees` into `DL_Finance_Share_RW`.
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
