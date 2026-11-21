# WP-03 P0 component evidence assessment 001

**Assessment date:** 21 November 2026  
**Repository baseline:** `main` at `1c78997c55d4ac7b845ebbdf7940ae00541b9e83`  
**Scope:** TC-02 application runtime, TC-03 relational database, TC-04 identity/authentication, TC-05 authorisation, TC-06 private object storage and TC-07 background workers.  
**Status:** Evidence synthesis for controlled review. Not a candidate scorecard, shortlist, architecture approval, procurement instruction, synthetic-spike authorisation or implementation approval.

## 1. Executive finding

WP-03 has progressed beyond a technology-neutral requirements list. The repository now contains:

- source-derived component evidence briefs for data/identity/authorisation/storage and frontend/runtime/workers;
- initial provider or pattern evidence snapshots for database, identity, authorisation, storage, and frontend/runtime/workers;
- a common TDR-01–TDR-18 comparison baseline, TSBBF scoring method, candidate register and workload/TCO assumptions register.

This is enough to identify credible candidate classes and meaningful strengths, limitations and test questions. It is **not** enough to score or select any of the six P0 components.

**Current disposition:** all six components remain **EVIDENCE STARTED — NOT SCORABLE**. No numeric TSBBF score, shortlist, preferred stack or provider selection is made here. Missing pilot facts, legal/privacy decisions, contract terms, named operating capacity and reproducible tests remain decision blockers.

## 2. Assessment method and boundaries

This synthesis separates four layers that must not be conflated:

1. **Requirement:** what Phygital must do, derived from the governed product, domain, workflow, security and sponsor sources.
2. **Candidate capability:** what the current public-source snapshots indicate a product or pattern may provide.
3. **Evidence gap:** what remains unverified for the exact plan, region, version, workload, contract and operational model.
4. **Decision status:** whether the evidence is sufficient for scoring or approval. It is not.

Public documentation is useful for discovery, not proof of contractual suitability, legal compliance, operational readiness or successful behaviour in Phygital's workflows. A product feature is not an implemented control. An integration bundle does not automatically settle separate component decisions.

The following controls remain binding:

- ADR-0001 and ADR-0002 are OPEN.
- EVI-25 source recovery/disposition and EVI-27 topology review remain open.
- No candidate is READY FOR SCORING; the TSBBF workbook remains blank.
- Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED.
- WP-05 synthetic spike remains NOT READY — NOT AUTHORIZED; no spike execution is evidenced.
- No production provider account, production environment, live participant data, live integration, live trade, platform custody or platform-held funds is authorised.

## 3. Component-by-component assessment

### 3.1 TC-03 — Relational transaction database

**Required capability**

The system needs PostgreSQL-class relational integrity (or an equivalently evidenced relational capability), atomic business transactions, safe concurrent reservation/allocation, tenant isolation, controlled quantity and currency semantics, immutable accepted commercial snapshots, auditable correction/reversal history, migration discipline, backup/restore and independent export/import.

**Candidate capability evidence captured**

| Candidate | Public-source capability captured | Material limitation / risk |
|---|---|---|
| Supabase PostgreSQL | Managed PostgreSQL; integrated Auth/Storage ecosystem; RLS; published regional choices including Singapore; paid-plan daily backups and separately priced PITR | Object blobs are not included in database backups; plan/compute/egress/PITR costs need normalisation; region selection does not settle all processing locations; RLS, pooled-connection and privileged-role behaviour require tests |
| Neon PostgreSQL | Managed PostgreSQL; branching; separated compute/storage; autoscaling and scale-to-zero; published history/restore windows and regional signals | Cold-start and continuous-load economics need measurement; exact contracting entity, region, extension support, restore and independent exit need confirmation; database restore is not whole-application recovery |
| Render PostgreSQL | Managed PostgreSQL within a platform that also offers app services and workers; published regional choices include Singapore | Exact plan/region, DPA, recovery/export, access hardening, extension and combined workspace/service costs remain unverified |

**Assessment**

All three are plausible managed-PostgreSQL candidates for further evidence collection. PostgreSQL compatibility alone does not prove the required transaction invariants, RLS posture, restore quality or portability. Self-managed PostgreSQL remains a candidate class only if an operator, support coverage, patching, HA, backup, incident response and full TCO can be evidenced.

**Closure evidence required**

- validated workload and concurrency profile (ECR-02);
- data map, legal basis, controller/processor analysis and cross-border transfer assessment (ECR-04);
- exact provider plan, region, DPA, subprocessors, service terms and support (ECR-05);
- named technical and operational ownership (ECR-06);
- comparable low/base/high 12/24/36-month TCO (ECR-07);
- approved RPO/RTO and retention, plus a witnessed database-and-file restore (ECR-08);
- independent tests for concurrent no-over-allocation, tenant isolation, pooled-connection context, privileged-role bypass, migration/rollback and full export/import (ECR-11 and ECR-12 prerequisites).

**Disposition:** EVIDENCE STARTED — NOT SCORABLE.

### 3.2 TC-04 — Identity, authentication and sessions

**Required capability**

Authenticate human and machine principals; support secure enrolment, recovery, MFA/step-up, session expiry and revocation; support multiple organisation memberships without trusting client-selected organisation context; and preserve portable identity-subject mapping and auditable administration.

Authentication must not become the source of Phygital membership, seller/exporter capacity, legal mandate, hub authority, reviewer appointment or transaction permission.

**Candidate capability evidence captured**

| Candidate | Public-source capability captured | Material limitation / risk |
|---|---|---|
| Supabase Auth | Password, magic link, OTP, social and SSO options; JWT integration with PostgreSQL/RLS; integrated account model | Session defaults and refresh/revocation semantics need deliberate configuration and tests; MFA/SSO entitlements and costs vary; identity export and broader data-processing terms remain open |
| Clerk | Managed sign-in/session UX, MFA and B2B organisation/invitation features | Published security materials state US-hosted infrastructure and no regional data residency; MRU and enhanced B2B pricing/limits need normalisation; Phygital mandates remain application-owned |
| Auth0 | Managed CIAM, B2B/organisation capabilities, MFA and public/private-cloud options | Exact B2B/private-cloud SKU, region, feature entitlement, quote and DPA are not established in the snapshot |
| Keycloak | Open-source, self-hostable identity and access-management pattern | Requires a named operator and evidenced patching, HA, backup, monitoring, incident response, supported release and full operating TCO |

**Assessment**

Supabase Auth may reduce integration seams where paired with Supabase PostgreSQL, but that convenience must be weighed against platform coupling and session/security controls. Clerk's organisation features do not offset a potentially material data-location constraint without legal review. Auth0's managed capabilities require exact commercial and region evidence. Keycloak increases control and operational responsibility; open-source licensing does not make it cost-free or self-operating.

**Closure evidence required**

- current data-flow, legal basis, residency and subprocessor review (ECR-04/05);
- exact feature/SKU and commercial terms;
- MFA, recovery, session lifetime, refresh, device revocation and compromised-account response tests;
- immediate or bounded revocation across APIs, jobs, files, exports and cached sessions;
- multi-organisation membership and identity-provider exit/export test;
- named identity/security operator and support model (ECR-06);
- independent review of service credentials, token claims and audit-log redaction (ECR-11).

**Disposition:** EVIDENCE STARTED — NOT SCORABLE.

### 3.3 TC-05 — Authorisation and policy enforcement

**Required capability**

Implement Phygital's full authority tuple at trusted server boundaries: subject, organisation, membership, role, action, resource, scope, capacity, mandate, evidence state, effective time, phase, environment, purpose and data classification. Decisions must allow, deny or hold/review with reason and audit reference. Missing, ambiguous, expired, conflicting or unverified authority must default to deny/hold.

**Candidate capability evidence captured**

| Pattern | Public-source capability captured | Material limitation / risk |
|---|---|---|
| Application-owned policy module + PostgreSQL RLS | Central domain policy can evaluate Phygital's authority tuple; PostgreSQL RLS provides defence-in-depth row filtering and mutation control | Coverage can be omitted from a new endpoint, job, export, webhook, cache or file path; table owners, superusers and BYPASSRLS/service roles can bypass policies; pooled context isolation must be proven |
| OpenFGA | Relationship-based access checks, modelled relations/tuples, APIs and PostgreSQL/MySQL storage options; Apache-2.0 project | Tuple synchronisation and revocation consistency are critical; graph relations do not independently establish legal authority; adds a service and operating burden; experimental features must not underpin critical controls |
| OPA | General policy-as-code engine with Rego and local/API/WASM deployment patterns | Requires policy distribution/versioning, skills, enforcement-point discipline and privacy-safe decision logs; stale bundles and fail-open/fail-closed behaviour need testing |

**Assessment**

The application must remain the canonical authority owner regardless of pattern. PostgreSQL RLS is a data-plane control, while OpenFGA and OPA are policy decision patterns; neither is a substitute for server-side enforcement, legal evidence verification or Phygital's own mandate records. A separate policy service is justified only if measurable reuse or policy complexity outweighs consistency, latency, failure and operational costs.

**Closure evidence required**

- complete mapping of 024-A actions and tuple dimensions to application endpoints, jobs, files, search, export, webhooks and database policies;
- role/grant inventory proving ordinary runtime roles are not owners, superusers or BYPASSRLS;
- pooled-connection and tenant-context reset tests;
- positive, negative, cross-tenant, expired, revoked, disputed and stale-authority tests;
- if OpenFGA is considered: tuple sync, consistency, model versioning, export/restore and revocation tests;
- if OPA is considered: bundle signing/versioning, rollout/rollback, stale policy and decision-log redaction tests;
- independent security review and named policy owner (ECR-06/11).

**Disposition:** EVIDENCE STARTED — NOT SCORABLE. The application-owned authority model is a product requirement, not a selected vendor.

### 3.4 TC-06 — Private object and document storage

**Required capability**

Keep evidence and trade documents private by default; authorise every upload, view, download, replacement, deletion and export against organisation/resource scope; use short-lived scoped grants; validate type/size; quarantine and inspect malware; retain integrity/provenance/version metadata; support legal hold/deletion and restore/export of objects together with their metadata and relationships.

A hash establishes integrity relative to a recorded value, not issuer identity, truth or certification. A signed URL is a bearer capability, not a fresh authorisation decision.

**Candidate capability evidence captured**

| Candidate | Public-source capability captured | Material limitation / risk |
|---|---|---|
| Supabase Storage | Private buckets, RLS-controlled object access, authenticated downloads and time-limited signed URLs; resumable upload support | Signed URLs are bearer links and individual links cannot simply be revoked; database backups include object metadata but not blobs; egress, access audit, region and exit need proof |
| Cloudflare R2 | S3-compatible API, presigned URLs, lifecycle controls, no internet egress fee for standard storage; APAC location hint | APAC hint is not a residency guarantee; current jurisdiction restrictions do not offer Kenya/APAC; no S3 Object Lock; object access logs are not a complete immutable business audit |
| Amazon S3 | Managed object storage with region selection, versioning, lifecycle and Object Lock capabilities in the documented product family | IAM/KMS and policy design complexity; exact region, DPA, logging, retention configuration, retrieval/replication and total cost require candidate-specific evidence |

**Assessment**

All three offer plausible storage primitives, but none alone supplies Phygital's evidence authority, retention policy or end-to-end recoverability. Database and object recovery must be coordinated and independently reconciled. Malware scanning/quarantine and business-level audit must be explicit, not inferred from object storage.

**Closure evidence required**

- approved data classification, retention, legal hold and deletion schedule;
- exact region, DPA, subprocessor, encryption/key and support terms;
- scoped upload/download and revocation tests across direct access, signed URLs, service credentials and shared devices;
- malware quarantine, file type/size validation and safe release tests;
- object version/hash/provenance and access audit;
- independent object export/restore with database metadata and relationship reconciliation;
- TCO including requests, storage class, retrieval, egress, scanning, logs, support and exit labour.

**Disposition:** EVIDENCE STARTED — NOT SCORABLE.

### 3.5 TC-02 — API/application runtime

**Required capability**

Provide a trusted server-side boundary for authentication context, organisation and mandate checks, workflow transitions, transactional operations, validation, idempotency, audit, integration adapters and safe error handling. Keep domain rules independent of UI framework and provider SDKs. Support reproducible builds, secure configuration, maintainable tests and portability.

**Candidate capability evidence captured**

| Candidate | Public-source capability captured | Material limitation / risk |
|---|---|---|
| Next.js Node.js server/BFF | Full-stack React server/runtime candidate; can colocate web routes and server-side application endpoints | Server actions, route handlers, cache and rendering boundaries need explicit governance; provider/runtime portability and cache isolation require tests; canonical Developer Guide v0.1 remains unrecovered |
| NestJS 12 | Structured Node.js application framework with module/provider conventions suitable for a modular API | Exact Node compatibility matrix, team skills, dependency lifecycle, deployment limits and operating cost need confirmation |
| Express 5 | Minimal Node.js HTTP framework with broad ecosystem and flexible application structure | Requires deliberate conventions for modules, validation, authorisation, errors, observability and dependency maintenance; flexibility can become inconsistency |

**Assessment**

These candidates can host a trusted application boundary, but framework features do not prove that the required boundary has been implemented correctly. A modular-monolith-first design remains a topology hypothesis in ADR-0002, not a runtime selection. The recovered Technical Development Manual v3.0 informs a candidate shape; the unrecovered Developer Guide prevents treating its Next.js assumptions as authoritative.

**Closure evidence required**

- canonical Developer Guide v0.1 recovery or authorized disposition (ECR-01);
- validated workflow and workload profile (ECR-02);
- clean-checkout build, dependency/security lifecycle, route/API contract and transaction tests;
- cache isolation and private-data handling tests;
- runtime limits, timeouts, concurrency, background-work separation and deployment portability;
- skills/maintenance ownership and comparable TCO (ECR-06/07);
- independent review of authentication, authorization, error handling, logging and provider adapter boundaries.

**Disposition:** EVIDENCE STARTED — NOT SCORABLE.

### 3.6 TC-07 — Background workers and durable asynchronous processing

**Required capability**

Process provider events, notifications, scheduled work and long-running document/QR tasks without losing accountability. Jobs and consumers must be authenticated, attributable, idempotent, bounded and observable, with retries, dead-letter/terminal-failure handling, replay protection and reconciliation. An accepted job is not proof that its external effect occurred.

**Candidate capability evidence captured**

| Pattern | Public-source capability captured | Material limitation / risk |
|---|---|---|
| PostgreSQL transactional outbox + worker | Can couple business transaction and event record in one database commit; a separate consumer can poll and process durable work | Polling/locking, throughput, back-pressure, retries, poison messages, worker ownership and recovery need design and failure tests |
| Supabase Queues (pgmq) + consumer | PostgreSQL-backed queue capability within Supabase ecosystem | Snapshot identifies public Alpha maturity; consumer runtime, delivery guarantees, limits, support and production suitability require current verification |
| Cloudflare Queues + Workers | Managed queue and worker execution with documented at-least-once delivery and bounded message/runtime characteristics | At-least-once requires idempotent effects; message size/retention/runtime constraints, jurisdiction, dead-letter and outbox integration must be verified |
| Render worker + Key Value/BullMQ or Workflows | Separate background worker service and queue/workflow patterns within a managed app platform | Workspace/service TCO, queue persistence, Workflows maturity, retry/restore and operational coupling remain open |

**Assessment**

The product requires durable asynchronous semantics, not a particular queue vendor. A database-backed outbox is a credible pattern for preserving transactional event intent, but it still requires a durable consumer, observable retries and reconciliation. A separate worker runtime is not automatically necessary for the pilot; it must be justified by workload, runtime limits, reliability or security and assigned to an operator.

**Closure evidence required**

- validated job/event volume, size, duration, ordering and peak patterns (ECR-02);
- named worker/operator and support/escalation model (ECR-06);
- duplicate, replay, retry, timeout, poison-message and dead-letter tests;
- idempotent external effects and reconciliation after ambiguous provider responses;
- secret isolation, signed webhook validation, least-privilege service identity and log redaction;
- queue persistence, backup/restore, regional terms, service limits and TCO;
- separate explicit authorization before any synthetic spike (ECR-12).

**Disposition:** EVIDENCE STARTED — NOT SCORABLE.

## 4. Cross-component findings

1. **Authority cannot be outsourced.** Identity proves a principal; it does not prove legal or contractual capacity. Policy engines and database rules enforce recorded authority; they do not verify its real-world truth.
2. **Data and object recovery are one service outcome.** A database backup that omits file blobs is not a complete Phygital restore. Metadata, object versions, audit history, configuration and identity mapping must reconcile.
3. **Revocation must cross boundaries.** Membership/mandate changes must affect API requests, database policies, files, cached sessions, search, exports, jobs and provider callbacks within an approved and tested bound.
4. **At-least-once processing is normal, not exceptional.** Duplicate delivery, retries and ambiguous external outcomes must be handled through idempotency and reconciliation, not assumed away.
5. **The client is untrusted.** No frontend or offline client can establish current authority, quantity availability, workflow state, payment completion or physical custody.
6. **Bundling is not automatically cheaper or safer.** Integrated platforms may reduce service count but can increase coupling, shared blast radius, data-location constraints and exit complexity. Compare component fit and bundle-level consequences separately.
7. **Pilot scope is not a workload forecast.** “One commodity, one hub and limited participants” is a planning boundary only. Numeric users, concurrency, records, files, bandwidth, retention and cost remain UNKNOWN.

## 5. Evidence closure map

| Evidence request | Primary components affected | Current state | Closure evidence |
|---|---|---|---|
| ECR-01 Developer Guide source | TC-01, TC-02, TC-03, TC-04, TC-06 and ADRs | OPEN | Canonical complete source/version/authority or authorized disposition |
| ECR-02 Workload profile | All six | PARTIAL SOURCE EVIDENCE | Validated participant, transaction, concurrency, file and job quantities |
| ECR-03 Hub/connectivity/device | TC-01, TC-02, TC-06, TC-07 | DESIGN EVIDENCE ONLY | Appointed site and measured connectivity/device/power evidence |
| ECR-04 Data/privacy/legal | TC-03, TC-04, TC-05, TC-06, TC-07 | DESIGN EVIDENCE ONLY | Approved data map, legal basis, roles, transfer and retention assessment |
| ECR-05 Provider terms/region | All provider-backed candidates | DESIGN EVIDENCE ONLY | Exact plan/SKU/version, DPA, subprocessors, region, SLA, support, export and current price |
| ECR-06 Operating capacity | All six | DESIGN EVIDENCE ONLY | Named accountable roles, skills, support, maintenance and incident/recovery coverage |
| ECR-07 TCO | All six | DESIGN EVIDENCE ONLY | Comparable low/base/high 12/24/36-month model |
| ECR-08 Recovery/retention | TC-03, TC-04, TC-06, TC-07 | DESIGN EVIDENCE ONLY | Approved RPO/RTO/retention and independently witnessed full restore |
| ECR-11 Security/test evidence | All six | SPECIFIED — NOT EXECUTED | Threat-to-control mapping, negative tests, independent review and defect closure |
| ECR-12 Synthetic spike | Selected bounded components | NOT AUTHORIZED | Separate approved scope, environment, budget, fixtures, test plan and stop conditions |

The ECR status labels above are preserved from the existing WP-03 register; this assessment does not mark any request closed.

## 6. Recommended order of evidence closure

1. **Resolve source authority first:** complete ECR-01 or obtain the required authorized disposition. Do not score guide-derived assumptions before that.
2. **Acquire real pilot inputs:** complete ECR-02 and ECR-03 through Phase 0 partner/site evidence; keep every unsupported quantity UNKNOWN.
3. **Set legal and data boundaries:** complete ECR-04 before choosing identity, database, storage, telemetry or provider regions.
4. **Obtain exact provider terms:** complete ECR-05 for exact candidate plans and regions; public feature pages are insufficient.
5. **Confirm people and economics:** complete ECR-06 and ECR-07 before comparing managed versus self-managed approaches.
6. **Approve recovery and retention:** complete ECR-08 and then demonstrate full database-plus-object recovery.
7. **Prepare independent test evidence:** complete ECR-11; do not treat written test scenarios as executed results.
8. **Only then consider a bounded synthetic spike:** ECR-12 requires separate explicit authorization. A readiness assessment does not grant it.

ADR-0002 topology review and ADR-0001 technology selection remain decisions for their authorised owners after the required evidence and independent review.

## 7. Conclusion

The current candidate set is sufficiently developed for targeted evidence requests, not for technology selection. The six P0 components have source-derived requirements and initial candidate capability snapshots, but critical evidence is missing across workload, source authority, legal/privacy, provider terms, recovery, security testing, staffing and TCO.

**No component receives a numeric score. No stack is selected. No spike, provisioning, migration or production implementation is authorised.**

## 8. Source register

- [WP-03 component evidence pack 01 — data, identity, authorisation and private files](wp03-component-evidence-pack-01-data-identity-authorisation-storage.md)
- [WP-03 component evidence pack 02 — frontend, application runtime and workers](wp03-component-evidence-pack-02-frontend-runtime-workers.md)
- [WP-03 component evidence pack 03 — hosting, CI, recovery, offline and portability](wp03-component-evidence-pack-03-hosting-ci-recovery-offline-portability.md)
- [WP-03 candidate evidence register](../decisions/wp03-candidate-evidence-register.md)
- [Technology decision requirements baseline](technology-decision-requirements-baseline.md)
- [Technology workload, operating and TCO assumptions register](../decisions/technology-workload-and-tco-assumptions-register.md)
- [WP-03 evidence closure request register](../delivery/wp03-evidence-closure-request-register.md)
- [ADR-0001 — Technology baseline](../decisions/ADR-0001-technology-baseline.md)
- [ADR-0002 — Application topology](../decisions/ADR-0002-application-topology.md)
