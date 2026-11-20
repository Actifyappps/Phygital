# Phygital technology component register

**Review date:** 20 November 2026  
**Status:** Technology-neutral inventory for TSBBF assessment. Not a vendor shortlist, procurement instruction or implementation approval.

## Rules
- Assess components independently before evaluating bundled platforms.
- Separate product/domain capability from technology/vendor.
- Mark absent evidence UNKNOWN; do not invent scores or assume free-tier suitability.
- Evaluate commercial-use rights, security, privacy, data location, portability, operations, continuity and exit—not just developer convenience.
- A folder, interface, adapter seam or candidate directory does not imply selection.
- Technical spikes use synthetic data only and require separate approval.

## Component inventory

| ID | Component / requirement | Repository seam | Candidate classes to assess (not recommendations) | Evidence and key risks | Priority |
|---|---|---|---|---|---|
| TC-01 | Web frontend and producer/buyer/hub/reviewer/admin/public surfaces | `web/` | Next.js; React SPA + API; other maintained framework | 024-E, accessibility, low-bandwidth, routing/auth boundaries, runtime limits, team skills, licence | P0 |
| TC-02 | API/application runtime and modular structure | `packages/domain/`, `packages/contracts/` | Next.js server functions; NestJS; Express; other runtime | Modular-monolith fit, validation, transactions, auth, tests, maintainability, runtime limits | P0 |
| TC-03 | Relational transaction database | Data docs; `supabase/candidates/` | Managed PostgreSQL; Supabase PostgreSQL; self-managed PostgreSQL only if justified | RLS, locks/transactions, backup/PITR, region, encryption, export/restore, cost and operator burden | P0 |
| TC-04 | Identity/authentication/session | Identity domain | Managed OIDC; backend-integrated auth; Supabase Auth; maintained self-hosted option | MFA, recovery, session revocation, portability, data location, account takeover controls | P0 |
| TC-05 | Authorisation/policy enforcement | Authority domain; 024-A | Policy library/service; RLS plus service checks; application policy layer | Deny-by-default, tenant isolation, revocation, direct API negative tests, auditable mandates | P0 |
| TC-06 | Private object/document storage | Documents/evidence domains | Managed object store; Supabase Storage; backend storage service | Private-by-default, scoped short-lived links, malware scan, encryption, retention, export, egress | P0 |
| TC-07 | Workers/background runtime | `workers/` | Managed jobs; queue-backed workers; database-backed jobs; platform functions | Retry/idempotency, dead-letter, limits, secrets, logs, deploy coupling, cost | P0 |
| TC-08 | Queue/scheduler/outbox/event delivery | Contracts/events; workers | Managed queue; PostgreSQL outbox/polling; managed scheduler | Delivery semantics, replay, ordering, duplicate handling, poison messages, operations | P1 |
| TC-09 | Hosting/deployment topology | `docs/delivery/`, `.github/` | Vercel; managed app host; container runtime; separate worker host if needed | Commercial permission, region, bandwidth/egress, runtime limits, secrets, rollback, exit | P0 |
| TC-10 | CI/source control/build artifacts | `.github/` | GitHub Actions; other CI runner | Reproducibility, pinned actions, secret permissions, artifact provenance, branch controls, cost | P0 |
| TC-11 | Observability/incident telemetry | Delivery/operations docs | Host-native; OpenTelemetry-compatible; managed telemetry | Redaction, retention, access, alert quality, cost, export | P1 |
| TC-12 | Backup/restore/continuity | `docs/delivery/backup-restore.md` | Managed backup/PITR; independent exports; object replication | RPO/RTO, restore rehearsal, key recovery, independent copy, lock-in | P0 |
| TC-13 | Offline/local persistence and sync | Offline-sync domain | IndexedDB/PWA; native local app only if justified; explicit sync API | Shared-device privacy, stale authority, conflict, idempotency, revocation, quotas, clock drift | P0 |
| TC-14 | QR/public batch projection | Product-integrity/public-projections | QR library + unguessable token; resolver; no blockchain by default | Entropy, revocation, privacy, allow-listed fields, durable links, scan abuse | P1 |
| TC-15 | Email/SMS/in-app notification | Notifications domain | Transactional email; SMS aggregator; managed service | Consent, delivery receipts, opt-out, retries, country coverage, cost, data processing | P1 |
| TC-16 | Payment-status/provider adapter | Payment-status domain | Licensed PSP/bank API; manual verified reconciliation initially | Direct buyer-to-seller flow, licensing, contracts, webhook authenticity, idempotency, FX/tax; no custody | P1 |
| TC-17 | Logistics/carrier adapter | Fulfilment domain | Carrier APIs; aggregator; controlled manual events | Route coverage, contract, event provenance, corrections, service levels; no inferred dispatch | P2 |
| TC-18 | Laboratory/inspection/standards evidence | Measurement/evidence/compliance | Provider API/portal; controlled document intake; standards data provider | Competence/accreditation scope, issuer, expiry, evidence class, jurisdiction, lawful access | P1 |
| TC-19 | Measurement device/edge bridge | Hub/measurement seam | Manual capture first; device gateway; specific device adapter | Calibration, units, identity, tamper/replay, offline, accuracy, support and lifecycle cost | P2 |
| TC-20 | Analytics/reporting | Measurement domain | SQL/reporting views; embedded analytics; managed BI | Metric definitions, lineage, minimisation, access, export, cost, defensible claims | P1 |
| TC-21 | Forecasting/AI | Deferred analytics seam | No model initially; open-source model; managed AI API | Sufficient lawful data, backtesting, bias/uncertainty, consent, inference cost, separate gate | P2 / deferred |
| TC-22 | Malware/file inspection | Evidence/storage boundary | Managed scanning API; maintained scanner; controlled manual review | File types, quarantine, false negatives, privacy, retention, update cadence | P1 |
| TC-23 | Developer/dependency tooling | CI and repo | Maintained open-source; GitHub-native; paid tools if justified | Licence, maintainer health, vulnerability response, reproducibility, CI cost | P1 |
| TC-24 | Data import/export/portability | Data and delivery docs | PostgreSQL tools; documented ETL/export; provider APIs | Referential integrity, files/metadata, audit history, encryption, repeatable restore and exit cost | P0 |

P0 means needed to decide a credible synthetic spike; P1 means required for complete pilot architecture decision; P2 is later/deferred. Priority does not mean selected or authorised.

## Candidate architecture hypotheses

- **A — managed full-stack:** Next.js + Supabase/PostgreSQL/Auth/Storage + Vercel, as provisionally described in Developer Guide v0.1. Canonical guide must be recovered before exact assumptions are treated as verified. AADDG v1.0 additionally names Cloudflare Pages as an example frontend-host alternative and Render/queues as illustrative worker options; these are candidate examples only, not selections.
- **B — modular API application:** React or other web client + NestJS/Express + managed PostgreSQL + private object storage + governed workers/deployment, reflecting the Technical Development Manual v3.0 candidate.
- **C — component-level hybrid:** independently select frontend, API, identity, database, storage, workers and hosting where evidence justifies the added complexity.

These are comparison hypotheses, not recommendations. Score components separately; a bundle may perform differently across components. The recovered TSBBF v1.0 and AADDG v1.0 source versions and their verified project implications are recorded in [Actify technology standards — source verification record](../decisions/actify-technology-standards-source-verification.md).

## Cross-cutting constraints

Privacy/minimisation/retention; Kenya and destination-market legal/commercial review; tenant isolation and least privilege; low-bandwidth/offline without stale authority; append-only physical-digital provenance; direct buyer-to-seller payment and no platform-held funds/escrow by default; accessibility/language/device support; commercial-use rights/data location/subprocessors; backup/restore/incident response/exit; support, skills and realistic total cost.

## Completion criteria
1. Recover canonical Developer Guide v0.1 and verify version/assumptions.
2. Confirm inventory against current 024 and manual revisions.
3. Obtain workload, bandwidth, media, user/device and operating assumptions from Phase 0.
4. Identify candidates and verify current legal/commercial terms.
5. Complete evidence-backed component scorecards; unknowns remain unknown.
6. Run only authorised synthetic-data spikes.
7. Reconcile security, privacy, portability, recovery, support and cost.
8. Obtain authorised decisions and record conditions in ADRs.

Blockchain, connected devices, escrow, FX, payment initiation/payout, customs automation, regulatory clearance automation, carrier booking, AI forecasts, automated SMS advisories and multi-country scaling remain phase-gated and unselected.


## TC-09 / TC-10 hosting and CI evidence

- [Hosting, deployment and CI candidate evidence snapshot — 20 November 2026](../decisions/hosting-ci-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for Vercel, Cloudflare Pages/Workers, Render and GitHub Actions; no candidate scored.

## TC-01 / TC-02 / TC-07 provider and runtime evidence

- [Frontend, runtime and worker candidate evidence snapshot — 20 November 2026](../decisions/frontend-runtime-worker-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for Next.js, React+Vite, NestJS, Express 5 and four worker/queue patterns; all remain unscored and unshortlisted.

## TC-06 private storage evidence

- [Private object storage candidate evidence snapshot — 20 November 2026](../decisions/storage-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for Supabase Storage, Cloudflare R2 and Amazon S3; all remain unscored and unshortlisted.

## TC-05 authorisation evidence

- [Authorisation candidate evidence snapshot — 20 November 2026](../decisions/authorization-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for application policy + PostgreSQL RLS, OpenFGA and OPA; all remain unscored and unshortlisted.

## TC-04 provider evidence

- [Identity candidate evidence snapshot — 20 November 2026](../decisions/identity-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for Supabase Auth, Clerk, Auth0 and Keycloak; all candidates remain unscored and unshortlisted.

## TC-03 provider evidence

- [Database candidate evidence snapshot — 20 November 2026](../decisions/database-candidate-evidence-snapshot-2026-11-20.md): public-source evidence for Supabase, Neon and Render Postgres; all candidates remain unscored and unshortlisted.

## WP-03 evidence-pack traceability

These source-derived packs define evidence requirements only; they do not record provider assessments, scores, tests or selections.

| Pack | Components | Disposition |
|---|---|---|
| [WP-03 pack 01 — data, identity, authorisation and private files](wp03-component-evidence-pack-01-data-identity-authorisation-storage.md) | TC-03, TC-04, TC-05, TC-06 | INCOMPLETE — NOT SCORABLE |
| [WP-03 pack 02 — frontend, application runtime and workers](wp03-component-evidence-pack-02-frontend-runtime-workers.md) | TC-01, TC-02, TC-07 | INCOMPLETE — NOT SCORABLE |
| [WP-03 pack 03 — hosting, CI, recovery, offline and portability](wp03-component-evidence-pack-03-hosting-ci-recovery-offline-portability.md) | TC-09, TC-10, TC-12, TC-13, TC-24 | INCOMPLETE — NOT SCORABLE |

TC-08 and P1/P2 components remain in the wider WP-03 sequence. The canonical Developer Guide v0.1 source gap remains open.