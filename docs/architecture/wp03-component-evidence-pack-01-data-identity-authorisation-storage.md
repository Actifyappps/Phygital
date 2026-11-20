# WP-03 component evidence pack 01 — data, identity, authorisation and private files

**Review date:** 20 November 2026  
**Work package:** WP-03, ADR-0001 / ADR-0002 evidence closure  
**Scope:** TC-03 relational database; TC-04 identity/authentication; TC-05 authorisation; TC-06 private object/document storage.  
**Status:** Source-derived assessment specification. No product/provider candidate has been scored, shortlisted, selected, procured, provisioned or tested. This pack is not an implementation or production authorisation.

## 1. Purpose and decision boundary

This pack translates the Phygital source requirements into four component-level evidence briefs. It is intended to make later candidate comparisons fair and testable. It does not choose a database, identity provider, policy engine, object store, framework or hosting platform.

The components are separated because a bundled platform may provide several of them, but bundle convenience must not conceal component-specific gaps, dependencies, commercial limits or exit costs. Candidate evidence must be assessed against the same requirements and workload assumptions. Unknown evidence remains UNKNOWN; it is not a score of 3 or an implicit pass.

**Current decision boundary**
- ADR-0001 technology baseline: OPEN.
- ADR-0002 application topology: OPEN.
- TSBBF workbook: blank; no candidates scored.
- Migration 001: HOLD; Migration 002: NOT AUTHORISED.
- Synthetic technology spike: prepared plan only; no execution or environment approval.
- Real participant data, live provider integrations, live trade, custody, platform-held funds and shipment remain outside current authority.

## 2. Source basis and authority

The following sources were reviewed for this pack:

| Source | Relevant authority / contribution | Status limitation |
|---|---|---|
| Concept Paper v1.1 | Strategic product purpose and staged four-pillar technology approach | Strategic baseline; not a technology selection |
| Technical Development Manual v3.0 | Modular-monolith-first planning hypothesis; relational database, secure documents, identity, workflow, audit and staged integrations | Supporting implementation plan; candidate architecture only |
| 024-A v0.1b | Identity, organisation, membership, operational roles, legal mandates, seller/exporter capacities, deny-by-default permissions and scope | Draft access-control design, not production policy |
| 024-B v0.1 | Workflow states, business rules, state-transition and transaction boundaries | Draft product workflow specification |
| 024-C v0.1 | Logical entities, relationships, evidence provenance, quantities, common metadata, integrity invariants and information classification | Conceptual/logical model, not physical schema |
| 024-D v0.1 | Logical commands, queries, events, idempotency, concurrency, authentication/authorisation and integration boundaries | Technology-neutral contracts, not final API or provider approval |
| 024-F v0.1 | Threats TH-01–TH-20, controls SEC-001–SEC-020, tests ST-01–ST-24; identity, tenant, upload, offline and audit risks | Draft security/privacy specification, not a completed assessment |
| 024-G v0.1 | Requirement-to-test-to-execution-to-review acceptance chain and test independence | Test strategy, not execution evidence |
| 018-A sponsor decisions | D-01–D-07 role, seller/exporter, hub, batch, quotation/order, allocation and payment boundaries | Approved with conditions; conditions remain relevant |
| TSBBF v1.0 / AADDG v1.0 | Weighted candidate assessment, engineering/release, security, backup, recovery and portability expectations | Governing standards; not a product/provider choice |
| Technology requirements baseline | TDR-01–TDR-18 | Comparison baseline, not implementation approval |

Canonical source links:
- [Technical Development Manual v3.0](https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce)
- [024-A — User, Organisation, Role, Authority & Permission Matrix](https://app.notion.com/p/41d6808bcd9e81deaf78fe3ab8514043)
- [024-B — End-to-End Workflow, State & Business Rules Catalogue](https://app.notion.com/p/41d6808bcd9e8111b08cc0c3006e22b8)
- [024-C — Information Architecture and Logical Data Model](https://app.notion.com/p/41d6808bcd9e8196ae03ef401018f5d1)
- [024-D — API & Integration Contract Catalogue](https://app.notion.com/p/41d6808bcd9e81fc91d5f462eb3deb8a)
- [024-F — Security, Privacy, Threat & Abuse-Control](https://app.notion.com/p/41d6808bcd9e817d8d16d37bc31c063e)
- [024-G — Test Strategy, Quality Engineering & Acceptance Evidence](https://app.notion.com/p/41d6808bcd9e81c78dfdfa7919489c30)

## 3. Cross-component requirements

All four components must collectively support:

1. Organisation/tenant isolation across records, nested resources, files, searches, exports, background jobs, events, caches and support tooling.
2. Authentication distinct from organisation membership, platform role, legal mandate, transaction-party capacity and external qualification.
3. Default-deny, server-side authorisation with explicit resource, organisation, transaction, hub, purpose and effective-date scope.
4. Append-only or otherwise tamper-evident history for material evidence, authority, commercial terms, workflow decisions and audit events; corrections use supersession, revocation or reversal rather than silent rewriting.
5. Transactional integrity, concurrency control, idempotency and replay protection for material state changes.
6. Private-by-default evidence files with scoped, time-limited access and verifiable provenance.
7. Backup, restoration, export, import and exit for structured records and file objects together, preserving relationships and lineage.
8. Least privilege for humans, services, workers, reviewers, support and break-glass access.
9. Low-bandwidth and offline workflows that never turn stale client state into current authority.
10. Evidence and operational controls proportionate to the validated pilot workload and actual staffing.

## 4. TC-03 — Relational transaction database

### 4.1 Required capability

The database must support a relational domain with referential integrity, atomic business transactions, safe concurrent reservations, auditable changes and a practical recovery/exit path. PostgreSQL is present in current candidate materials, but its presence is not a decision and no provider is selected.

### 4.2 Source-derived requirements

- Preserve the logical entities and relationships in 024-C, including users, organisations, memberships, roles, authority mandates, facilities, batches, evidence, listings, enquiries, quotations, orders, allocations, movements, shipment/payment status, disputes and audit history.
- Enforce referential integrity and domain invariants beyond simple foreign keys. In particular, batch/listing/order-item/allocation relationships must preserve seller, product, unit, quantity and accepted-quotation lineage.
- Execute reservation checks and writes atomically under concurrency. Concurrent requests must not reserve more than eligible available quantity.
- Distinguish reservation/allocation from physical inventory movement. Do not infer custody, title, release or dispatch from a reservation.
- Preserve accepted quotation lines and commercial terms as an immutable order snapshot.
- Support append-only movement/audit history, correction/reversal semantics and reconciliation of derived balances.
- Support tenant isolation and defence-in-depth database controls where the chosen architecture provides row-level security or equivalent database policy enforcement.
- Support controlled units, precision and currency semantics; avoid ungoverned free-text conversions.
- Support migration/versioning, clean install, upgrade validation, deterministic test fixtures and schema inspection.
- Provide backup/PITR or equivalent recovery capability, independent export and demonstrated restore. Recovery assumptions must be based on agreed RPO/RTO, not vendor marketing.
- Support complete export/import of records, relationships, audit history and metadata without relying on proprietary-only representations.

### 4.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Managed PostgreSQL service | Transaction/locking behaviour; version support; region; backups/PITR; extensions; connection limits; RLS; export/restore | Plan-specific limits, data location, restore fees, connection pooling, support and exit |
| PostgreSQL bundled with a managed application platform | Whether database controls remain independently usable; direct access; RLS/grants; backup/export; upgrade and service coupling | Hidden coupling, plan quotas, role/service-key exposure, restore/exit constraints |
| Self-managed PostgreSQL | Whether the team can operate patching, HA, backup, monitoring, security, restore and incident response | High operator burden; only credible with named skills, budget, on-call and tested procedures |

### 4.4 Evidence required before scoring

- Current supported versions and lifecycle/EOL policy.
- Exact region/data residency and replication locations.
- Encryption at rest/in transit, key ownership and recovery procedures.
- Role/grant model, row-level policy semantics, connection-pool context safety and privileged access controls.
- Transaction isolation, locking, deadlock and retry behaviour under realistic contention.
- Backup frequency, PITR window, restore granularity, retention, independent-copy options and restore-test procedure.
- Maximum database/storage/connection/transaction limits and plan-specific quotas.
- Export format, schema/data dump completeness, large-object handling and restore to an independent PostgreSQL environment.
- Subprocessors, data-processing terms, incident notification, deletion and support terms.
- Low/base/high TCO including compute, storage, backup, egress, support, maintenance and exit labour.

### 4.5 Minimum synthetic acceptance tests

1. Atomic reservation under parallel requests; no over-allocation.
2. Rollback on failed multi-record transaction; no partial business transition.
3. Cross-tenant query and direct-object-ID denial, including pooled connection reuse.
4. RLS/policy bypass attempts using untrusted client context and restricted service credentials.
5. Accepted quotation/order snapshot cannot be silently altered by later quotation edits.
6. Append-only movement/audit protection; correction and reversal retain prior history.
7. Backup restore to a clean, isolated environment; reconcile row counts, relationships, file references and audit lineage.
8. Full export/import rehearsal into a separate compatible environment.
9. Migration clean-install and upgrade paths tested against exact source-controlled migration files.
10. Deadlock, retry, timeout and connection exhaustion behaviour observed and documented.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No provider-specific evidence, validated workload, restore rehearsal or candidate test results are attached.

## 5. TC-04 — Identity, authentication and sessions

### 5.1 Required capability

Identity must reliably establish the human or machine principal, authenticate it, manage sessions and support secure lifecycle events. Authentication must not be mistaken for organisation authority or permission to perform a transaction.

### 5.2 Source-derived requirements

- Support human and non-human/service identities as separate principal types.
- Support secure sign-in, sign-out, session expiry, refresh, revocation and recovery.
- Support MFA or proportionate step-up authentication for privileged, sensitive or high-impact actions.
- Provide secure account invitation, activation, recovery and contact-verification flows.
- Support organisation membership as a separate, time-bounded relationship; one user may belong to multiple organisations.
- Ensure account disablement, compromise response, credential reset and membership/mandate revocation take effect promptly.
- Keep secrets, signing keys and privileged service credentials out of browser/mobile code and repository history.
- Support audit records for authentication events, credential lifecycle, privileged access and administrative changes without logging secrets.
- Support accessible, low-bandwidth and shared-device-aware workflows without weakening security.
- Provide a viable identity export/exit or documented identity-subject mapping strategy; do not assume provider-specific subject IDs are portable.

### 5.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Managed standards-based identity provider (OIDC/OAuth or equivalent) | MFA, recovery, session control, federation, region, export, lifecycle APIs, terms | Provider lock-in, subject portability, pricing by active user/MFA, support and data-processing terms |
| Application-integrated managed identity | Fit with selected runtime/database, server-side session handling, MFA, RLS integration, export | Tight coupling between identity and database/platform; service-role or token misuse |
| Maintained self-hosted identity service | Team ability to secure, patch, operate, recover and support identity infrastructure | High operational burden, key recovery, patch cadence, availability and incident ownership |

### 5.4 Evidence required before scoring

- Standards/protocol support and current product lifecycle.
- MFA methods, recovery safeguards, session duration, refresh-token rotation and revocation semantics.
- Account enumeration, brute-force, credential-stuffing and phishing-resistance controls.
- Machine identity, service credential rotation, workload identity and scoped-token support.
- Region, subprocessors, personal-data handling, retention, deletion and data-processing terms.
- Audit event availability, export and retention controls.
- User/account pricing, MAU definitions, MFA/enterprise feature charges, quotas and suspension/upgrade consequences.
- Identity migration/export, stable subject mapping, account recovery during provider outage and exit procedure.
- Accessibility, language, shared-device and low-bandwidth behaviour.

### 5.5 Minimum synthetic acceptance tests

1. Sign-in/out, session expiry and refresh lifecycle.
2. Immediate session/token revocation after account disablement or credential compromise.
3. MFA/step-up enforcement for selected privileged operations.
4. Account recovery and invitation flows resist unauthorized takeover and enumeration.
5. Service identity is non-interactive, purpose-bound, least-privileged and rotatable.
6. User with memberships in two synthetic organisations cannot inherit the wrong active organisation context.
7. Client-supplied role, organisation or authority claims cannot override trusted server-side identity context.
8. Sensitive credentials, tokens and recovery secrets do not appear in browser bundles, logs, error messages or repository.
9. Identity-provider outage/recovery behaviour is understood and safely fails closed.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No identity candidate, pricing/terms review, lifecycle test or recovery evidence is recorded.

## 6. TC-05 — Authorisation and policy enforcement

### 6.1 Required capability

Authorisation is a separate control plane from authentication. Every protected action must be evaluated against principal, organisation membership, operational role, resource scope, legal/contractual mandate, external qualification, separation of duties, time validity and workflow/programme state.

### 6.2 Source-derived requirements

- Default deny. Missing, ambiguous, expired, disputed, suspended or revoked authority results in denial or hold.
- Enforce policy on the trusted server for every command, query, export, file access, event subscription, background job and administrative action. UI hiding is not a security boundary.
- Use explicit action permissions rather than a broad administrator flag.
- Scope access by organisation, resource, transaction, hub, assigned case, document, review mandate and purpose as appropriate.
- Distinguish user identity, organisation, membership, platform role, legal mandate, transaction-party capacity and external qualification.
- Seller and exporter capacities must be separately evidenced, scoped, effective-dated and revocable. No automatic substitution/fallback.
- Hub service operator cannot obtain custody, stock control, release or dispatch authority by virtue of a hub role.
- Platform operator is not default seller, exporter, custodian, payee or funds holder.
- Enforce separation of duties: no self-approval of authority/qualification, no reviewer editing source evidence, and no unreviewed privileged override.
- Support revocation, expiry, periodic review, reasoned exceptions and tamper-evident audit.
- Protect nested records, direct object IDs, search, exports, cached projections, background jobs and provider callbacks against cross-tenant/object-level access.

### 6.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Application policy layer / policy library | Expressiveness, testability, policy versioning, deny-by-default, context integrity, explainability | Policy drift, incomplete endpoint coverage, developer bypass and lack of independent enforcement |
| Database row-level security plus service policy | Defence-in-depth, pooled-connection safety, policy maintainability, service-role boundaries | RLS mistaken for complete business authorisation; elevated keys bypassing policy; context leakage |
| Dedicated policy decision service/engine | Central policy governance, evaluation latency, availability, audit, policy-as-code portability | Added runtime and operational complexity; outage handling; policy distribution and consistency |

These classes can be combined. The selected approach must state which layer is authoritative for each decision and how policy is tested end-to-end.

### 6.4 Evidence required before scoring

- Policy language/model and ability to represent principal/action/resource/context plus time and authority evidence.
- Server-side coverage across all APIs, files, exports, workers, webhooks, events, admin and support paths.
- Database enforcement integration and bypass characteristics.
- Policy versioning, review/approval, deployment, rollback and audit.
- Revocation propagation and cache/token invalidation behaviour.
- Testability of positive, negative, cross-tenant, nested-object, expired-mandate and separation-of-duty cases.
- Policy decision logs that are explainable but do not leak sensitive information.
- Availability/latency characteristics and safe failure mode if policy evaluation is unavailable.
- Operational owner, skills, maintenance burden and exit strategy.

### 6.5 Minimum synthetic acceptance tests

1. Cross-tenant direct-ID read/write denied for every protected resource family.
2. User with valid login but no active membership is denied organisation actions.
3. Membership without action permission is denied.
4. Operational role without seller/exporter mandate is denied for that capacity.
5. Expired, revoked, suspended or disputed mandate is denied/held.
6. Hub service operator cannot create custody, release or dispatch evidence under baseline.
7. Platform operator cannot be selected as default seller/payee or funds holder.
8. Reviewer cannot modify source evidence or approve their own work.
9. Privileged/break-glass access requires scoped reason, time limit, audit and review.
10. Background job and webhook actions are evaluated against their service identity and assigned scope, not a broad service key.
11. Cache, search, export and signed-file access do not leak another tenant's restricted records.
12. Policy outage, missing context or unknown permission fails closed.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No policy candidate or end-to-end authorization coverage evidence is recorded.

## 7. TC-06 — Private object and document storage

### 7.1 Required capability

Evidence and documents must be private by default, bound to a logical evidence/document record and protected by the same organisation, transaction, resource and purpose boundaries as the underlying data. A file URL or possession of an opaque identifier is not authorization.

### 7.2 Source-derived requirements

- Store private documents separately from public projections and ordinary public web assets.
- Associate each object with a controlled metadata record: stable ID, owner/tenant scope, related entity/claim, evidence class, acquisition type, issuer/source, recorded time, validity, reviewer/status, classification, retention and supersession/revocation references as applicable.
- Enforce upload, view, download, replacement, deletion, export and sharing permissions server-side.
- Use short-lived, narrowly scoped access mechanisms where direct object access is required; do not expose permanent public object URLs for restricted evidence.
- Validate file type/content, size and filename safely; quarantine pending malware/content inspection where required.
- Preserve integrity metadata (e.g., cryptographic hash) and upload provenance; distinguish file integrity from issuer authenticity or truth of the claim.
- Support versioning/supersession and controlled retention/deletion; ordinary overwrite must not erase evidence history.
- Prevent path traversal, malicious content execution, cross-tenant object enumeration and unauthorized public-cache/CDN exposure.
- Support backup/restore and complete export of objects plus metadata and relationships.
- Keep secrets, provider credentials and storage master keys server-side; log access and material lifecycle actions without logging file contents or signed secrets.
- Support large-file/resumable upload and constrained-connectivity recovery only to the extent justified by validated pilot file sizes and network conditions.

### 7.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Managed private object storage | Private buckets/containers, scoped access, lifecycle/versioning, region, encryption, events, export | Public ACL mistakes, egress cost, provider-specific URL/metadata semantics, retention/restore limits |
| Object storage bundled with a managed application platform | Same controls plus how application identity/RLS integrates with object policies | Policy coupling, service key exposure, incomplete object export, plan-specific limits |
| Self-managed S3-compatible or equivalent storage | Ability to secure endpoints, keys, replication, lifecycle, malware pipeline, restore and operations | Operational complexity, availability, patching, backup separation and recovery ownership |

### 7.4 Evidence required before scoring

- Private-by-default bucket/container configuration and public-access prevention.
- Object-level access policy integration with trusted identity and authorisation.
- Signed URL/token scope, lifetime, revocation limitations and cache behaviour.
- Encryption in transit/at rest, key ownership, rotation and recovery.
- Region, replication, subprocessors, deletion and retention controls.
- Upload limits, resumable/multipart support, checksum validation and bandwidth constraints.
- Versioning, object lock/immutability options if needed, lifecycle policy and legal hold capability.
- Malware scanning/quarantine integration and failure behaviour.
- Backup/restore, object inventory reconciliation and export including metadata.
- Storage, operations, request, retrieval, egress and scanning costs at low/base/high volumes.
- Incident response, service-level/support terms and provider exit mechanics.

### 7.5 Minimum synthetic acceptance tests

1. Anonymous access to private object denied.
2. Cross-tenant object ID and guessed URL denied.
3. User with record access but no document permission denied.
4. Expired, revoked or wrong-resource signed link denied or rendered unusable within documented limits.
5. Upload of disallowed type, oversized file and malicious test fixture is rejected or quarantined.
6. File hash/metadata integrity verified; changed file creates a new controlled version rather than silent overwrite.
7. Revoked/superseded evidence is not represented as current verification.
8. Public projection exposes only allow-listed fields and never private evidence URLs/metadata.
9. Storage outage or malware-scanner outage fails safely and leaves the file unavailable pending review.
10. Backup restore and independent export preserve objects, metadata, tenant scope, hashes and entity relationships.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No storage candidate, access-policy test, malware pipeline, restore evidence or cost model is recorded.

## 8. Shared acceptance and evidence record

For each candidate/component, retain:
- candidate name, product/service and exact version/plan;
- assessor, review date and evidence URLs/files with publication/retrieval dates;
- data region, subprocessors, licence and commercial-use terms;
- requirement-by-requirement disposition (PASS / PARTIAL / FAIL / UNKNOWN);
- exact test environment, synthetic fixture, configuration, commands and build/commit identity;
- raw test outputs, screenshots/logs where appropriate, defects and retest evidence;
- low/base/high TCO and operator effort;
- critical blockers, mitigations, accountable owner and review date;
- completed TSBBF weighted score only when evidence is sufficient;
- explicit disposition: unassessed, incomplete, shortlist for testing, reject, defer or approved by authorised decision.

Do not copy provider marketing claims into a score without verifying the applicable plan, region, terms and limits. Do not compare different capacity or support tiers as though equivalent.

## 9. Dependencies and unresolved inputs

The following remain blockers or evidence dependencies:
1. Canonical Developer Guide v0.1 source recovery or formal disposition before Candidate A is assessed.
2. Validated pilot user/organisation/role mix, transaction volumes, document sizes, retention, connectivity and offline assumptions.
3. Applicable data-protection/legal review, data-location requirements and controller/processor roles.
4. Named operational owners and skills for database, identity, policy, storage, backup, security and incident response.
5. Current provider-specific commercial terms, plan limits, support and exit costs.
6. Approved synthetic spike scope, environment, budget and reviewers before any executable comparison.
7. Independent security/privacy and recovery review at the appropriate gate.

## 10. Disposition

This first WP-03 pack establishes what must be evidenced for TC-03 through TC-06. It does not establish that any candidate meets the requirements. The next pack should address TC-01, TC-02 and TC-07 (frontend, application runtime and background workers), followed by hosting/CI/backup/offline/portability.

**No technology selection, procurement, provisioning, migration, real-data processing or live integration is authorised by this pack.**
