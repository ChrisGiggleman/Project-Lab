# IAM Engineering — Career & Lab Learning Plan

**Primary track:** Workforce IAM (Active Directory, Microsoft Entra ID, application SSO), with governance, privileged access and cloud IAM as later extensions. **Status:** Planned curriculum; see the [master roadmap](../../ROADMAP.md) for verified implementation status.

## Source and interpretation

The shared "How to Break Into IAM Engineering in 2026" roadmap by Sunnykumar Kamani suggests choosing a sub-discipline, learning foundations, building mock SSO/SCIM and Terraform labs, selecting a relevant certification, and targeting entry IAM roles. The separate "IAM Engineer Tip" infographic highlights AD users/groups, permissions, GPOs, PowerShell, authentication troubleshooting, Entra identities, service accounts, MFA/SSO, access auditing and application integrations. The sequence below adapts both graphics to the existing lab; career/salary claims in the graphics are not treated as verified market facts.

## Learning sequence

| Stage | Skills | Lab outcome |
|---|---|---|
| 1 | Windows AD, DNS, LDAP, OUs, AGDLP, RBAC, GPOs, service accounts, Kerberos and authentication troubleshooting | Close remaining workstation/Kerberos checks; validate policy and authorization with standard users |
| 2 | PowerShell, JML (Joiner/Mover/Leaver), least privilege, access auditing | Read-only reports first; controlled onboarding/offboarding, group changes, service-account inventory with validation and rollback |
| 3 | Entra ID, hybrid identity, MFA, Conditional Access, PIM, access reviews | Eligible test tenant, account lifecycle, sign-in investigation, policy tests and access review where licensed; continue SC-300 study |
| 4 | Federation and app integration: SAML 2.0, OAuth 2.0 (and OAuth 2.1 concepts), OIDC, JWT, certificates/PKI, WebAuthn | Isolated Keycloak plus two mock apps, SSO, inspect synthetic tokens and diagnose failures; Okta optional if suitable tenant available |
| 5 | SCIM, REST APIs, Microsoft Graph, provisioning, application identities | Mock SCIM integration, provisioning/deprovisioning, access-request approval workflow and API error handling |
| 6 | IGA and PAM: entitlement models, access certifications, segregation of duties, privileged access, workload/service identities | Simulated access certification and privilege audit; explore SailPoint/Saviynt and CyberArk/BeyondTrust if legitimate training access exists |
| 7 | Cloud IAM/CIEM, AWS roles/policies, Terraform, secrets management | Cost-controlled sandbox policy deployment and least-privilege test; teardown and document findings |

Concept distinctions to master: authentication vs authorization vs federation vs provisioning; LDAP and AD schemas; SAML vs OAuth vs OIDC; SCIM vs SSO; JWT claims/signature validation; JML events; user vs workload identities; certificates and passwordless authentication.

## Portfolio projects

- AD account and permission auditing, GPO configuration, service-account inventory, automated joiner/mover/leaver lifecycle.
- Hybrid identity, MFA and Conditional Access, identity troubleshooting, access reviews.
- SSO between two mock applications, token troubleshooting, passwordless authentication, SCIM provisioning and self-service access request mockup.
- Identity threat detection via the [Blue Team plan](../security/blue-team-learning-plan.md), privileged access auditing, role/policy deployment with Terraform.

## Learning references

- [Microsoft Entra documentation](https://learn.microsoft.com/entra/)
- [SC-300 certification](https://learn.microsoft.com/credentials/certifications/identity-and-access-administrator/)
- [Keycloak](https://www.keycloak.org/documentation)
- [Okta developer documentation](https://developer.okta.com/docs/)
- [OpenID Connect](https://openid.net/developers/)
- [SCIM protocol RFC 7644](https://www.rfc-editor.org/rfc/rfc7644)
- [SAML specifications](https://www.oasis-open.org/standards/)
- [WebAuthn](https://www.w3.org/TR/webauthn/)
- [Microsoft Graph](https://learn.microsoft.com/graph/)
- [AWS IAM documentation](https://docs.aws.amazon.com/iam/)
- [Terraform documentation](https://developer.hashicorp.com/terraform/docs)
- [SailPoint](https://developer.sailpoint.com/), [Saviynt](https://saviynt.com/), [CyberArk](https://www.cyberark.com/), [BeyondTrust](https://www.beyondtrust.com/)

Commercial trial access and licenses are not assumed. Use an isolated fictional directory, avoid syncing real identities or enabling policies that lock out administrators, use scoped permissions and separate test accounts, and document rollback and cloud costs. Continue pursuing IAM Analyst/Administrator and junior IAM Engineer roles while developing independent practical evidence; no new certification commitment is required beyond the existing SC-300 preparation.
