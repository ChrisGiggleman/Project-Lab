# Lab 01 — Architecture and Network Boundaries

## Goal
A training-only Windows identity environment separated from the ordinary home LAN.

## Current architecture

```text
Main Windows workstation — VMware Workstation
└── VMnet1 — Host-only segment (192.168.191.0/24)
    ├── Host virtual adapter: 192.168.191.1
    ├── IAM-DC01: 192.168.191.10 (Windows Server 2025)
    │   ├── corp.iamlab.test (AD DS + DNS)
    │   ├── Global Catalog / Netlogon
    │   └── Departmental OU and security-group structure
    └── IAM-FS01 (VM definition created; OS pending)
        └── Planned address: 192.168.191.11

Separate GEEKOM mini PC
└── Windows 11 Pro + WSL2 + Docker Desktop
    ├── Docker foundation
    ├── Nginx Proxy Manager
    └── Uptime Kuma
```

## Networking
- VMware network: VMnet1, **Host-only**, not bridged to the home LAN.
- VMnet1 host-side address: `192.168.191.1/24`.
- VMware DHCP range: `192.168.191.128` to `192.168.191.254`.
- `IAM-DC01`: `192.168.191.10/24`, no default gateway, DNS set to itself.
- Proposed `IAM-FS01`: `192.168.191.11/24`, DNS `192.168.191.10`, no default gateway.
- These addresses are **lab-only private addresses**, not public endpoints.

## Hardware and VM allocation
| Machine | Guest OS | vCPU | RAM | Disk | Status |
|---|---|---:|---:|---:|---|
| IAM-DC01 | Windows Server 2025 Desktop Experience | 2 | 4 GB | 80 GB | Operating |
| IAM-FS01 | Windows Server 2025 Desktop Experience | 2 (planned) | 4 GB (planned) | 60 GB (planned) | VM configuration only |

## Security boundaries
Host-only networking keeps domain services off the ordinary LAN. The host's firewall remains enabled; one scoped rule permits ICMPv4 echo requests from the host-only adapter to IAM-DC01. Avoid publishing secrets, account passwords, license keys, or real production configurations.
