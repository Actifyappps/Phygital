# Privacy, records and information-security control index

Companion to 024-F and 024-A. This is a requirements index, not a legal opinion, approved privacy notice, DPIA or security certification.

## Information classes
1. Public approved listing/profile projection.
2. Internal operational information.
3. Confidential commercial information (buyer specifications, prices, supplier terms).
4. Personal data and identity/mandate records.
5. Restricted evidence and security material (identity documents, certificates, credentials, device/security logs).

## Required controls
- Purpose limitation, minimisation, documented lawful-basis assessment, transparent notices and consent only where appropriate.
- Tenant/organisation isolation and explicit actor-capacity authorisation.
- Least privilege, separation of duties, time-bounded access, MFA for privileged roles and periodic access review.
- Encryption in transit/at rest, managed secrets, rotation, no secrets in Git, logs or client bundles.
- Secure upload/download, malware scanning, private-by-default evidence, short-lived access URLs.
- Retention schedule, legal hold, correction, export, deletion/anonymisation and backup expiry processes.
- Data-subject request and incident/breach workflow with accountable owner and deadlines validated by counsel.
- Threat modelling for offline devices, lost/stolen devices, local cache, sync conflicts, replay, QR/public links, enumeration, scraping, account takeover, malicious files, abuse and webhook spoofing.
- Audit records for privileged access, authority decisions, evidence access, data exports, moderation and case outcomes.
- Security tests: authentication, authorisation, tenant isolation, object access, input validation, rate limits, secrets, dependency/supply-chain, recovery and abuse cases.

Public QR or share links must be revocable, scope-limited and non-enumerable. Do not expose underlying private documents or personal data.


## 024-F detailed control expansion — draft requirements, not implementation evidence

### Information classification

| Class | Examples | Default handling |
|---|---|---|
| Public | Explicitly approved listing/profile fields and public programme information | Publish only through reviewed allow-list projections |
| Internal | Routine procedures and non-public workflow metadata | Authenticated access |
| Confidential | Buyer specifications, quotations, prices, supplier/provider contracts and operational exceptions | Need-to-know; organisation/transaction scoped; controlled export |
| Restricted personal/member | Contact details, member-linked production, identity documents and sensitive location data | Purpose-limited, minimal collection, enhanced access/disclosure controls |
| Restricted security | Credentials, recovery codes, signing keys, vulnerability details and incident evidence | Dedicated privileged access and secure storage; never ordinary logs or application exposure |

If a record combines classes, apply the strictest relevant control or safely separate the fields. Classification is content- and context-sensitive.

### Purpose, minimisation and disclosure

- Define a specific purpose, owner and lawful authority before collecting personal/member-linked data.
- Collect only what the current workflow stage needs. Do not collect identity documents, precise coordinates, household details or member-level production merely because a form can accept them.
- Separate organisation representation authority from authority to disclose individual members' personal data.
- Prefer aggregate or pseudonymised data for dashboards and buyer-facing summaries.
- For non-routine disclosure, record purpose, recipient, fields, authority/lawful basis, scope, expiry/review and approver.
- Define retention, correction, export, deletion/anonymisation, legal hold and backup expiry by data category.
- Assess controller/processor roles, cross-border hosting/transfers, subprocessors, notices, data-subject requests and breach obligations with qualified legal/data-protection review. This repository is not a legal opinion or DPIA.

### Identity, sessions and access

- Select a maintained authentication service through the technology decision process; do not invent custom password cryptography.
- Apply rate limits and anti-enumeration controls to login, invitation, reset and recovery.
- Require MFA for privileged and other high-impact roles; recovery must not silently weaken assurance.
- Use secure session/token storage, TLS, appropriate cookie settings, session rotation/revocation and re-authentication for high-impact actions.
- Shared-device workflows must show active identity/organisation, avoid credential persistence, support rapid logout and prevent prior-user disclosure.
- Every protected operation checks authenticated identity, organisation, role, capacity, mandate, purpose, object scope, workflow state and separation-of-duties requirements.
- Derive organisation context server-side. Browser-supplied tenant IDs are not authority. Revalidate authority at action time, including after offline queueing.

### Evidence, files and public projections

- Keep Framework 008 evidence class (E1 independently verified; E2 documentary; E3 declared; E4 assumption/unknown) separate from acquisition method/provenance.
- Evidence-class upgrades require an authorized review event and supporting provenance; upload, QR code or dropdown change cannot upgrade evidence.
- Validate file content/signature, type and size; use generated storage keys; store outside executable web roots; quarantine suspicious or unscanned files; scan before sharing.
- Prevent path traversal, archive bombs, polyglot files, script execution and unsafe previews.
- Authorize each download at access time or use narrowly scoped, short-lived links. No permanent public links to confidential evidence.
- Log upload, view, download, replacement, quarantine, release and deletion without recording file contents or secrets.
- QR/public endpoints expose only approved allow-listed projections; links must be revocable and non-enumerable.

### API, integration and transaction integrity

- Authenticate and authorize every non-public endpoint and object/action; validate types, ranges, units, business invariants and allow-listed fields server-side.
- Apply request/body/pagination limits, rate limits and safe errors; prevent injection, SSRF, unsafe deserialization, path traversal and mass assignment.
- Bind idempotency keys to actor, organisation, operation and request semantics; reject conflicting reuse.
- Protect concurrent allocation, order acceptance and provider event processing with server-side transaction controls.
- Verify provider signatures, timestamps and replay windows in trusted adapters. Keep per-environment/provider secrets in an approved secret manager; rotate/revoke them.
- Validate provider event IDs, amount/currency/reference, status transitions and duplicates. Browser redirects and screenshots are not authoritative payment confirmation.
- Never let webhook handling itself create authority for the marketplace to receive/hold/disburse funds.

### Offline and field devices

- Maintain an explicit allow-list of offline actions with actor/device binding, expiry, minimised data, idempotency and conflict rules.
- Offline capture is pending until server validation and acknowledgement.
- High-impact actions remain online-only under the current baseline: authority approval, seller/exporter acceptance, quotation/order acceptance, custody, release, dispatch, payment confirmation, recall closure and privileged access changes.
- No offline action may assert custody, stock held, movement or shipment under the service-only hub boundary.
- Encrypt device storage, minimise local cache, support device/session revocation and lost-device response, and revalidate actor, organisation, mandate, permission, record/rule version and expiry at sync.
- Reject/quarantine revoked, stale, duplicate, malformed, out-of-order or conflicting actions. Never use last-write-wins for quantity, price, authority, evidence class or workflow state.

### Marketplace trust, monitoring and continuity

Provide reporting and case handling for impersonation, false evidence, misleading listings, quantity manipulation, coercion, collusion, harassment, payment/shipment spoofing and scraping. Cases require unique IDs, severity, owner, evidence references, restricted access, human review, reasoned outcomes, appeal/correction and anti-retaliation controls. Preserve withdrawal/recall trace-back and trace-forward.

Monitor suspicious authentication, privilege/mandate changes, cross-tenant denials, bulk exports, file access, evidence changes, allocation conflicts, webhook failures, offline sync anomalies, backup failures and secret exposure. Define thresholds only after the selected architecture and operating capacity are known.

Backup scope/frequency/encryption/access/retention and recovery objectives require a business-impact decision. Restore evidence must include integrity validation and an authorised reopening decision.
