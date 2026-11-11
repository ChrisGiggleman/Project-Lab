# Changelog

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
