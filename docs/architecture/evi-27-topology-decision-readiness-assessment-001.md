# EVI-27 — ADR-0002 topology decision readiness assessment 001

**Review date:** 21 November 2026  
**Evidence item:** EVI-27 — Record the authorised topology decision in ADR-0002  
**Assessment status:** IN PROGRESS — preliminary comparison exists; decision gate not ready to close  
**ADR status:** OPEN — no logical/deployable topology selected  
**Scope:** Phygital Export Marketplace only

## 1. Executive finding

The repository contains a substantive source-derived topology assessment in `docs/architecture/wp04-application-topology-assessment.md`. It compares three alternatives: integrated full-stack managed platform, modular monolith with replaceable service boundaries, and distributed microservices.

The assessment identifies Option B as the most proportionate **conditional logical direction** for a controlled pilot, based on current product/workflow requirements and the Technical Development Manual v3.0 modular-monolith-first principle. It does not select a framework, database provider, identity provider, hosting provider, queue, worker vendor or physical deployment topology.

The existing assessment is a sound starting point, but it does **not** satisfy EVI-27's closure test. Critical workload, connectivity, operating capacity, cost, recovery and candidate-specific evidence remain UNKNOWN or unvalidated. Independent review and an authorised ADR-0002 decision are also outstanding.

**Disposition:** Keep Option B as a conditional logical candidate for review. Keep ADR-0002 OPEN. Do not provision infrastructure or implement a selected topology on this basis.

## 2. Authority and source hierarchy

1. **Concept Paper v1.1** — strategic authority and staged pilot ambition; draft for partner discussion.
2. **Technical Development Manual v3.0** — supporting technical/operational plan; explicitly proposes modular-monolith-first, but does not select a production stack or topology.
3. **018-A sponsor decisions D-01 to D-07** — approved with conditions; define platform, seller/exporter, hub, listing/batch, quotation/order, allocation and payment boundaries.
4. **024-A–G** — product, identity/authority, workflow, information, API, interface, security and test requirements; design specifications, not implementation evidence.
5. **TSBBF v1.0** — component-level evidence-based build/buy/reuse and candidate comparison.
6. **AADDG v1.0** — source repository, backend/deployment separation, reproducibility, secrets, release, worker, backup and recovery operating constraints.
7. **Phase 0 evidence and operational records** — validate assumptions; do not invent missing evidence.

## 3. Alternatives and current comparison

| Alternative | Current assessment | Disposition |
|---|---|---|
| A — Integrated full-stack managed platform | Could reduce initial integration seams, but component coupling, privileged credentials, storage/backup separation, runtime limits, commercial terms and exit need candidate-specific evidence. | Credible comparison class; not selected. |
| B — Modular monolith with replaceable service boundary | Supports relational transaction boundaries, central policy evaluation, replaceable provider adapters, one primary deployment and proportionate operating burden. Requires disciplined module boundaries and tested recovery. | Conditional logical direction only; not approved. |
| C — Distributed microservices | Adds network failure, distributed authorization, event consistency, idempotency, observability and staffing burdens without demonstrated independent scaling or isolation needs. | Not justified by current evidence; do not build by default. Revisit only on measured triggers. |

The comparison is qualitative and source-derived. It is not a completed candidate-specific TSBBF scorecard or validated workload/cost comparison.

## 4. Requirements coverage and evidence status

| Topology dimension | Existing evidence/design | Remaining evidence gap |
|---|---|---|
| Pilot scope and demand | Concept Paper v1.1 describes one commodity, one hub and limited producers/buyers. | Actual commodity, hub, actors, order volume, concurrency, transaction rates and file volumes remain unconfirmed. |
| Transaction/data integrity | Manual v3.0; 024-B/C; 018-A; inventory and batch-ledger controls. | Validate concurrency and workload assumptions against actual pilot volumes; no production database selected. |
| Identity and trust boundaries | 024-A and 024-F specify organisation-scoped authority, least privilege, tenant isolation and private evidence. | Candidate-specific security/identity/storage tests and legal/data-location evidence remain outstanding. |
| API and integrations | 024-D defines logical contracts and replaceable provider boundaries. | No final API runtime, provider contract, live integration or deployment model selected. |
| Offline and connectivity | Offline architecture specifies server-authoritative sync, idempotency and conflict controls. | Hub/site network measurements, devices, offline duration/frequency and shared-device profile remain UNKNOWN. |
| Background work | WP04 proposes database-backed job/outbox initially; worker/queue conditional on measured need. | Runtime limits, durable execution tests, retry/dead-letter behaviour, operator ownership and candidate limits not evidenced. |
| Operations and staffing | AADDG and repository operations notes define lifecycle controls. | Named maintainer, support coverage, incident response, release operator and backup/restore owner remain UNKNOWN. |
| Security/privacy | 024-F defines threat, privacy and abuse-control requirements. | Independent review and candidate-specific test evidence are not complete. |
| Recovery and resilience | WP04 identifies backup/restore and rollback as topology requirements. | No backup capability is claimed; RPO/RTO, retention, restore procedure and witnessed restore evidence remain outstanding under EVI-29. |
| Portability and exit | TSBBF and AADDG require reproducible source, export/restore and exit capability. | Candidate-specific export, restore, replacement effort, commercial restrictions and exit cost are not demonstrated. |
| Cost and commercial terms | Technology workload/TCO register and TSBBF establish comparison method. | Workload, prices, bandwidth/egress, plan limits, staffing and 12/24/36-month TCO remain UNKNOWN; no candidate scored. |
| Decision authority | ADR-0002 exists and remains OPEN. | Independent challenge and explicit authorised decision are absent. |

## 5. EVI-25 source-recovery correction

Prior project context records a draft titled “Phygital Export Marketplace: Developer Guide”, Version 0.1, dated 17 November 2026 and prepared for Actify Inc.; however, its complete original content and source attachment have not been recovered. No technology stack is attributed to that guide. Prototype v0.1/v0.2 artefacts are separate and must not be confused with it.

Any integrated-platform candidate must be assessed from independently identified products/components and current evidence. The missing guide is a source-provenance gap; it is not evidence for a Next.js/Supabase/Vercel bundle.

## 6. Closure blockers

EVI-27 cannot be accepted until the following are evidenced or formally dispositioned:

1. Validated pilot scope and workload assumptions: participants, transactions, concurrency, files, growth and peak usage.
2. Hub/device/connectivity profile: measured bandwidth/latency, offline duration, devices, shared-device risk and local operating constraints.
3. Candidate-neutral logical/data/trust boundaries reconciled against 024-A–G and 018-A.
4. Candidate-specific deployment/runtime evidence, including web/API boundary, durable work, worker necessity, runtime limits and operational isolation.
5. Security/privacy and legal review covering identity, data location, access, retention, private files and provider processing.
6. Backup/recovery design with approved objectives and a tested, witnessed restore path (linked to EVI-29).
7. Comparable candidate cost, licensing, bandwidth/egress, support, maintenance, portability and exit evidence.
8. Named accountable operations and maintenance roles, support and incident arrangements.
9. Independent architecture/security/operations review.
10. An authorised ADR-0002 decision recording accepted/rejected alternatives, conditions, risks, ownership, review triggers and exit/rollback.

EVI-25 source authority is a dependency for any guide-dependent comparison, but it does not justify attributing a stack to the missing guide or prevent candidate-neutral logical analysis.

## 7. Recommended next work

- Correct WP04's unsupported Developer Guide stack attribution.
- Preserve Option B as a conditional logical direction, not a decision.
- Close evidence inputs in parallel where independent: workload/connectivity (ECR-02/ECR-03), operations capacity (ECR-06), cost/TCO (ECR-07), security/privacy (ECR-11), recovery (ECR-08/EVI-29), and source authority (EVI-25).
- Prepare a candidate-neutral architecture diagram and deployment/data/trust-boundary matrix.
- Do not finalize ADR-0002 until the evidence and independent review are complete.
- Do not finalize ADR-0001 until ADR-0002 is authorised.

## 8. Explicit boundaries

This assessment does not select Option B or any other topology for implementation. It does not approve any framework, provider, hosting platform, identity provider, queue or worker vendor. It does not authorize procurement, provider accounts, infrastructure, migrations, real participant data, production deployment, live integrations, live trade, custody, funds or shipment.

**Current disposition:** EVI-27 IN PROGRESS; ADR-0002 OPEN; Option B conditional only.
