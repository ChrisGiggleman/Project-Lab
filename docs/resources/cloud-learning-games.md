# Learn Cloud by Playing Games — Resource Library

> A practical bookmark collection for cloud, networking, IAM, containers, infrastructure as code, and security labs.

**Source:** *Learn Cloud by Playing Games — Core Edition*, by **Sathish Kumar Subramani** (links transcribed from the user-provided resource graphic). This page is a curated index, not a claim that all resources have been completed, personally tested, or recently verified.

**Resources:** 43 links in total — 30 cloud learning games and labs across 8 categories, plus 13 cybersecurity portfolio project ideas across 4 groups.

## Quick navigation

- [Cloud fundamentals](#cloud-fundamentals)
- [Networking](#networking)
- [Identity & access management (IAM)](#identity-access-management-iam)
- [Compute & containers](#compute-containers)
- [Infrastructure as code (IaC)](#infrastructure-as-code-iac)
- [Cloud security & pentesting](#cloud-security-pentesting)
- [Multi-cloud](#multi-cloud)
- [Capstone project](#capstone-project)
- [Cybersecurity portfolio project ideas (13-project collection)](#cybersecurity-portfolio-project-ideas--13-project-collection)

## Suggested starting route (IAM / cybersecurity focus)

1. **Core cloud context:** [AWS Cloud Quest](https://aws.amazon.com/training/digital/aws-cloud-quest) and [Microsoft Learn Challenges](https://learn.microsoft.com/challenges).
2. **Identity:** [Big IAM Challenge](https://bigiamchallenge.com), then [IAM Vulnerable](https://github.com/BishopFox/iam-vulnerable) in an authorized lab.
3. **Security scenarios:** [Flaws.cloud](https://flaws.cloud) and [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) in isolated, cost-controlled lab accounts.
4. **Operations / IaC:** [SadServers](https://sadservers.com) and [Terraform Challenges](https://kodekloud.com/courses/terraform-challenges).
5. **Portfolio capstone:** [Cloud Resume Challenge](https://cloudresumechallenge.dev), with notes and screenshots stored in this repository.

## Cloud fundamentals

| Resource | Focus |
|---|---|
| [Cloud Roles (3D RPG) — AWS Cloud Quest](https://aws.amazon.com/training/digital/aws-cloud-quest) | Game-based AWS role and service fundamentals |
| [Architecture Card Game — AWS Card Clash](https://aws.amazon.com/training/digital/aws-card-clash) | AWS architecture and service selection |
| [Exam Escape Room — AWS Immersive Learning](https://aws.amazon.com/training/digital/immersive-learning) | Interactive AWS learning experiences |
| [Troubleshooting Jams — AWS Jam](https://aws.amazon.com/training/digital/aws-jam) | Scenario-based AWS troubleshooting |
| [Cloud Troubleshooting — SadServers](https://sadservers.com) | Hands-on Linux and operations troubleshooting |

## Networking

| Resource | Focus |
|---|---|
| [DNS — Mess With DNS](https://messwithdns.net) | Experiment with DNS concepts |
| [VPC, CIDR & Subnetting — Boot.dev](https://www.boot.dev) | Foundational networking and subnetting practice |

## Identity & access management (IAM)

| Resource | Focus |
|---|---|
| [IAM Policies (CTF) — Big IAM Challenge](https://bigiamchallenge.com) | Explore AWS IAM policy behavior |
| [IAM Privilege Escalation — IAM Vulnerable](https://github.com/BishopFox/iam-vulnerable) | Practice recognizing AWS IAM escalation paths in a lab |
| [S3, EC2 & IAM Mistakes — Flaws.cloud](https://flaws.cloud) | Explore intentionally vulnerable AWS scenarios |
| [S3, EC2 & IAM Mistakes — Flaws2.cloud](https://flaws2.cloud) | Additional cloud security scenarios |

## Compute & containers

| Resource | Focus |
|---|---|
| [Amazon EKS — EKS Cluster Games](https://eksclustergames.com) | Explore Amazon EKS security and behavior |
| [Kubernetes Networking — K8s LAN Party](https://k8slanparty.com) | Kubernetes networking challenges |
| [Kubernetes Security Lab — Kubernetes Goat](https://madhuakula.com/kubernetes-goat) | Kubernetes security scenarios |
| [Kubernetes Chaos (Invaders) — KubeInvaders](https://github.com/lucky-sideburn/kubeinvaders) | Interactive Kubernetes chaos and resilience exercises |

## Infrastructure as code (IaC)

| Resource | Focus |
|---|---|
| [Terraform Challenges — KodeKloud](https://kodekloud.com/courses/terraform-challenges) | Terraform practice tasks |
| [Terraform CTF — Provider Challenge](https://github.com/OMGhozlan/terraform-provider-ctfchallenge) | Terraform-oriented CTF exercises |
| [Fix Insecure Terraform — TerraGoat](https://github.com/bridgecrewio/terragoat) | Find and remediate IaC misconfigurations |
| [Team GameDay — HashiCorp AWS GameDay](https://www.hashicorp.com/blog/the-aws-gameday-challenge-with-terraform) | Terraform GameDay scenario and article |

## Cloud security & pentesting

| Resource | Focus |
|---|---|
| [AWS Attack Scenarios — CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) | Intentionally vulnerable AWS attack-path labs |
| [AWS Attack Paths (CTF) — CloudFoxable](https://github.com/BishopFox/cloudfoxable) | AWS attack-path training environment |
| [Cloud CTFs & Incident Response — Wiz](https://www.wiz.io/ctf) | Cloud-oriented security challenges |
| [AWS, Azure & GCP Labs — Pwned Labs](https://www.pwnedlabs.io) | Hands-on cloud security scenarios |
| [Vulnerable AWS — AWSGoat](https://github.com/ine-labs/AWSGoat) | Intentionally vulnerable AWS learning environment |

## Multi-cloud

| Resource | Focus |
|---|---|
| [Google Cloud Arcade — Google Skills](https://www.skills.google) | Google Cloud learning challenges |
| [Microsoft Azure — Microsoft Learn Challenges](https://learn.microsoft.com/challenges) | Microsoft learning challenges |
| [Vulnerable Azure — AzureGoat](https://github.com/ine-labs/AzureGoat) | Intentionally vulnerable Azure training lab |
| [Vulnerable GCP — GCPGoat](https://github.com/ine-labs/GCPGoat) | Intentionally vulnerable Google Cloud training lab |
| [AWS + Azure Real Tasks — KodeKloud Engineer](https://engineer.kodekloud.com) | Practical infrastructure and cloud tasks |

## Capstone project

| Resource | Focus |
|---|---|
| [Build It End-to-End — Cloud Resume Challenge](https://cloudresumechallenge.dev) | Create and document a complete cloud portfolio project |

## Using these resources safely

- Only run attack, CTF, exploit, or chaos exercises in **your own authorized lab**, an official training environment, or infrastructure where you have explicit permission.
- Review each lab's setup and teardown instructions, especially for cloud bills, cleanup, permissions, and exposure to public networks.
- Keep credentials, API keys, real account IDs, access tokens, and private data out of this public repository.
- For each completed exercise, capture the goal, environment, steps performed, evidence, findings, remediation, and lessons learned. Link your completed lab report rather than labeling an unattempted resource as finished.
- Links may change over time; confirm current availability and terms on the providers' sites.

## Cybersecurity portfolio project ideas — 13-project collection

These **13 proposed portfolio exercises** come from the second resource collection shared in the ChatGPT Task Compatibility discussion. They are **project ideas**, not completed lab results. For goals, sequencing, statuses and safety notes, see the [Security Portfolio Project Backlog](../../SECURITY-PORTFOLIO-BACKLOG.md).

> **Link note:** The original LinkedIn short links are preserved exactly as supplied. Their final destinations and current availability have not been individually verified. Review each project's source and license before running code.

### Detection & response

| Project idea | What to practice | Original resource |
|---|---|---|
| SOC Detection & Response Platform | Detection rules, triage, MITRE ATT&CK | [Open reference](https://lnkd.in/gUvmmQGz) |
| SIEM Log Analysis Platform | Correlate security logs and investigate events | [Open reference](https://lnkd.in/gA_mdGPH) |
| Ransomware Detection System | Benign behavioral simulations and detections | [Open reference](https://lnkd.in/g5qbAzu5) |
| Threat Hunting Platform | Evidence-driven endpoint hunting | [Open reference](https://lnkd.in/gteTx29q) |

### Threat intelligence & investigation

| Project idea | What to practice | Original resource |
|---|---|---|
| Threat Intelligence Platform | Indicators, enrichment, confidence and freshness | [Open reference](https://lnkd.in/gFEDsrT2) |
| Malware Analysis Sandbox | Isolated sample observation and analysis reporting | [Open reference](https://lnkd.in/gtVyCHNs) |
| DFIR Toolkit | Artifact collection, timeline and chain of custody | [Open reference](https://lnkd.in/gYRzCc-N) |

### Security engineering

| Project idea | What to practice | Original resource |
|---|---|---|
| Cloud Security Monitoring Dashboard | Configuration and identity monitoring | [Open reference](https://lnkd.in/gSpuiBt4) |
| Active Directory Lab | Extend the existing Windows IAM lab | [Open reference](https://lnkd.in/gUD2prMf) |
| Kubernetes Security Scanner | Kubernetes configuration and RBAC checks | [Open reference](https://lnkd.in/gbTKWg5R) |
| Automated Vulnerability Scanner | Authorized scanning, risk ranking and remediation | [Open reference](https://lnkd.in/gNd6bxud) |
| Web Application Testing Toolkit | Scoped testing and findings documentation | [Open reference](https://lnkd.in/gn5HU_T3) |

### AI & security

| Project idea | What to practice | Original resource |
|---|---|---|
| AI-Powered Phishing Detector | Evaluate email classification, errors and limitations | [Open reference](https://lnkd.in/ghgUGYH2) |

### Practical project order

**Current:** Finish the existing [Active Directory / IAM file-server lab](../iam/05-file-server-rbac-plan.md). **Next candidates:** SIEM Log Analysis → SOC Detection & Response → Vulnerability Assessment, each as a separate authorized and documented project. See the [full backlog](../../SECURITY-PORTFOLIO-BACKLOG.md) for all 13 candidate projects.

