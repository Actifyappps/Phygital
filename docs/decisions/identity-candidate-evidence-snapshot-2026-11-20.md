# TC-04 identity and authentication — initial provider evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Currency:** USD, public list prices as displayed on source pages on the evidence date. Annual-billing discounts, taxes, SMS delivery, enterprise terms and usage assumptions are not normalized.

## 1. Purpose and authority boundary

This is the first provider-specific evidence record under WP-03 for TC-04 (identity/authentication/session). It compares four candidate approaches:
1. Supabase Auth, integrated with Supabase PostgreSQL and RLS.
2. Clerk, managed application identity with built-in B2B organization features.
3. Auth0, managed customer identity and access management.
4. Keycloak, self-hosted open-source identity and access management.

The identity provider authenticates a principal and manages credentials/sessions. It does **not** become the authoritative source of Phygital organisation membership, legal mandates, seller/exporter capacity, hub authority, reviewer appointment, transaction permissions or programme-stage eligibility. Those remain in Phygital's own governed domain and authorisation model.

No provider is scored, shortlisted, selected or approved. Provider pricing and public feature claims are not proof of legal suitability or complete fit.

## 2. Governing requirements

Candidates must be assessed against TC-04, TDR-01, TDR-02, TDR-03, TDR-08, TDR-09, TDR-16 and source requirements from 024-A, 024-F and 024-G:
- human and machine identity boundaries;
- secure sign-in/out, recovery, session expiry and revocation;
- MFA/step-up for privileged and sensitive operations;
- invitation, activation, contact verification and account recovery;
- organisation membership kept distinct from authentication;
- support for multiple memberships without trusting a client-selected organisation;
- account disablement, compromise response and timely revocation;
- least-privilege service credentials and rotation;
- auditable authentication/admin events without secret leakage;
- portable identity-subject mapping and credible provider exit;
- accessibility, low-bandwidth and shared-device-aware operation.

## 3. Public-source evidence snapshot

### 3.1 Supabase Auth

**Product shape**
- Supabase Auth supports password, magic link, OTP, social sign-in and SSO. It issues JWTs and integrates with Supabase PostgreSQL/RLS.
- User records are stored in the project's Auth schema and can be related to application tables.
- Auth can be used standalone, but its most direct fit is within the Supabase ecosystem.

**Public price/allowances observed**
- Supabase Free includes 50,000 MAU, basic MFA and 50,000 third-party MAU; it is not a production-equivalent comparison because it lacks several session and security controls and projects pause after one week of inactivity.
- Pro starts at **$25/month** and includes 100,000 MAU, then $0.00325 per additional MAU.
- Pro includes single-session-per-user and session-timeout controls; SAML SSO includes 50 SSO MAU before published per-MAU charges.
- Advanced phone MFA is a separate add-on shown at **$75/month for the first project and $10/month per additional project**.
- Audit-log retention and additional Auth features vary by plan.

**Session/security caveats**
- Supabase documentation states sessions last indefinitely by default unless configured otherwise; access tokens are short-lived (usually 5 minutes to 1 hour) and refresh tokens are single-use/rotated.
- Time-boxed sessions, inactivity timeouts and single-session-per-user controls are available on Pro and above.
- Changes to session-lifetime settings are not retroactively applied to already-created sessions; enforcement occurs on refresh. Revocation design must account for token lifetime, refresh behaviour and application-side authorization checks.
- Supabase JWTs can carry claims for RLS, but application authorization must not trust user-editable metadata or a broad service-role credential.

**Initial assessment observations**
- Strength: integrated Auth + Postgres + RLS can reduce service count and make database policy integration direct.
- Risk/unknown: Auth schema/platform coupling, session revocation semantics, MFA/SSO add-on pricing, token claim governance, and how to migrate user identities away from the platform.
- Data location/processor terms must be assessed with the Supabase database snapshot. A project region does not mean every support, account, telemetry or subprocessor activity stays in-region.
- Required test: revoke membership and credentials, then prove all application routes, APIs, jobs and RLS paths deny access without waiting for an unsafe stale session window.

Official sources:
- [Supabase Auth overview](https://supabase.com/docs/guides/auth)
- [Supabase sessions](https://supabase.com/docs/guides/auth/sessions)
- [Supabase JWT guide](https://supabase.com/docs/guides/auth/jwts)
- [Supabase pricing](https://supabase.com/pricing)
- [Supabase available regions](https://supabase.com/docs/guides/platform/regions)
- [Supabase data residency and transfers FAQ](https://supabase.com/legal/privacy-resources/data-residency-and-transfers-faq)

### 3.2 Clerk

**Product shape**
- Clerk provides managed sign-up/sign-in UI, session management, MFA, machine authentication and B2B organization features.
- Its B2B Authentication includes basic organizations, invitations and Admin/Member roles; enhanced B2B adds unlimited organization members, enterprise connections, verified domains, custom roles and role sets.
- Clerk's own organization roles are not a replacement for Phygital's legal mandates and operational permissions.

**Public price/allowances observed**
- Hobby is free and includes up to 50,000 monthly retained users (MRU) per application, but MFA is not included in the Hobby production plan.
- Pro is displayed at **$20/month billed annually** and includes 50,000 MRU per app, MFA, one SSO connection, custom session lifetime and one Directory Sync connection (the page states Directory Sync billing begins 1 January 2027).
- Basic B2B Authentication is included: 100 monthly retained organisations per app, up to 20 members per organisation, Admin/Member roles, custom permissions and invitations.
- Enhanced B2B is listed at **$100/month or $85/month billed annually**, adding unlimited members, enterprise connections, verified domains, custom roles and role sets.
- Clerk counts MRU, not conventional MAU; comparisons with other vendors must normalize the metric and use case.

**Data location/security caveats**
- Clerk's official security page states that regional data residency is not offered; data is hosted on US infrastructure and its subprocessors are in the USA.
- Clerk states SOC 2 Type II certification; SOC 2 report access is plan-gated to Business and above. HIPAA BAA is Enterprise-only. Clerk itself is not ISO 27001 certified (its infrastructure providers hold relevant certifications).
- Clerk offers a public DPA and subprocessor information.
- Session lifetime controls, device revocation and server-side session revocation are documented. Changing session settings affects new sessions; existing sessions require explicit revocation.

**Initial assessment observations**
- Strength: polished user experience, organization membership, invitation and MFA features could reduce identity UI and lifecycle implementation.
- Risk/unknown: US-only residency, MRU pricing metric, B2B feature/organization limits, and custom role capabilities need careful fit review. Phygital's Kenyan and cross-border data processing requirements may make the residency position material.
- Required test: prove organization switching never becomes the source of authority; validate device/session revocation, custom role boundaries, data export and migration of user IDs/linked identities.

Official sources:
- [Clerk pricing](https://clerk.com/pricing)
- [Clerk security and compliance](https://clerk.com/security)
- [Clerk session options](https://clerk.com/docs/guides/secure/session-options)
- [Clerk session tasks](https://clerk.com/docs/guides/configure/session-tasks)
- [Clerk DPA](https://clerk.com/legal/dpa)
- [Clerk subprocessor list](https://clerk.com/legal/subprocessors)

### 3.3 Auth0

**Product shape**
- Auth0 is a managed customer identity platform supporting B2C and B2B deployment models, enterprise connections, organizations, MFA, custom flows/actions and session management.
- Auth0's organization RBAC can assign roles within a particular organization context; application code must still resolve Phygital membership, mandates and permissions.
- Auth0 offers public cloud and private cloud deployment models. Private Cloud is positioned for dedicated deployment and data-residency/performance requirements.

**Public price/allowances observed**
- Current pricing page is interactive and separates B2C and B2B use cases. Exact price depends on use case, MAU tier, features and billing period.
- Public B2C page displays Free up to 25,000 MAU; Essentials at **$35/month for up to 500 MAU** with Pro MFA, RBAC per organization and 10 organizations; Professional at **$240/month for up to 500 MAU** with additional security and user-database capabilities.
- These B2C figures must not be treated as a Phygital B2B quote. B2B pricing and enterprise/private-cloud pricing require an exact configuration or sales quote.
- Auth0 documents export of user data through the User Import/Export extension and Management API.

**Data location/security caveats**
- Auth0 public cloud regions are available in multiple geographies; Auth0 Private Cloud offers dedicated deployments across a broader set of cloud regions for data residency and performance needs. Exact regional availability, deployment type and contracting terms must be confirmed for the selected SKU.
- Auth0 documentation/changelog describes session and refresh-token management APIs, but availability of particular revocation endpoints/features can be plan-dependent. Confirm the exact entitlement for the proposed tenant.
- Enterprise and private-cloud security features may materially change cost and implementation requirements.

**Initial assessment observations**
- Strength: mature managed identity capabilities, B2B organization concepts, extensible flows and private deployment options.
- Risk/unknown: potentially high or opaque B2B/private-cloud cost, plan-specific session-management capabilities, and exact regional/deployment availability.
- Required test: validate organization RBAC and claim mapping, session/refresh-token revocation entitlement, user export/import and tenant migration, and the precise data-processing region and DPA.

Official sources:
- [Auth0 pricing](https://auth0.com/pricing)
- [Auth0 organization RBAC](https://support.auth0.com/center/s/article/How-to-enable-RBAC-for-use-roles-in-organizations)
- [Auth0 changelog — session and refresh-token management](https://auth0.com/changelog)
- [Auth0 private cloud on Azure](https://auth0.com/platform/cloud-deployment/azure)
- [Auth0 deployment models and pricing FAQ](https://auth0.com/pricing)

### 3.4 Keycloak

**Product shape**
- Keycloak is an open-source identity and access management system supporting OpenID Connect, OAuth 2.0 and SAML, identity brokering/federation, MFA, WebAuthn and passkeys.
- The source repository is licensed Apache-2.0.
- It can be self-hosted in an approved region/environment, but this transfers availability, patching, monitoring, database, TLS, backup, recovery, abuse protection and incident-response responsibility to the operating team.

**Public price/allowances observed**
- The Keycloak software is open source under Apache-2.0; there is no per-MAU vendor SaaS price for the self-hosted software itself.
- This is not zero-cost operation. Compute, production PostgreSQL, load balancer/reverse proxy, backups, monitoring, security patching, upgrades, incident response and staff time must be included in TCO.
- Commercial support/managed-service options, if considered, must be separately evaluated and are not priced in this record.

**Production and security caveats**
- Keycloak's production guide requires secure TLS communication and a production-grade database; a reverse proxy/load balancer is typical in distributed environments.
- Keycloak's HA guidance states that high availability depends on database, network, load balancer, compute and failover procedures outside Keycloak itself. A typical production environment uses two or more Keycloak instances.
- Keycloak supports OTP/WebAuthn/passkeys, but exact features and maturity must be pinned to a supported release. Some documentation labels passkeys features preview/feature-flagged in particular versions; version-specific status must be checked rather than assumed.
- Self-hosting offers more direct control over data location but does not itself establish compliance or secure operation.

**Initial assessment observations**
- Strength: Apache-2.0, standards-based identity, deployment/data-location control and reduced SaaS MAU lock-in.
- Risk/unknown: materially higher operational burden; production-grade HA, patching, key management, session revocation, backups and recovery need named owners and demonstrated runbooks.
- Required test: production configuration, TLS/reverse proxy, PostgreSQL persistence, HA/failover, MFA recovery, session revocation, upgrade/rollback and independent export/import.

Official sources:
- [Keycloak GitHub repository and Apache-2.0 licence](https://github.com/keycloak/keycloak)
- [Keycloak production configuration](https://www.keycloak.org/server/configuration-production)
- [Keycloak high availability overview](https://www.keycloak.org/high-availability/introduction)
- [Keycloak server administration guide](https://www.keycloak.org/docs/latest/server_admin/)
- [Keycloak container deployment](https://www.keycloak.org/server/containers)

## 4. Initial comparison — facts, not scores

| Dimension | Supabase Auth | Clerk | Auth0 | Keycloak |
|---|---|---|---|---|
| Operating model | Managed; integrated with Supabase Postgres/RLS | Managed identity SaaS | Managed identity SaaS; public/private deployment options | Self-hosted open source |
| Price reference | Pro $25/mo; 100k MAU; MFA/SSO add-ons and feature limits | Pro $20/mo annual; 50k MRU; B2B enhanced add-on $100/mo/$85 annual | Public B2C price example $35/mo Essentials for 500 MAU; B2B/private quote needed | Apache-2.0 software; hosting/operator cost unknown |
| MFA | Basic included; advanced phone MFA add-on | Pro includes MFA; Hobby excludes production MFA | Pro MFA in Essentials; stronger enterprise options | OTP/WebAuthn/passkeys; configure and operate |
| Organisation support | Application-managed relationships with RLS integration | Built-in B2B org/member roles; enhanced custom roles | Built-in Organizations and per-org RBAC | Groups/roles/identity federation; application mapping required |
| Session controls | Pro timeouts/single-session; default indefinite until configured | Session lifetime, revocation and device controls | Session APIs/actions; some controls plan-dependent | Server-managed sessions; operator config |
| Data residency signal | Project region; some account/support/telemetry processing out of region | US-hosted; no regional residency option | Public cloud regions; private cloud for broader residency | Deploy where operated |
| Main trade-off | Tight integration vs platform coupling | Fast B2B UX vs US-only residency and MRU limits | Feature depth vs cost/plan complexity | Control/licence vs operations burden |

**No weighted score is calculated.** The vendor metrics (MAU, MRU, organizations, connections, users) are not directly comparable. Price references are not a TCO model and do not include the rest of the application architecture.

## 5. Mandatory Phygital identity architecture rule

Regardless of provider selected:
- The provider's subject ID is an external identity reference, not the primary business authority record.
- Phygital maintains its own immutable mapping from provider/issuer/subject to internal user identity.
- Organisation memberships are application-owned, effective-dated, revocable and independently auditable.
- Seller, exporter, hub, reviewer, platform-operator and provider capacities require separate source evidence and mandates; identity-provider roles cannot create these capacities.
- Every privileged action checks current application membership, mandate, resource scope, workflow state and separation-of-duties requirements on the server.
- Session revocation and account disablement must propagate to API, web, file, worker and cached-token access paths.
- Service identities are distinct from human users, purpose-bound, narrowly scoped and rotated.
- Support impersonation must be disabled by default or tightly controlled with reason, time limit, user visibility, audit and independent review.

## 6. Evidence gaps before scoring

### 6.1 Legal, privacy and residency
- Obtain current DPA, subprocessor list, data region and transfer terms for each paid plan/SKU.
- Confirm contracting entity, support access, breach notification, retention/deletion, export and termination terms.
- Assess Kenyan Data Protection Act and destination-market transfer requirements with qualified counsel; vendor certification is not legal approval.
- For Clerk, explicitly decide whether US-only residency is acceptable before further consideration.
- For Supabase, reconcile identity processing with the database candidate evidence and marketplace-specific processor statement.
- For Auth0, confirm the exact public/private cloud region, SKU and contract for the intended B2B use.
- For Keycloak, identify hosting/operator responsibilities and data-controller/processor roles.

### 6.2 Technical and lifecycle
- Test OIDC authorization code + PKCE, refresh rotation, token audience/issuer validation, JWKS rotation and key rollover.
- Test immediate disablement/revocation, concurrent sessions, stolen refresh tokens, device loss and account recovery.
- Test MFA enrolment, recovery codes, factor reset, step-up for privileged actions and accessibility on low-end/mobile devices.
- Test multiple organisation memberships, organisation switching, invitation abuse and stale membership claims.
- Confirm identity export/import, stable external subject mapping and account-linking/duplicate-account resolution.
- Confirm machine identities, token scopes, secret rotation and audit logs.
- Pin exact provider/API/SDK versions and lifecycle support.

### 6.3 Commercial/TCO
- Validate likely active users, retained users, organizations, member counts, SSO connections, SMS volume, MFA methods and machine tokens.
- Compare 12/24/36-month low/base/high costs using consistent user/organization assumptions.
- Include implementation, UI integration, support, data migration, audit retention, SMS, SSO, directory sync, operational staffing and exit.
- Do not score a free tier as a production fit if required session/MFA/audit controls are absent.

## 7. Candidate disposition

- Supabase Auth: **EVIDENCE STARTED — NOT SCORABLE**.
- Clerk: **EVIDENCE STARTED — NOT SCORABLE**.
- Auth0: **EVIDENCE STARTED — NOT SCORABLE**.
- Keycloak: **EVIDENCE STARTED — NOT SCORABLE**.

No identity provider is shortlisted or approved. The TSBBF workbook remains blank.

## 8. Next actions

1. Confirm exact data residency and DPA terms for all candidates, with particular attention to the Clerk US-only position and Supabase project/processor structure.
2. Obtain a scenario-specific Auth0 B2B quote if it remains in the candidate set.
3. Confirm Keycloak supported release, feature maturity, hosting/operator cost and HA requirements.
4. Add separate TC-04 workbook records for the four candidates; leave numeric scores blank.
5. Conduct an architecture-level identity/authorization design review before any provider-specific synthetic spike.

**No identity provider procurement, provisioning, production sign-in, real-user onboarding or real-data processing is authorised by this snapshot.**
