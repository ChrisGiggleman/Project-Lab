# Lab 06 — Enterprise Windows Workstation

**Checkpoint: 2026-11-17 — deployment, domain trust and OU placement verified.** Employee sign-ins, Kerberos and GPO remain pending.

## Objective and scope
Deploy an isolated Windows client for workforce IAM, endpoint security, role-based access and Group Policy exercises. Use fictional lab users only.

## Verified environment
- IAM-CL01: Windows 11 Enterprise Evaluation, build 26300, 2 logical processors, 4 GB RAM, local LabAdmin account.
- VM configuration stored on secondary SSD at D:\Virtual Machines\IAM-CL01; 80 GB split disk selected in wizard (final disk size not independently rechecked).
- UEFI, TPM present/ready/enabled; Secure Boot initially False, then True after enabling it in powered-off VM settings. Before the change BitLocker reported FullyDecrypted, Off, 0%. BitLocker deployment remains future work.
- VMnet1 host-only subnet 192.168.191.0/24; DHCP range .128–.254 observed in Virtual Network Editor. Workstation Ethernet0 static 192.168.191.20/24, DNS 192.168.191.10, no gateway; ipconfig reported Preferred and DHCP disabled.
- DNS A record and LDAP SRV record correctly resolved to IAM-DC01. TCP 88 and 389 to DC and TCP 445 to IAM-FS01 succeeded from .20; nltest DC discovery succeeded.
- Joined corp.iamlab.test; PartOfDomain True, Test-ComputerSecureChannel True, nltest successful.
- AD computer enabled; DNSHostName IAM-CL01.corp.iamlab.test; OperatingSystem Windows 11 Enterprise Evaluation.
- Moved from CN=Computers into OU=Workstations,OU=IAM-Lab,DC=corp,DC=iamlab,DC=test; verified post-move distinguished name and ADUC GUI.

## Troubleshooting and evidence
- Host inventory: 8 logical processors, approximately 32 GB RAM, 8.85 GB free at measurement; chose 4 GB client to limit resource pressure. C/D SATA SSDs, E USB HDD. Existing servers left on C, new client on D, ISO on E.
- Clipboard initially unavailable; VMware Tools installation suggested, exact installation/version not independently verified.
- Network adapter initially showed Media disconnected; subsequent DHCP lease .130 and service connectivity demonstrated restored link. Server connectivity initially failed because both server VMs were powered off (user confirmed); both tests passed after startup without firewall changes.
- Initial AD OS attribute query omitted -Properties OperatingSystem; corrected query displayed edition.
- Evidence is sanitized transcription of user screenshots; no credentials, raw host identifiers, encryption passwords or raw screenshots published.

## Next validation
- Inspect workstation local Administrators and relevant privileges before standard-user sign-ins.
- Sign in separately as Alex and Jordan, verify identity and token, access shares by DNS name without explicit alternate credentials; verify Kerberos tickets and repeat positive/negative authorization tests.
- Verify remaining SYSVOL/NETLOGON baseline, then scope and test workstation GPOs.
- TPM specification version, VMware Tools version, final virtual disk capacity and post-join employee authentication remain unverified.
