# Engineering governance and build-standard crosswalk

**Review date:** 20 November 2026  
**Scope:** Actify TSBBF v1.0 and AADDG v1.0 as applied to Phygital, reconciled with Concept Paper v1.1, Technical Development Manual v3.0, the referenced Developer Guide v0.1 and the current repository.  
**Status:** Governance crosswalk only. It is not a technology selection, implementation approval, deployment authorisation or production-readiness statement.

## 1. Authority hierarchy

1. **Concept Paper v1.1** remains the strategic authority for vision, four staged technology pillars, operating model and rollout.
2. **TSBBF v1.0** governs evidence-based technology selection and build-versus-buy. It does not select a stack by itself.
3. **AADDG v1.0**, including Level 1 extensions, governs engineering lifecycle and operating controls across repository, backend, deployment, workers and physical/edge interfaces. It does not mandate Supabase or Vercel.
4. **Technical Development Manual v3.0** is a supporting implementation plan. Its modular-monolith-first shape is a candidate logical design, not an approved framework or hosting topology.
5. **Developer Guide v0.1 (17 Nov 2026)** is referenced as a Next.js/Vercel + Supabase/PostgreSQL/Auth/RLS/private-storage candidate. Its canonical source artifact was not recovered in targeted Notion/Library search. Treat this description as provisional until its exact source and version are verified.
6. **024-A–G** provide technology-neutral product, workflow, data, API, screen, security and quality requirements. They do not approve vendors, migrations or production operation.
7. **ADR-0001 and ADR-0002** record project-specific decisions and remain OPEN.

## 2. Source-to-repository disposition

| Source | Repository home | Represented | Still open |
|---|---|---|---|
| TSBBF v1.0 — Actify Library record `libfile_c1f71b07c484819181b906a75b43db1a` | `docs/delivery/actify-engineering-operating-standards.md`; `docs/architecture/technology-decision-status.md`; ADR-0001 | Reuse-before-buy preference; weighted component scorecard; critical-risk blockers; portability, TCO, licensing, support and exit considerations | No completed candidate scorecards or authorised stack decision |
| AADDG v1.0 — Actify Library record `libfile_0ac4413eec74819185ffbb384ab85a3a` | `docs/delivery/actify-engineering-operating-standards.md`; delivery/security/quality docs; ADR-0002 | GitHub source-of-truth; PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY; reproducibility, secrets, workers, Level 1 physical-digital, offline, webhook, financial, observability and recovery controls | No production backend/deployment selected or provisioned; controls remain requirements until implemented and evidenced |
| Concept Paper v1.1 | `docs/architecture/technical-development-manual-v3-crosswalk.md` and phase-gate/domain docs | Four staged pillars and baseline/deferred capability boundaries | Partner, legal, commercial, operational and evidence gates |
| Technical Development Manual v3.0 | `docs/architecture/technical-development-manual-v3-crosswalk.md`; technology status | Modular-monolith-first logical candidate; domain/data/API/offline/passport/financial/worker requirements | NestJS/Express/managed PostgreSQL candidates not selected |
| Developer Guide v0.1 | Technology status; ADR-0001 | Provisional competing candidate recorded to prevent silent loss | Canonical artifact not recovered; exact content/version must be checked before formal scoring |
| ADR-0001 / ADR-0002 | `docs/decisions/ADR-0001-technology-baseline.md`; `docs/decisions/ADR-0002-application-topology.md` | Decision questions, constraints and closure evidence | Both OPEN |

The Actify Library identifiers are source references already recorded in the project source register. This crosswalk does not claim the underlying Library files were newly fetched in this review.

## 3. Candidate architecture conflict — do not guess

| Concern | Technical Development Manual v3.0 | Developer Guide v0.1 reference | Required treatment |
|---|---|---|---|
| Application shape | Modular monolith first | Next.js-oriented full-stack candidate | Compare product fit and operational complexity; avoid premature microservices |
| Framework/runtime | API/application layer with NestJS/Express candidates | Next.js | Score frontend and backend concerns separately; verify source before scoring |
| Data/backend | Managed PostgreSQL and private file storage | Supabase/PostgreSQL/Auth/RLS/private storage | Compare RLS/authorization, backup, portability, data location and TCO |
| Deployment | Not finally selected | Vercel candidate | Compare commercial terms, bandwidth/media economics, runtime limits, worker support, rollback and exit |
| Repository convention | Current `web/`, `packages/`, `workers/` and technology-neutral homes | AADDG convention includes a `web/` vs `src/` question | Keep current logical structure; resolve naming through ADR, not inference |

No row is a decision. Directory names and candidate folders do not establish framework, ORM, backend, database provider, host or deployment topology.

## 4. TSBBF component-level decision protocol

Assess components separately: frontend/runtime; API/application framework; relational database/data access; identity; private object storage; worker/queue/scheduler; frontend/API hosting; observability; backup/restore; payment/messaging/logistics/laboratory providers; developer tooling and CI/CD.

| Criterion | Weight |
|---|---:|
| Functional fit | 20% |
| Data portability and exit | 15% |
| Security and privacy | 15% |
| Reliability and maintenance | 15% |
| Total cost of ownership | 15% |
| Licence and commercial fit | 10% |
| Integration and scalability | 5% |
| Ease of operation | 5% |
| **Total** | **100%** |

Score 1–5; weighted result = `Σ(score × weight) ÷ 5`. 80–100 is a shortlist for practical testing/cost verification; 65–79 requires investigation or improved terms; below 65 should not be adopted without compelling documented rationale. A critical unresolved security, legal, privacy, data-recovery or continuity risk blocks approval regardless of score.

Evidence includes data export/import and relationship portability; free-tier quotas, overage and suspension behaviour; maintainer/support and upgrade path; data location, subprocessors, retention and deletion; licence/commercial-use terms; setup/migration/maintenance/security/exit costs; first-year and 24–36-month TCO assumptions; backup/restore, rollback and exit; skills and a reversible pilot with acceptance criteria. Unknown evidence must remain marked unknown, not scored optimistically.

## 5. AADDG lifecycle and Level 1 obligations

The recorded lifecycle is:

`PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY`

A meaningful change needs traceable requirement/decision authority, committed source, reproducible configuration/build, appropriate tests (including negative/security tests), review/acceptance evidence and an authorised environment. Code written is not code committed; deployment success is not feature correctness; a demo is not production readiness.

Phygital Level 1 requirements include:
- one authoritative GitHub repository by default, governing web/admin surfaces, workers, migrations, tests and documentation together unless an ADR justifies a split;
- backend/deployment configuration reproducible from version-controlled source; no dashboard-only schema/RLS/function drift;
- secrets excluded from source and client bundles; example environment files contain variable names, never secret values;
- workers, schedules, webhook consumers, PDF/QR generation and physical/edge bridges treated as first-class components with ownership, credentials, logs, retries, dead-letter handling and tests;
- non-sequential or cryptographically protected public physical identifiers; attributable, timestamped append-only scan/intake/handover events;
- offline queues with actor/device provenance, idempotency, conflict handling and server-side revalidation; offline mode does not grant stale authority;
- private trade documents with authorization-checked access and short-lived scoped delivery links;
- append-only financial/provider event histories, authenticated/replay-resistant webhooks, idempotent processing and trusted-backend pricing/fee calculations;
- structured logs/correlation IDs, safe retry, verified backups, restore rehearsal and rollback procedures.

These are requirements to implement and test, not claims that controls exist in a running system.

## 6. Sponsor and readiness boundaries remain controlling

Engineering standards cannot create legal or operational authority:
- platform coordinator only; no default seller/payee and no platform-held funds or escrow;
- seller and exporter capacities are distinct and independently evidenced/authorised;
- hub service-only; no implied custody, title, stock holding, release or dispatch;
- pilot begins with one batch; any later multi-batch design must prevent over-allocation and preserve traceability;
- one accepted quotation per pilot order, with order items linked to accepted quote lines and immutable commercial snapshot;
- allocation is reservation only, not physical movement or dispatch;
- direct buyer-to-seller payment; platform records instructions, provider references, verified events/status and reconciliation only.

Migration 001 remains HOLD. Migration 002 is NOT AUTHORISED. EVI-21 remains OPEN and Closure Accepted = NO. No live trade, custody, platform-held funds, escrow, live payment integration, dispatch or shipment is authorised by this crosswalk.

## 7. Repository and implementation sequencing

Keep the existing `web/`, `packages/domain/`, `workers/`, `supabase/candidates/`, `tests/`, `evidence/` and `docs/` organization technology-neutral until ADRs are approved. Do not:
- introduce framework-specific production dependencies solely because a candidate guide names a framework;
- mix domain model definitions with ORM/framework persistence models;
- promote candidate migration SQL from the HOLD area;
- provision production services or deploy merely because AADDG defines a lifecycle.

Decision sequence:
1. Recover and verify Developer Guide v0.1 exact artifact/version.
2. Confirm Concept Paper, Manual and sponsor constraints.
3. Inventory components, workload/bandwidth assumptions, skills and operating responsibilities.
4. Complete component-level TSBBF scorecards and risk/exit evidence.
5. Resolve ADR-0001 technology baseline and ADR-0002 application topology.
6. Resolve dependent identity, storage, integration, offline and physical-digital ADRs.
7. Authorise a reversible synthetic-data technical spike with acceptance criteria.
8. Review build/test evidence and costs before considering a separately authorised pilot environment.

## 8. Open evidence register

| Item | State | Required next evidence |
|---|---|---|
| Developer Guide v0.1 | Source not recovered in targeted Notion/Library search | Exact file/page, version, author, status and canonical location |
| TSBBF scorecards | Not evidenced complete | Component alternatives, evidence links, cost/risk/exit analysis and decision owner |
| Stack/topology | ADR-0001/0002 OPEN | Approved project-specific ADRs |
| `web/` vs `src/` | Open | Repository convention decision after stack-independent review |
| Runtime/provider provisioning | Not evidenced | Approved environments, contracts, configuration and access controls |
| Build/test/release | No production runtime established by this crosswalk | Reproducible spike, test evidence, review and authorised acceptance |
| Migrations | Migration 001 HOLD; Migration 002 not authorised | Separate migration review and explicit authorisation |

## 9. Non-claims

This document does not select Next.js, NestJS, Express, Supabase, Vercel, an ORM, queue, object store or hosting provider. It does not establish a production backend, deployment, worker, identity service, database or provider account. It does not close EVI-21, execute migrations, approve live trade or convert candidate architecture into an implementation mandate.
