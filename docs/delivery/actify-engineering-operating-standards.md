# Actify engineering operating standards applied to Phygital

**Sources:** Actify Inc. AADDG v1.0 (GitHub → Supabase → Vercel Operating Standard, including Level 1 extensions) and TSBBF v1.0 (ratified 31 October 2026). This file records their application to this project; it does not reproduce the full company standards.

## AADDG — lifecycle and source-of-truth discipline
- GitHub is the source of truth for application code, technical documentation, appropriate configuration and change history.
- Supabase or the selected backend is the source of truth for application data/backend services.
- Vercel or the selected deployment platform is the build-and-serving environment.
- Preferred lifecycle: define → establish repository → backend → deployment → test → release; each meaningful change follows PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY.
- Do not mistake code written for code committed, deployment success for feature correctness, or a demo for production readiness.
- Never commit passwords, service-role secrets, database credentials, recovery codes or sensitive customer data.
- Level 1 extensions recognise background workers and physical bridges (QR/NFC/edge devices) as governed components; they require integrity, security, observability and lifecycle controls.
- Offline-first, bandwidth, webhook, payment and physical-digital boundaries require explicit design and tests.
- For Phygital, Supabase and Vercel remain candidates/defaults within AADDG, not a final project stack selection until the TSBBF decision and open ADRs are completed. The Technical Development Manual v3.0 and Developer Guide contain differing candidate architecture descriptions; do not silently choose one.

## TSBBF — technology selection and build-vs-buy
Default preference: reuse suitable open-source software; pilot free/freemium tools where appropriate; pay where reliability/support/security justify it; build custom code only for a real differentiating gap. This is a preference order, not an inflexible rule.

Every material decision evaluates:
- functional and non-functional fitness;
- security, privacy, legal and commercial suitability;
- data portability, export, backup, migration and exit;
- free-tier quotas, upgrade consequences and total cost of ownership;
- maintainer activity, support, skills and maintenance burden;
- reliability, integration fit, licensing and vendor dependency;
- reversible pilot path, evidence still required and named decision owner.

Critical security, legal, privacy or recovery risks block approval regardless of weighted score. Record decision, assumptions, evidence, limitations, owner and reassessment trigger in an ADR.

## Project-specific consequence
The existing folder structure is intentionally technology-neutral. GitHub is the code-history home. No Supabase project, Vercel project, production environment, database migration, worker or physical device integration is declared provisioned by this repository.


## AADDG v1.0 Level 1 controls — Phygital-specific implementation obligations

The following extensions are part of the Actify operating standard and are relevant because Phygital links physical goods and commercial events to digital records. They are engineering requirements to preserve in design and tests; they do not activate the corresponding capability.

### Physical-to-digital integrity
- QR/NFC/batch identifiers must be unguessable or cryptographically protected; never use predictable sequential identifiers for public physical labels.
- Scan, intake, custody, inspection and handover events are append-only, timestamped records. Correct errors through linked correction events, not status overwrites.
- Offline/low-bandwidth capture must queue locally and synchronise idempotently, preserving capture time, actor and source while detecting conflicts.
- Certificates, bills of lading, KYC and inspection files belong in private backend storage. Access uses short-lived, scoped signed URLs or an equivalent private delivery mechanism; no public bucket links.

### Financial and provider-event integrity
- Financial records are append-only: debits, credits, fees, refunds, reversals and any future escrow milestones are separate events, not overwritten balances.
- Webhooks are authenticated and cryptographically verified before processing; persist provider-scoped event identity and process idempotently. Retries must not double-credit, double-reserve or advance shipment state twice.
- Prices, discounts, taxes, commissions and fees are validated/calculated on the trusted backend, never accepted as authoritative from a browser/mobile client.
- These controls do not change the current D-07 boundary: direct buyer-to-seller payment and provider-verified status/reconciliation; no platform-held funds or escrow by default.

### Repository and runtime governance
- One product has one authoritative GitHub repository unless a documented architecture decision justifies otherwise. Frontend, admin surfaces, workers, migrations, tests and documentation remain in the same governed repository where applicable.
- A worker host and frontend host, if both needed, must consume the same repository and follow the same release/change controls.
- No dashboard-only SQL, RLS policy or backend function changes: preserve exact source in version control and make backend state reproducible.
- Never expose service-role/admin secrets in client bundles or unauthenticated endpoints. Commit variable names in .env.example, never secret values.
- Commit dependency manifests and lockfiles together; isolate generated/synthetic data from real production analytics.
- Structured logs, correlation IDs, dead-letter handling, safe retry, backup verification, restore rehearsal and rollback are first-class operational controls.

### AADDG release-gate application
Before any future production release, the project must have a complete committed source tree, reproducible build and backend schema/functions, tested authentication and authorization, RLS/tenant-isolation tests, core and regression tests, verified environment variables, private-storage permission tests, QR/token integrity tests, signed/idempotent webhook tests, worker/retry tests where applicable, offline/low-bandwidth tests where applicable, verified backup/restore and rollback, updated README, known limitations and named owner/maintainer.

The current repository is not yet an executable application or deployed environment. These are future release gates, not claims of completion.

## TSBBF v1.0 — full decision scorecard

TSBBF's default preference is: (1) suitable maintained open-source reuse; (2) reversible free/freemium pilot; (3) paid service where reliability, support, security or compliance justify cost; (4) smallest custom implementation for a proven gap. This is a preference order, not an inflexible rule.

Every significant component is assessed separately against the ratified scorecard:

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

Candidates are scored 1–5. Weighted score = sum(score × weight) ÷ 5. Scores of 80–100 are a shortlist for practical testing and cost verification; 65–79 require further investigation or improved terms; below 65 should not be adopted without a documented compelling reason. Any critical unresolved security, legal, privacy, data-recovery or business-continuity risk blocks approval regardless of score.

Required evidence includes data export/import and exit route; free-tier quotas and overage consequences; maintainer/support and upgrade path; data location, access, privacy, retention and deletion; licence and commercial-use terms; prototype and 12-month/24–36-month TCO assumptions; setup/migration/maintenance/security/exit costs; pilot acceptance criteria; accountable owner and reassessment trigger.

## Current Phygital technology-selection status

No TSBBF scorecard or approved technology decision is represented by the folder structure. The Technical Development Manual v3.0 and the referenced Developer Guide describe different candidate architectures. The Developer Guide's canonical source location remains unresolved in the current source register. Until its source is recovered and the candidate architectures are reconciled through TSBBF and approved ADRs, do not choose a framework, ORM, backend, hosting provider or deployment topology by inference.
