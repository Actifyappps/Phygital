# ADR-0001 — Technology baseline

**Status: OPEN — no technology stack selected.**  
**Decision owner:** authorised programme/product governance (not appointed by this ADR).  
**Governing framework:** Actify TSBBF v1.0; AADDG v1.0; Concept Paper v1.1.  
**Review date:** 21 November 2026.

## Context

The Technical Development Manual v3.0 and Developer Guide v0.1 describe different candidate architecture paths. Manual v3.0 proposes a modular-monolith-first design with an API/application layer (NestJS/Express candidates), managed PostgreSQL, private file storage, workers and replaceable provider adapters. Developer Guide v0.1 is referenced as a Next.js/Vercel + Supabase/PostgreSQL/Auth/RLS/private-storage candidate, but its canonical source artifact was not recovered in the current targeted Notion/Library search. Its exact version/content must be revalidated before formal scoring.

AADDG v1.0 is the engineering operating standard, not a requirement to use Supabase or Vercel. TSBBF v1.0 requires component-level, evidence-based selection and a documented exit route. The current repository folder structure is technology-neutral.

The source-linked comparison baseline is maintained in ../architecture/technology-decision-requirements-baseline.md. It consolidates 024-A–G, sponsor decisions and engineering standards without promoting draft requirements to approval.

## Decision

No selection is made by this ADR. Preserve candidate alternatives and conduct a TSBBF assessment before implementation dependencies are fixed.

## Mandatory assessment

Score each candidate 1–5; weighted score = sum(score × weight) ÷ 5:

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

Shortlist 80–100; investigate 65–79; do not adopt below 65 without documented compelling rationale. A critical unresolved security, legal, privacy, recovery or continuity risk blocks approval regardless of score.

Evaluate frontend, application/API framework, database, identity, object storage, workers/queues, deployment/hosting, monitoring, backups and each material provider separately. Include:
- data export/import, metadata/relationship portability and migration cost;
- free-tier quotas, overage, throttling, suspension and upgrade consequences;
- maintenance, security updates, support, skills and operational effort;
- data location, subprocessors, privacy, retention and deletion;
- licence and commercial-use terms;
- prototype, first-year and 24–36-month TCO assumptions;
- backup/restore, rollback, continuity and exit/replacement plan;
- hosting commercial terms and bandwidth/media economics;
- integration boundaries, webhook trust, worker/edge topology and vendor failure behaviour.

## Evidence progress (20 November 2026)

- [WP-03 candidate evidence register](wp03-candidate-evidence-register.md) consolidates 37 component candidates/patterns and links the initial public-source evidence snapshots. No candidate is READY FOR SCORING; no numeric score or shortlist exists.
- [Actify technology standards source verification](actify-technology-standards-source-verification.md) confirms the recovered TSBBF v1.0 and AADDG v1.0 sources. The canonical Developer Guide v0.1 remains unrecovered and Candidate A remains provisional/unscorable.
- [WP-04 application topology assessment](../architecture/wp04-application-topology-assessment.md) proposes a modular-monolith-first logical direction for authorised review only. ADR-0002 remains OPEN; no framework or provider is selected.
- The workload/TCO register continues to mark unvalidated pilot volumes, operating capacity, RPO/RTO, data retention and costs UNKNOWN.

These records show progress in evidence preparation; they do not close ADR-0001 or authorize a synthetic spike, provisioning, migration or production implementation.

## Dependencies and open questions

- Reconcile the exact Developer Guide v0.1 source before scoring it against Manual v3.0.
- Confirm whether the logical modular monolith is the preferred product shape; avoid premature microservices.
- Resolve web/ versus src/ source layout without allowing folder names to determine framework choice.
- Decide whether managed Supabase/PostgreSQL or another managed PostgreSQL service best satisfies the data, RLS, backup, portability and operating requirements.
- Evaluate Vercel and alternatives for frontend hosting; separately assess workers/queues and file delivery.
- Confirm team skills, maintainers, budget, expected load, media/bandwidth and provider constraints.

## Consequences

Until approved, keep API contracts and domain models technology-neutral; keep Migration 001 under HOLD and Migration 002 unauthorised; do not add framework-specific production dependencies, provision production services or claim a selected stack. Record evidence, scorecards, limitations, pilot criteria, decision owner and reassessment trigger before changing status.

## Acceptance criteria for closing this ADR

1. Canonical candidate source documents and versions are verified.
2. Component alternatives and TSBBF scorecards are complete.
3. Critical legal/security/privacy/recovery risks are resolved or the candidate is rejected.
4. TCO, data portability, backup/restore and exit paths are evidenced.
5. Architecture and operating model are independently reviewed.
6. Authorised decision owner records selection, scope, conditions and review trigger.


## EVI-28 readiness update — 21 November 2026

EVI-28 is IN PROGRESS as a readiness assessment. The TSBBF method, TDR baseline, candidate register and blank workbook exist, but no candidate is READY FOR SCORING; no numeric score, shortlist or baseline selection exists. EVI-25 source authority, EVI-27 topology, workload/TCO, legal/privacy/provider terms, candidate-specific security/recovery/exit evidence, operating ownership and independent review remain incomplete. ADR-0001 remains OPEN. See [`evi-28-adr-0001-technology-baseline-readiness-assessment-001.md`](evi-28-adr-0001-technology-baseline-readiness-assessment-001.md) and [Notion assessment](https://app.notion.com/p/41f6808bcd9e8130afbbc4a68db571dc).
