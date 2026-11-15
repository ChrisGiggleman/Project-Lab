# Scripting & Automation — Practical Learning Plan

**Status:** Planned curriculum, integrated into the active homelab; not completed training. PowerShell first, then Python, Bash, and security query languages. Work at a mastery-based pace; the 12 weeks below are a suggested sequence, not a deadline.

## Learning method

For each topic: explain the concept → guided example → independent challenge → code review and debugging → lab verification → sanitized GitHub documentation. The learner writes or modifies the code and explains each line before accepting it. Prefer VS Code and Git. Start with read-only commands; use test accounts, explicit scope, dry-run/WhatIf where supported, backups, approval, rollback and re-verification before any write operation. Never run lab scripts on employer infrastructure.

| Weeks | Focus | Evidence to produce |
|---|---|---|
| 1–2 | PowerShell cmdlets, help, variables, objects, pipelines, filters, operators, conditions, loops | Enabled AD user report, group membership inventory, service health report |
| 3–4 | AD scripting, CSV imports/exports, parameters, account lifecycle, permissions | Inactive/disabled/locked account report, test CSV provisioning, JML workflow, SMB/NTFS audit |
| 5–6 | Functions, validation, error handling, logging, idempotency, REST/JSON, testing | Reusable scoped scripts, privileged membership audit, Microsoft Graph read-only exercise where tenant permits |
| 7–8 | Python fundamentals: lists, dictionaries, functions, files, CSV/JSON, exceptions, virtual environments | Independent log parser and report generator |
| 9–10 | Python security automation and APIs | Failed-login aggregation, IOC extraction/enrichment using permitted data, incident/vulnerability reporting |
| 11 | Bash, Linux service/log/disk checks, Docker monitoring | Shell health check and safe backup exercise |
| 12+ | SQL, Splunk SPL, Microsoft KQL; later YAML, GitHub Actions and Terraform/HCL | Reproduce an investigation in available query tools; validate config and IaC in a sandbox |

## First independent exercise

On IAM-DC01, use the AD module to query only enabled users within the fictional lab OU, select appropriate properties, and export a CSV to a safe local path. Explain the filter, pipeline, properties and output. Compare the result to the known test users. No AD updates. Keep private identifiers and credentials out of GitHub. Existing read-only checks are in [scripts/iam](../../scripts/iam/README.md).

## Projects to build progressively

- Identity: group membership and privileged-account auditing; bulk onboarding; mover role transitions; offboarding and access revocation; service account inventories; access-review reports; Graph/API pagination and least-privileged access.
- SOC: Windows event extraction, failed-login aggregation, timestamp normalization, JSON/CSV handling, SIEM API reporting, detection validation and incident timelines.
- Infrastructure: Linux service and disk checks, Docker health checks, backups, Git/CI validation, vulnerability report parsing.

## References

- [PowerShell documentation](https://learn.microsoft.com/powershell/)
- [Microsoft Learn training](https://learn.microsoft.com/training/)
- [Python tutorial](https://docs.python.org/3/tutorial/)
- [GNU Bash manual](https://www.gnu.org/software/bash/manual/)
- [Microsoft Graph documentation](https://learn.microsoft.com/graph/)
- [Kusto Query Language](https://learn.microsoft.com/kusto/query/)
- [Splunk documentation](https://docs.splunk.com/)
- [Pester testing](https://pester.dev/)

References are starting points; course availability and licensing have not been individually checked.
