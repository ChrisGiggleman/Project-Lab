# Lab 04 — Validation and Troubleshooting

## Domain health verification
The following checks were observed on `IAM-DC01`:

```powershell
hostname
Get-ADDomain
Get-ADForest
Get-Service NTDS,DNS,Netlogon
dcdiag /test:Advertising /test:SysVolCheck
```

**Passed:** Connectivity, Advertising, SysVolCheck. Domain/forest values matched the planned configuration and AD DS, DNS and Netlogon services were running.

**Not yet independently demonstrated:** explicit DNS SRV record queries and SMB share listings for SYSVOL/NETLOGON. Those remain in the next verification checklist.

## Incident: ICMP echo requests timed out

### Symptom
The VMware host could not ping `192.168.191.10`, and the VM could not ping the host. The VM had correct static IPv4 and DNS client configuration.

### Investigation
- Verified VMware network mode was **Host-only**.
- Verified subnet `192.168.191.0/24` and DHCP pool `192.168.191.128–254`, leaving planned static addresses outside the pool.
- Host neighbor discovery resolved `192.168.191.10` to a MAC address with state `Reachable`, suggesting Layer 2 connectivity.
- Suspected Windows Defender Firewall blocking inbound ICMP echo requests.

### Remediation
On the server, created a firewall rule limited to ICMPv4 echo requests from `192.168.191.1` (host-only adapter), **without disabling the firewall**:

```powershell
New-NetFirewallRule -DisplayName "IAM Lab - Allow ICMPv4 from Host" `
    -Direction Inbound -Protocol ICMPv4 -IcmpType 8 `
    -RemoteAddress 192.168.191.1 -Action Allow -Profile Any
```

### Validation
A subsequent host-to-VM `ping 192.168.191.10` received **4 of 4 replies**, 0% packet loss.

### Lessons
- Successful ARP discovery is distinct from successful IP connectivity.
- Test one layer at a time; avoid changing multiple variables during troubleshooting.
- Prefer narrowly scoped firewall exceptions over blanket firewall disabling.
