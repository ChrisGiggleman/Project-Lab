# Project-Lab | Cybersecurity, IAM & DevOps Portfolio

**Hands-on infrastructure and security labs documenting real configurations, testing, troubleshooting, and lessons learned.**

[![Portfolio](https://img.shields.io/badge/Focus-IAM%20%7C%20Cybersecurity%20%7C%20DevOps-2563eb)](#project-portfolio) [![Status](https://img.shields.io/badge/Status-Active%20development-15803d)](ROADMAP.md)

> **Portfolio purpose:** Demonstrate practical skills in identity administration, access controls, Windows Server, networking, PowerShell, Docker, observability, and technical documentation. All users, company names, and domains described in the IAM exercises are fictional lab data.

## Featured lab: Windows Server & Active Directory

**Goal:** Build and administer a small, isolated enterprise-style Windows environment and validate identity lifecycle and role-based access.

| Component | Current status | Evidence |
|---|---|---|
| Windows Server 2025 domain controller (`IAM-DC01`) | **Completed** | [Deployment record](docs/iam/02-domain-controller-deployment.md) |
| New forest, domain and DNS (`corp.iamlab.test`) | **Completed** | `Get-ADDomain`, `Get-ADForest`, service checks, `dcdiag` |
| Organizational units for employee and admin separation | **Completed** | [Directory and onboarding](docs/iam/03-directory-and-onboarding.md) |
| Initial employee provisioning (IT and Finance) | **Completed (lab-reported)** | AD user verification demonstrated for IT; Finance account created |
| Four departmental global security groups | **Completed** | PowerShell group enumeration; IT membership verified |
| Member file server VM (`IAM-FS01`) | **OS installed/account created (reported); configuration pending** | [RBAC test plan](docs/iam/05-file-server-rbac-plan.md) |
| Domain join, SMB/NTFS authorization testing | **Planned** | [RBAC test plan](docs/iam/05-file-server-rbac-plan.md) |
| Entra ID integration, MFA/SSO, access reviews | **Planned** | [Roadmap](ROADMAP.md) |

**Technical stack:** Windows Server 2025 · Active Directory Domain Services · DNS · PowerShell · VMware Workstation · Windows Defender Firewall · SMB/NTFS (planned) · Microsoft Entra ID (planned)

### Lab architecture

```text
Main Windows workstation / VMware Workstation
└── VMnet1: isolated host-only network
    ├── IAM-DC01 — Windows Server 2025
    │   ├── AD DS / DNS / Global Catalog
    │   ├── corp.iamlab.test
    │   └── Departmental OUs and security groups
    └── IAM-FS01 — file-server candidate (OS and local account created; domain join pending)
        ├── IT resource access (planned)
        └── Finance resource access (planned)

Separate GEEKOM mini PC
└── Windows 11 Pro + WSL2 + Docker Desktop
    ├── Docker foundation lab
    ├── Nginx Proxy Manager
    └── Uptime Kuma
```

The lab is **not bridged to the home LAN**; domain controller services remain on the VM's host-only segment. Documentation deliberately avoids sharing credentials or complete live configuration exports.

## Project portfolio

| Project | Area | What it demonstrates |
|---|---|---|
| [IAM Access Governance Lab](https://github.com/ChrisGiggleman/IAM-Access-Governance-Lab) | IAM | Identity lifecycle, access governance scenarios, Entra ID concepts |
| [IAM-SOC Analytics Lab](https://github.com/ChrisGiggleman/IAM-SOC-Analytics-Lab) | Security analytics | SQL/Python investigations, simulated identities, security reporting |
| [Docker Homelab Foundation](https://github.com/ChrisGiggleman/docker-homelab-foundation) | Containers | Docker Compose, bridge networking, persistent volumes and validation |
| [Nginx Proxy Manager Homelab](https://github.com/ChrisGiggleman/nginx-proxy-manager-homelab) | Networking | Reverse proxy, local name resolution, persistent configuration |
| [Uptime Kuma Homelab](https://github.com/ChrisGiggleman/uptime-kuma-homelab) | Observability | Service monitoring, outage/recovery testing, notifications |
| [SOC 30-Day Challenge](https://github.com/ChrisGiggleman/SOC-30-Day-Challenge) | Cybersecurity | Structured security learning and practical exercises |

The individual repositories contain the detailed implementation notes and files for those independent projects. This repository is the central navigation and progress hub, with dedicated write-ups for the Windows IAM lab.

## Documentation

- [IAM Lab overview](docs/iam/README.md)
- [Architecture & network boundaries](docs/iam/01-architecture.md)
- [Windows Server deployment](docs/iam/02-domain-controller-deployment.md)
- [Directory structure and initial onboarding](docs/iam/03-directory-and-onboarding.md)
- [Network troubleshooting and health checks](docs/iam/04-validation-and-troubleshooting.md)
- [RBAC / file-server plan](docs/iam/05-file-server-rbac-plan.md)
- [Docker & DevOps project index](docs/devops/README.md)
- [DevOps learning plan](docs/devops/learning-plan.md)
- [Read-only IAM validation scripts](scripts/iam/README.md)
- [Project roadmap](ROADMAP.md) · [Change log](CHANGELOG.md) · [Screenshot policy](screenshots/README.md)

## Working approach

Each lab is organized as **Objective → Architecture → Implementation → Verification → Troubleshooting → Security considerations → Lessons learned → Next step**. Results are marked *completed*, *verified*, or *planned* so the portfolio stays evidence-based.

## Security and responsible disclosure

This repository contains only training-lab notes and sanitized examples. **No passwords, tokens, private keys, production data, customer information, or real business configurations belong here.** See [SECURITY.md](SECURITY.md).

---

**Maintained by [ChrisGiggleman](https://github.com/ChrisGiggleman).** Focus areas: IAM administration, cybersecurity operations, automation, and infrastructure engineering.