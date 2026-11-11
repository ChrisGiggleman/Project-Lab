# Lab 02 — Windows Server 2025 Domain Controller Deployment

## Objective
Install Windows Server and create the first domain controller of a stand-alone training forest.

## Environment
- VMware Workstation, main desktop with 32 GB RAM.
- `IAM-DC01`, 2 vCPUs, 4 GB guest RAM, 80 GB virtual disk.
- Windows Server 2025 **Standard (Desktop Experience)** from official evaluation media.
- Isolated VMware host-only segment.

## Implementation summary
1. Created a new virtual machine and attached the Windows Server ISO for a manual installation.
2. Selected Desktop Experience, installed Windows, and created a local Administrator password stored securely outside this repository.
3. Installed VMware Tools; renamed the guest to `IAM-DC01`.
4. Configured a static host-only address `192.168.191.10/24`; no default gateway; DNS client pointed to the server itself.
5. Added the Active Directory Domain Services role through Server Manager.
6. Promoted the server as the first controller in the new forest `corp.iamlab.test`.
7. Selected Windows Server 2025 domain and forest functional levels, DNS Server and Global Catalog.
8. Set a separate Directory Services Restore Mode password (not recorded here).
9. Completed prerequisite check; accepted the expected DNS delegation warning for an isolated new forest.
10. Rebooted and signed in with domain Administrator.

## Verification observed
- `Get-ADDomain`: DNS root `corp.iamlab.test`, NetBIOS name `CORP`, Windows2025Domain mode.
- `Get-ADForest`: Windows2025Forest, `IAM-DC01.corp.iamlab.test` as Global Catalog and initial FSMO role holder.
- `Get-Service NTDS,DNS,Netlogon`: all `Running`.
- `dcdiag /test:Advertising /test:SysVolCheck`: Connectivity, Advertising and SysVolCheck all passed.

## Notes
- The domain has **one** controller; availability and redundancy tests are future exercises.
- The evaluation installation is time-limited and not intended for production.
- A VMware snapshot was recommended before AD DS installation, but its creation has not been independently verified in this documentation.
