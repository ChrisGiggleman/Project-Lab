# 20 Cybersecurity Websites to Know — Reference Directory

A categorized resource library for SOC, IAM, GRC, incident response, vulnerability management, web security and AI security.

**Source:** User-provided graphic “20 Cybersecurity Websites to Know,” credited to **Excellog.Biz**. The original site order is preserved in the first column. The CISA URL is directed to its relevant Known Exploited Vulnerabilities (KEV) catalog.

**20 sites across 5 topics.** Three sites—MITRE ATT&CK, Wireshark and Zeek—were already referenced in the [Blue Team/SOC learning plan](../security/blue-team-learning-plan.md), and are included here for a complete single-page directory. The remaining 17 were not found in the learning-resource files checked.

[Main learning-resource library](cloud-learning-games.md) · [Windows troubleshooting commands](windows-troubleshooting-200-commands.md) · [Project-Lab home](../../README.md)

## Quick navigation

- [Vulnerability intelligence and prioritization](#vulnerability-intelligence-and-prioritization)
- [Attack, defense and security frameworks](#attack-defense-and-security-frameworks)
- [Hands-on cybersecurity learning](#hands-on-cybersecurity-learning)
- [Network investigation and detection](#network-investigation-and-detection)
- [Threat intelligence and external exposure](#threat-intelligence-and-external-exposure)


## Vulnerability intelligence and prioritization

| Source # | Website | Why use it |
|---:|---|---|
| 1 | [CISA Known Exploited Vulnerabilities](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) | Track actively exploited vulnerabilities and prioritize remediation |
| 2 | [NIST National Vulnerability Database](https://nvd.nist.gov) | Inspect CVE records, CVSS details and risk information |
| 3 | [FIRST EPSS](https://www.first.org/epss/) | Estimate near-term vulnerability exploitation probability |
| 7 | [MITRE CWE](https://cwe.mitre.org) | Study common software and hardware weaknesses |

## Attack, defense and security frameworks

| Source # | Website | Why use it |
|---:|---|---|
| 4 | [MITRE ATT&CK](https://attack.mitre.org) | Map adversary tactics and techniques to detections |
| 5 | [MITRE D3FEND](https://d3fend.mitre.org) | Explore defensive countermeasures |
| 6 | [MITRE ATLAS](https://atlas.mitre.org) | Study adversarial techniques affecting AI systems |
| 8 | [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework) | Organize security risk and governance work |
| 9 | [OWASP ASVS](https://asvs.owasp.org) | Review application security verification requirements |
| 10 | [OWASP GenAI Security](https://genai.owasp.org) | Explore LLM, generative AI and agent security risks |

## Hands-on cybersecurity learning

| Source # | Website | Why use it |
|---:|---|---|
| 11 | [PortSwigger Web Security Academy](https://portswigger.net/web-security) | Practice web security in authorized training labs |
| 12 | [CyLab Security Academy](https://cylabacademy.org) | Learn with free Carnegie Mellon University CyLab CTF challenges |

## Network investigation and detection

| Source # | Website | Why use it |
|---:|---|---|
| 13 | [CyberChef](https://gchq.github.io/CyberChef/) | Decode, transform and inspect security data |
| 14 | [Wireshark](https://www.wireshark.org) | Analyze network packet captures |
| 15 | [Zeek](https://zeek.org) | Generate and inspect network security telemetry |
| 16 | [Sigma](https://sigmahq.io) | Find shareable rules and examples of detection logic |

## Threat intelligence and external exposure

| Source # | Website | Why use it |
|---:|---|---|
| 17 | [abuse.ch](https://abuse.ch) | Investigate malware and threat intelligence projects |
| 18 | [urlscan.io](https://urlscan.io) | Examine website requests, resources and redirects |
| 19 | [Shodan](https://www.shodan.io) | Research internet-exposed services without unauthorized probing |
| 20 | [Qualys SSL Labs SSL Server Test](https://www.ssllabs.com/ssltest/) | Examine HTTPS and TLS server configuration |

## Suggested learning and reference route

1. **Vulnerability management:** Cross-reference CISA KEV, NVD and FIRST EPSS to make evidence-driven remediation recommendations. EPSS measures exploitation likelihood, not severity or business impact.
2. **SOC and detection engineering:** Map a controlled test scenario to MITRE ATT&CK, review applicable Sigma rules and examine approved Wireshark/Zeek telemetry.
3. **GRC / risk:** Use NIST CSF as a structure for a mock gap assessment and MITRE D3FEND to investigate defensive approaches.
4. **Application and AI security:** Study OWASP ASVS, OWASP GenAI and MITRE ATLAS; use PortSwigger and CyLab Security Academy's designated practice environments.
5. **Portfolio:** Document your scope, objective, testing evidence, observations, limitations and remediation in your own lab write-ups.

## Responsible use

- Inspect or test only systems you own or have explicit permission to assess. Do not probe third-party services simply because Shodan indexes them.
- **urlscan.io and SSL Labs:** review visibility and privacy settings before submitting URLs or hostnames; never submit confidential company/internal endpoints without authorization.
- Don't upload passwords, tokens, private logs or personal/customer data to public analysis services.
- Linked services may have changing feature sets, access requirements and usage terms. These are references, not completed lab evidence.

**Infographic attribution:** Excellog.Biz. **Collected:** November 20, 2026.
