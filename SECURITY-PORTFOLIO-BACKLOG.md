# Security Portfolio Project Ideas — 13-Project Backlog

**Added:** 2026-11-12  
**Status:** Ideas / research backlog, **not implemented** (except the separately documented Windows Active Directory lab already underway).  
**Purpose:** Explore potential practical cybersecurity portfolio projects across detection, investigation, security engineering, and AI security. Completing a project requires demonstrable, authorized testing and documented evidence—not simply uploading code.

> **Current priority remains:** Finish the [Windows IAM file-server authorization lab](docs/iam/05-file-server-rbac-plan.md), including IAM-FS01 computer object organization and AGDLP/SMB/NTFS access tests. These ideas are recorded for future selection; this list is **not** a commitment to build all 13 in parallel.

> **Source links:** The LinkedIn short URLs below were supplied as references. Their destinations, authorship, suitability, and licensing have **not yet been individually validated**. Review each before using external code or tools.

## Detection & response

| # | Candidate project | Portfolio problem / demonstration | Source | Status |
|---|---|---|---|---|
| 1 | **SOC Detection & Response Platform** | Ingest safe test telemetry, write and validate detection rules, map observed techniques to MITRE ATT&CK and document triage decisions. | [Reference](https://lnkd.in/gUvmmQGz) | Idea |
| 2 | **SIEM Log Analysis Platform** | Correlate Windows, Linux, and firewall logs; build detection queries, dashboards, and a small investigated incident timeline. | [Reference](https://lnkd.in/gA_mdGPH) | Idea |
| 3 | **Ransomware Detection System** | Evaluate YARA and benign file-behavior simulations for suspicious activity, with false-positive and detection limitations. | [Reference](https://lnkd.in/g5qbAzu5) | Idea |
| 4 | **Threat Hunting Platform** | Hunt through a controlled endpoint dataset, document hypotheses, evidence, and outcomes for suspicious activity. | [Reference](https://lnkd.in/gteTx29q) | Idea |

## Threat intelligence & investigation

| # | Candidate project | Portfolio problem / demonstration | Source | Status |
|---|---|---|---|---|
| 5 | **Threat Intelligence Platform** | Ingest public or synthetic indicators of compromise, enrich with context, deduplicate, score confidence, and track freshness. | [Reference](https://lnkd.in/gFEDsrT2) | Idea |
| 6 | **Malware Analysis Sandbox** | Design an isolated analysis environment and document controlled observation of benign or vetted training samples and analysis artifacts. | [Reference](https://lnkd.in/gtVyCHNs) | Idea |
| 7 | **DFIR Toolkit** | Collect forensic artifacts from owned test systems, establish provenance, create timelines, and report findings with uncertainty. | [Reference](https://lnkd.in/gYRzCc-N) | Idea |

## Security engineering

| # | Candidate project | Portfolio problem / demonstration | Source | Status |
|---|---|---|---|---|
| 8 | **Cloud Security Monitoring Dashboard** | Visualize cloud identity/configuration misconfigurations using permitted trial accounts or synthetic data; provide remediation guidance. | [Reference](https://lnkd.in/gSpuiBt4) | Idea |
| 9 | **Active Directory Lab** | Extend the **existing** [Windows IAM lab](docs/iam/README.md) with hardening, auditing, delegated administration, GPOs, and identity attack-path mitigation exercises in an isolated environment. | [Reference](https://lnkd.in/gUD2prMf) | **In progress via existing lab** |
| 10 | **Kubernetes Security Scanner** | Assess a local test cluster's configuration and RBAC against documented policy checks, with reproducible findings. | [Reference](https://lnkd.in/gbTKWg5R) | Idea |
| 11 | **Automated Vulnerability Scanner** | Assess explicitly authorized lab targets, prioritize findings using impact/context, and report remediation and rescans. | [Reference](https://lnkd.in/gNd6bxud) | Idea |
| 12 | **Web Application Testing Toolkit** | Build a safe, scoped testing checklist, sample tooling, evidence capture, and a report against a deliberately vulnerable training app. | [Reference](https://lnkd.in/gn5HU_T3) | Idea |

## AI & security

| # | Candidate project | Portfolio problem / demonstration | Source | Status |
|---|---|---|---|---|
| 13 | **AI-Powered Phishing Detector** | Classify an appropriately sourced or synthetic email dataset, explain confidence, and evaluate false positives, false negatives, bias, and limitations. | [Reference](https://lnkd.in/ghgUGYH2) | Idea |

## Suggested sequencing (not a commitment)

1. **Continue #9 — Active Directory Lab** inside the existing IAM environment. Complete secure access checks and document the authorization results before expanding to hardening.
2. **Consider #2 — SIEM Log Analysis** next: the Windows servers and existing Docker/monitoring work could make a small, isolated logging pipeline a logical extension once resource use is assessed.
3. **Then consider #1 — SOC Detection & Response**: build tested detection content and a triage playbook using the SIEM signals.
4. **Consider #11 — Vulnerability Scanner** as a separate defensive assessment of only the systems you control.
5. Select other candidates based on available hardware, licensing, interests, and which job responsibilities the work can credibly demonstrate.

Do not combine all 13 into one enormous untestable application. Prefer independently verifiable lab modules linked from the central portfolio.

## Documentation standard for every lab

Create a dedicated write-up with these sections before calling any new project **Verified**:

1. **Problem and objective:** What security issue, operational decision, or risk is being addressed? Who benefits?
2. **Scope and authorization:** Which systems and data are in scope? What is intentionally excluded?
3. **Architecture and threat model:** Components, data flows, network boundaries, trust relationships, dependencies and resource constraints.
4. **Implementation:** Reproducible setup and configuration, with redacted/synthetic examples and version notes.
5. **Testing method:** Test cases, input data, expected outputs, positive/negative tests, validation commands and repeatable evidence.
6. **Findings and response:** What actually happened, how results were interpreted, severity/priority and recommended remediation.
7. **Limitations:** Blind spots, false positives/negatives, unstable dependencies, scale constraints and unvalidated assumptions.
8. **Lessons learned and next improvements:** Troubleshooting, design trade-offs, next iterations and maintenance notes.
9. **Evidence:** Sanitized screenshots, queries, logs, rules, test output, and where appropriate diagrams. Clearly date the verification.

Suggested project states: `Idea → Researching → Designed → Building → Tested → Documented → Verified`. A passing test should not be inferred from code merely existing.

## Safety and ethics

- Run tests only on systems and accounts you own or have explicit permission to assess.
- Keep Active Directory, malware analysis, sample applications and scanning targets on isolated lab networks. Never scan the public internet or third-party services without authorization.
- For ransomware-oriented exercises use **benign simulations** (e.g., controlled bulk changes to synthetic test files) to validate monitoring; do not deploy real ransomware.
- Malware analysis requires separate isolation and rollback controls; do not assume the current VMware host-only lab is automatically suitable for live malicious samples.
- Do not push credentials, raw forensic dumps containing real personal information, live malicious binaries, customer data, or private keys to a public repository.
- Review licensing and data usage terms of linked projects before reuse.

## Related work

- [Current IAM file-server plan](docs/iam/05-file-server-rbac-plan.md)
- [Existing IAM/SOC analytics work](https://github.com/ChrisGiggleman/IAM-SOC-Analytics-Lab)
- [Existing Docker foundation](https://github.com/ChrisGiggleman/docker-homelab-foundation)
- [Main roadmap](ROADMAP.md)
