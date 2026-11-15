# Blue Team & SOC — Practical Learning Plan

**Status:** Proposed, not deployed or verified. Derived from the shared Red/Blue Team infographic and subsequent discussion; the image's tiny tool labels were not reliably readable, so the tool list below is a curated recommendation rather than a transcription.

## Approach

Use TryHackMe SOC Simulator/Splunk training for simulated alert triage and investigation. Independently reproduce concepts in the existing isolated enterprise lab, then document original evidence and lessons. Do not publish restricted platform content, answers, proprietary datasets, or screenshots without permission. Reuse [IAM-SOC Analytics Lab](https://github.com/ChrisGiggleman/IAM-SOC-Analytics-Lab) for SQL/Python analytics instead of duplicating it.

## Sequencing and evidence

| Stage | Tools / concepts | Practical evidence |
|---|---|---|
| 1 | Active Directory, Windows audit policy, Sysmon, Defender | Controlled account/group changes, failed logons, process events; expected event IDs and timestamps |
| 2 | Wazuh first; Splunk/SPL and Sentinel/KQL as separate optional exercises | Agent/log ingestion, baseline queries, alert rule, false-positive test and investigation report |
| 3 | Sigma, YARA, MITRE ATT&CK | Document safe detection logic, expected positive/negative tests and limitations |
| 4 | Nessus or Greenbone/OpenVAS | Authorized asset inventory, vulnerability report, patch/remediation and rescan comparison |
| 5 | Wireshark, Zeek, Suricata | Capture own lab traffic, identify protocol flows, produce a validated network alert |
| 6 | VirusTotal, MISP, AbuseIPDB; Velociraptor, TheHive | Public/synthetic IOC enrichment, incident timeline, triage/escalation playbook; no private file uploads |
| 7 | Autopsy, Volatility; later REMnux, FLARE-VM | Forensics on synthetic artifacts; isolated benign malware-analysis simulations only until specialist controls are established |
| 8 | Cloud and container security, Terraform checks | Cost-controlled authorized lab, access/configuration findings, remediation and teardown |

## Initial SOC architecture and scenarios

IAM-DC01, IAM-FS01 and a future standard-user Windows workstation on VMnet1 provide lab telemetry. Assess host capacity and network reachability before deploying the SIEM; the 8 GB mini PC is already used for WSL/Docker, so do not assume adequate capacity. Evaluate a dedicated Linux VM on the 32 GB workstation and deploy only one heavy platform at a time. Preserve host-only isolation, avoid exposing services to the internet, and use snapshots/rollback. If internet access is needed for packages, use a controlled temporary access path rather than bridging vulnerable endpoints.

Practice failed authentication, account lockouts, membership changes, privileged account creation, benign PowerShell activity, file-share access and vulnerability remediation. Establish expected events, timestamp/source correlation, severity, true/false-positive reasoning, escalation, and a repeatable test plan. Use controlled test data; never test third-party systems without authorization. No real ransomware or malware in the existing lab.

## References and tools

| Area | Starting points |
|---|---|
| Training | [TryHackMe](https://tryhackme.com/), [MITRE ATT&CK](https://attack.mitre.org/) |
| SIEM | [Wazuh](https://documentation.wazuh.com/), [Splunk](https://docs.splunk.com/), [Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/) |
| Endpoint | [Sysmon](https://learn.microsoft.com/sysinternals/downloads/sysmon), [Microsoft Defender](https://learn.microsoft.com/defender/) |
| Detections | [Sigma](https://github.com/SigmaHQ/sigma), [YARA](https://virustotal.github.io/yara/) |
| Vulnerabilities | [Nessus](https://www.tenable.com/products/nessus), [Greenbone](https://greenbone.github.io/docs/) |
| Network | [Wireshark](https://www.wireshark.org/), [Zeek](https://zeek.org/), [Suricata](https://suricata.io/) |
| Intelligence | [VirusTotal](https://www.virustotal.com/), [MISP](https://www.misp-project.org/), [AbuseIPDB](https://www.abuseipdb.com/) |
| Response | [Velociraptor](https://docs.velociraptor.app/), [TheHive](https://thehive-project.org/) |
| Forensics | [Autopsy](https://www.autopsy.com/), [Volatility 3](https://github.com/volatilityfoundation/volatility3) |
| Advanced | [REMnux](https://remnux.org/), [FLARE-VM](https://github.com/mandiant/flare-vm) |

Verify current terms, licenses, resource requirements and costs before installation. These are reference bookmarks, not validated deployments.
