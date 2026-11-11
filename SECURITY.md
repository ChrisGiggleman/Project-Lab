# Security & Data Handling

This is a **training-lab repository**. It must not contain production secrets or data.

## Never publish

- Passwords, DSRM secrets, recovery keys, API tokens, credentials, private keys or authentication cookies.
- Screenshots showing private emails, browser tabs, personal accounts, real customer/employee names, license keys or unrelated desktop content.
- Raw configuration backups from live infrastructure, exported directory databases, or credential-bearing container configuration.
- Full authentication logs or other exports containing personally identifying data.

## Before committing

1. Use fictional test users and sanitized hostnames/addresses where possible.
2. Review every screenshot carefully; crop to the relevant tool and blur accidental details.
3. Review PowerShell output, logs, `.env` files and Compose files for embedded secrets.
4. Keep actual credentials in a password manager, never in repository content.
5. Treat this GitHub portfolio as public; do not expose live administrative interfaces to the internet for demonstrations.

## Isolation

Windows IAM VMs run on an isolated VMware host-only network. The Docker host is a separate system. Any later connection between environments must be explicitly designed and documented, not enabled accidentally.

## Responsible lab practices

Use Microsoft evaluation software under its applicable terms. Create snapshots/checkpoints before major configuration changes, but do not treat them as backups. Avoid giving ordinary employees Domain Admin rights or storing department file shares on the domain controller.