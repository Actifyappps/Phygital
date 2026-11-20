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

1. Recover the canonical Phygital Developer Guide v0.1 dated 17 November 2026, including complete content and stable source location.
2. Reconcile it clause-by-clause with Concept Paper v1.1 (strategic authority) and Technical Development Manual v3.0 (supporting implementation plan).
3. Verify the current AADDG v1.0 and TSBBF v1.0 source versions.
4. Confirm the AADDG web/ versus src/ convention against the repository; do not let folder layout determine framework choice.
5. Confirm the programme's authorised technology/topology decision route without inventing role-holders.

**Output:** source/version reconciliation note and explicit disposition of conflicting or unrecovered sources.

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

Record known values or mark UNKNOWN for:
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
