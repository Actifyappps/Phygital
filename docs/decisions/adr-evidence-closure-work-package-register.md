# ADR-0001 / ADR-0002 evidence-closure work-package register

**Review date:** 20 November 2026  
**Status:** Decision-preparation plan only. No technology, vendor, topology, procurement, environment or implementation is approved.

## 1. Purpose and current position

This register sequences the existing technology component inventory, TSBBF workbook, ADRs and synthetic spike plan. It avoids duplicating those artefacts and prevents candidate descriptions from being mistaken for decisions.

| Item | Current position |
|---|---|
| ADR-0001 technology baseline | OPEN; no stack or component selected |
| ADR-0002 application topology | OPEN; modular-monolith-first is a candidate logical shape only |
| Candidate A | Next.js + Supabase/PostgreSQL/Auth/Storage + Vercel is described in the referenced Developer Guide v0.1; canonical source not recovered |
| Candidate B | Web client + NestJS/Express + managed PostgreSQL + private object storage + governed workers/deployment is described across Technical Development Manual v3.0; components unassessed |
| Candidate C | Component-level hybrid is a comparison hypothesis, not a recommendation |
| TSBBF workbook | Blank; no numeric scores or shortlist |
| Synthetic spike | 18-test plan prepared; not authorised or executed |
| Repository structure | Technology-neutral; folder names do not select frameworks or runtime boundaries |

Candidate A/B/C are hypotheses only. Candidate A must not be scored until its canonical source is recovered or formally dispositioned.

## 2. Ordered evidence work packages

### WP-00 — Source integrity and authority

1. Recover the canonical Phygital Developer Guide v0.1 dated 17 November 2026, including complete content and stable source location. Targeted Notion searches for “Phygital Developer Guide”, “Developer Guide v0.1 17 November” and the stated Next.js/Supabase/Vercel candidate wording returned no canonical guide page. The current Project Home history does mention a cross-document review of the Developer Guide, but the retrieved page does not expose a direct canonical guide link. This confirms a source-recovery gap, not that the guide never existed.
2. Reconcile it clause-by-clause with Concept Paper v1.1 (strategic authority) and Technical Development Manual v3.0 (supporting implementation plan).
3. Verify the current AADDG v1.0 and TSBBF v1.0 source versions. **Closed 20 November 2026:** both full source texts were recovered from the Actify Library and inspected; see [Actify technology standards — source verification record](actify-technology-standards-source-verification.md). TSBBF v1.0 ratification date (31 October 2026), score weights, score bands and critical-risk veto were confirmed. AADDG v1.0 Level 1 worker, hosting, repository, private-storage, webhook, offline, backup and release controls were confirmed. AADDG source body did not expose a ratification date; none is inferred.
4. Confirm the AADDG web/ versus src/ convention against the repository; do not let folder layout determine framework choice.
5. Confirm the programme's authorised technology/topology decision route without inventing role-holders.

**Output:** source/version reconciliation note and explicit disposition of conflicting or unrecovered sources. **WP-00 partial closure:** TSBBF and AADDG source verification is complete; Developer Guide v0.1 recovery/disposition remains open, so Candidate A remains unscorable.

**Gate:** Until Candidate A's source is recovered or formally dispositioned, its description remains provisional and it is not scoreable. Technology-neutral requirements work may continue.

### WP-01 — Freeze a comparable requirements baseline

Use the current source IDs and preserve the distinctions below:

| Requirement group | Governing source | Minimum assessment content |
|---|---|---|
| Authority and organisation isolation | 024-A; 018-A D-01–D-03 | Tenant isolation, roles/mandates, seller/exporter separation, hub service-only boundary |
| Workflow and transaction integrity | 024-B; 018-A D-04–D-07 | Quote acceptance, immutable commercial snapshot, reservation/concurrency, no implied custody or movement |
| Data and lineage | 024-C; 018-C | Entity ownership, relationships, quantity/money precision, audit, provenance and integrity invariants |
| API and integrations | 024-D | 65 logical operations, 77 candidate events, API-OD-01–12, idempotency and provider boundaries; protocol remains open |
| User experience | 024-E | Six surfaces, low-bandwidth, accessibility, language and assisted-device needs |
| Security and privacy | 024-F | Tenant isolation, least privilege, revocation, private evidence, abuse and offline threats |
| Quality and acceptance | 024-G | QAT-001–QAT-036, test levels, evidence and independent review |
| Delivery and operations | AADDG; 024-H gap assessment | Environments, build/release, secrets, monitoring, backup/restore, incident and support |
| Product/pilot maturity | Concept Paper v1.1; Phase 0 work map | Baseline versus deferred capabilities and stage gates |

**Output:** versioned requirements baseline with source IDs, priority, verification method and unknowns. Assess every candidate against the same baseline; missing evidence is UNKNOWN, not a pass.

### WP-02 — Workload, operating and cost assumptions

Use [technology-workload-and-tco-assumptions-register.md](technology-workload-and-tco-assumptions-register.md). It deliberately leaves all unvalidated figures UNKNOWN and defines the evidence needed for:

**Source-derived planning constraints already available:** Deliverable 003 defines one commodity, one hub and a limited participant group as the intended pilot shape, but does not validate numeric volumes, budget or unit economics. Deliverable 010 sets a digital-coordination-site baseline; no facility, permission, staffing or connectivity capacity is confirmed. Deliverable 013 contains validation instruments, not completed buyer/producer measurements. Deliverable 020 records no selected route and says Level 1 is the only route that can be prepared without further external evidence. The linked evidence and exact implications are recorded in the technology workload/TCO assumptions register. Do not infer numeric loads from these planning statements.


- pilot users, organisations, concurrency and role mix;
- listings, batches, measurements, file sizes, document retention and audit volume;
- enquiries, quotations, orders, provider callbacks and background jobs;
- hub connectivity, shared devices, offline duration, sync frequency and data cost;
- geography, data-location constraints, language and accessibility needs;
- skills, support capacity and accountable maintenance roles;
- low/base/high traffic, storage, egress, worker and notification assumptions;
- 12/24/36-month setup, subscription, usage, support, maintenance, backup, recovery and exit costs.

**Acceptance:** Every number has a dated source, accountable owner or explicit uncertainty label. Vendor pricing, quotas and free-tier terms must be checked against current applicable terms.

### WP-03 — Component-level TSBBF evidence packs

Start with the P0 components in the existing technology component register:

- TC-01 frontend; TC-02 API/application runtime; TC-03 relational database;
- TC-04 identity; TC-05 authorisation; TC-06 private object storage;
- TC-07 workers; TC-09 hosting/deployment; TC-10 CI/build;
- TC-12 backup/restore; TC-13 offline/synchronisation; TC-24 portability/exit.

For each material component:
1. identify at least two credible alternatives where a genuine choice exists;
2. verify version/lifecycle, licence and commercial-use terms;
3. verify data region, subprocessors, security, privacy and access controls;
4. obtain evidence for export/import, backup/restore and exit;
5. record quotas, overages, throttling, suspension, support and upgrade consequences;
6. estimate operator effort, maintenance burden and low/base/high TCO;
7. document dependencies and failure modes;
8. complete a separate TSBBF workbook cover sheet and evidence-backed scorecard.

Retain the TSBBF v1.0 weights: functional fit 20%; portability/exit 15%; security/privacy 15%; reliability/maintenance 15%; TCO 15%; licence/commercial fit 10%; integration/scalability 5%; ease of operation 5%.

**Scoring discipline:** score 1–5 only where evidence supports it. Use UNKNOWN when evidence is absent. A critical unknown makes the candidate INCOMPLETE — NOT SCORABLE. Critical security, legal, privacy, recovery or continuity risks block approval regardless of weighted score.

P1 components (queues/events, observability, notifications, payment-status adapters, inspection/lab evidence, malware inspection and analytics) must be assessed before complete pilot architecture approval. P2/deferred capabilities remain phase-gated.

**WP-03 progress — first component pack completed (20 November 2026):** [WP-03 component evidence pack 01 — data, identity, authorisation and private files](../architecture/wp03-component-evidence-pack-01-data-identity-authorisation-storage.md) defines source-derived requirements, candidate classes, evidence questions and minimum synthetic acceptance tests for TC-03–TC-06. This is an assessment specification only: all four components remain INCOMPLETE — NOT SCORABLE; no provider has been evaluated or selected. Remaining P0 components are scheduled in subsequent packs.

**WP-03 progress — second component pack completed (20 November 2026):** [WP-03 component evidence pack 02 — frontend, application runtime and workers](../architecture/wp03-component-evidence-pack-02-frontend-runtime-workers.md) defines source-derived requirements, candidate classes, evidence questions and minimum synthetic acceptance tests for TC-01, TC-02 and TC-07. All three remain INCOMPLETE — NOT SCORABLE; no candidate has been evaluated or selected.

**WP-03 progress — third component pack completed (20 November 2026):** [WP-03 component evidence pack 03 — hosting, CI, recovery, offline and portability](../architecture/wp03-component-evidence-pack-03-hosting-ci-recovery-offline-portability.md) defines evidence requirements and minimum synthetic acceptance tests for TC-09, TC-10, TC-12, TC-13 and TC-24. All remain INCOMPLETE — NOT SCORABLE. Packs 01–03 now cover the P0 evidence briefs except TC-08 (P1; not a P0 spike prerequisite).

**WP-03 candidate evidence progress (20 November 2026):** [TC-03 relational database — initial provider evidence snapshot](database-candidate-evidence-snapshot-2026-11-20.md) captures official public-source facts for Supabase Postgres, Neon Postgres and Render Postgres. It records current pricing/region/backup/security observations and candidate-specific unknowns. All three remain EVIDENCE STARTED — NOT SCORABLE; no shortlist or ranking has been made. Provider-specific legal/DPA, workload/TCO, restore and synthetic-test evidence remains outstanding.

**WP-03 candidate evidence progress — TC-04 (20 November 2026):** [TC-04 identity and authentication — initial provider evidence snapshot](identity-candidate-evidence-snapshot-2026-11-20.md) records official public-source facts for Supabase Auth, Clerk, Auth0 and Keycloak. All remain EVIDENCE STARTED — NOT SCORABLE; no identity provider has been shortlisted or selected. Data residency, DPA, scenario pricing, identity export, session-revocation and operational evidence remain outstanding.

**WP-03 candidate evidence progress — TC-05 (20 November 2026):** [TC-05 authorisation and policy enforcement — initial evidence snapshot](authorization-candidate-evidence-snapshot-2026-11-20.md) records public-source evidence for application policy + PostgreSQL RLS, OpenFGA and OPA. All remain EVIDENCE STARTED — NOT SCORABLE. The canonical Phygital authority tuple remains the governing source; no policy engine or permission grant is approved.

**WP-03 candidate evidence progress — TC-06 (20 November 2026):** [TC-06 private object and document storage — initial provider evidence snapshot](storage-candidate-evidence-snapshot-2026-11-20.md) records public-source evidence for Supabase Storage, Cloudflare R2 and Amazon S3. All remain EVIDENCE STARTED — NOT SCORABLE. Notable constraints include Supabase object blobs requiring separate backup, Cloudflare APAC location hints not guaranteeing residency and no S3 Object Lock support, and Amazon S3's configurable versioning/Object Lock with added complexity and cost. No storage provider is shortlisted or approved.

**WP-03 candidate evidence progress — TC-01, TC-02 and TC-07 (20 November 2026):** [Initial frontend, runtime and worker evidence snapshot](frontend-runtime-worker-candidate-evidence-snapshot-2026-11-20.md) records current public-source facts for Next.js, React+Vite, NestJS, Express 5, PostgreSQL outbox workers, Supabase Queues, Cloudflare Queues and Render workers/Workflows. All remain EVIDENCE STARTED — NOT SCORABLE. The canonical Developer Guide gap remains open; NestJS 12's Node compatibility table requires resolution; Supabase Queues is currently labelled Public Alpha; and queue delivery semantics remain subject to idempotent handling.

**WP-03 candidate evidence progress — TC-09 and TC-10 (20 November 2026):** [Hosting, deployment and CI evidence snapshot](hosting-ci-candidate-evidence-snapshot-2026-11-20.md) records public-source facts for Vercel, Cloudflare Pages/Workers, Render and GitHub Actions. All remain EVIDENCE STARTED — NOT SCORABLE. Vercel Hobby is non-commercial; Cloudflare and Vercel function/runtime constraints and regional placement need workload tests; GitHub Actions entitlements depend on the repository owner's plan.

**WP-03 candidate evidence progress — TC-12, TC-13 and TC-24 (20 November 2026):** [Recovery, offline and portability evidence snapshot](recovery-offline-portability-evidence-snapshot-2026-11-20.md) reconciles current provider backup windows, PostgreSQL export/restore semantics and browser persistence limits. It confirms that Supabase database backups exclude Storage object blobs, Neon history/restore is branch-scoped, Render PITR windows depend on workspace plan, browser storage is best-effort by default, and Background Sync is not available in Safari/Firefox. All patterns remain unscored; no RPO/RTO or offline implementation is approved.

**WP-03 consolidated status (20 November 2026):** [WP-03 candidate evidence register](wp03-candidate-evidence-register.md) consolidates the initial candidate set across the P0 components, with source snapshot links, explicit evidence states and cross-cutting blockers. Public-source research has started across database, identity, authorisation, storage, frontend, runtime, workers, hosting, CI, recovery, offline and portability. No candidate is READY FOR SCORING; no score, shortlist or selection is recorded. The main blockers are the unrecovered Developer Guide v0.1, unvalidated Phase 0 workload/TCO, incomplete DPA/subprocessor/region evidence, unproven restore/exit and unexecuted candidate tests.

### WP-04 — Resolve topology independently (ADR-0002)

Produce:
- logical component and trust-boundary diagram;
- deployable runtime inventory and reason for each runtime;
- domain/module ownership and transaction boundaries;
- web-surface/API relationships;
- worker, queue, scheduler and webhook responsibilities;
- private file/evidence lifecycle and access model;
- environment, secrets, release and rollback model;
- observability, incident, backup and restore model;
- workload, bandwidth, cost and portability assumptions;
- operating responsibilities or explicit unassigned-role blockers.

Compare modular monolith, separately deployed workers and any alternative against the same workload and operating requirements. Do not create microservices merely because folders are separate. ADR-0002 remains OPEN if evidence or ownership is insufficient.

### WP-05 — Synthetic comparison spike

Use the existing SPIKE-01–SPIKE-18 plan; do not create a parallel test catalogue.

Entry conditions:
- WP-00 source gate satisfied or formally dispositioned;
- WP-01 baseline approved for the spike;
- candidate evidence sufficient to justify testing;
- scope, budget, operator, owner, independent reviewer and stop conditions named;
- explicitly authorised isolated environment and synthetic data only;
- no production or live-provider credentials;
- approved fixtures, privacy/security handling, teardown and cost limits.

Retain commit SHA, exact commands, versions, configurations, raw results, defects, retests, cost observations and independent review. Another reviewer must reproduce the build/tests and challenge the relevant authority, concurrency, private-file, QR, callback, offline, observability, recovery and portability evidence. A demo or local assertion is not acceptance.

### WP-06 — Governance decision and implementation handoff

The decision package must include completed scorecards, evidence links, alternatives/rejections, workload and TCO assumptions, critical-risk disposition, spike report, independent review, selected topology/runtime inventory, operating ownership, conditions, review trigger and exit plan.

Only authorised programme/product governance may approve ADR-0001/0002. ADR closure does not authorise migrations, live providers or live trade.

## 3. Sequence and dependencies

| Order | Work package | Can proceed now? | Blocks |
|---:|---|---|---|
| 1 | WP-00 source integrity | Yes; recovery remains outstanding | Formal scoring of Candidate A |
| 2 | WP-01 requirements baseline | Yes | Fair comparison if incomplete |
| 3 | WP-02 workload/cost assumptions | Yes, with unknowns visible | Credible capacity/TCO comparison |
| 4 | WP-03 component evidence | Prepare evidence questions now; score only when substantiated | TSBBF shortlist |
| 5 | WP-04 topology assessment | Logical analysis can proceed | ADR-0002 closure |
| 6 | WP-05 spike | No; separate approval required | Empirical candidate selection |
| 7 | WP-06 decision handoff | No; evidence/review required | ADR closure |

WP-01 and WP-02 can proceed in parallel. WP-03 may prepare evidence templates while WP-00 remains open, but may not score the unverified Candidate A. WP-04 can map topology requirements without selecting a vendor.

## 4. Roles and separation of duties

| Role | Responsibility | Current state |
|---|---|---|
| Programme/product decision owner | Approves scope, cost, technology and topology | Authorised role-holder not recorded |
| Architecture assessor | Requirements, alternatives and technical evidence | To be assigned |
| Security/privacy reviewer | Challenges security, privacy and critical risks | To be assigned |
| Operations/cost assessor | Validates support, recovery and TCO | To be assigned |
| Independent spike reviewer | Reproduces and challenges test evidence | To be assigned |

This record appoints nobody. Approval and independent-review evidence must be explicit.

## 5. Non-negotiable controls

- Keep domain models, logical data and API contracts technology-neutral until the relevant ADRs are approved.
- Do not add framework-specific production dependencies to make a candidate appear selected.
- No production backend, database, hosting, CI runtime or worker service is provisioned by this plan.
- Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**.
- EVI-21 remains **OPEN / Closure Accepted = NO**; DEF-L1-001 and DEF-L1-002 remain **OPEN**.
- No live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment is authorised.
- No connected devices, blockchain, automated customs/regulatory clearance, AI forecasting or automated advisories are activated by this plan.

## 6. Completion reporting

Every update records source/version reviewed, artefacts changed, evidence acquired, unknowns/blockers, reviewer, commit SHA and gate changes. Distinguish planned, documented, tested, independently reviewed and approved states. Documentation alone never promotes a test or approval state.

## 7. Current disposition

ADR-0001 and ADR-0002 remain OPEN. Candidate scores remain blank. Developer Guide v0.1 canonical source remains unrecovered in targeted Notion/Library search. The synthetic spike remains a plan, not an authorised execution. All migration, EVI-21 and live-operation restrictions remain unchanged.
