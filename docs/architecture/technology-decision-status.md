
# Technology decision status

**Status: OPEN — no project technology stack has been selected.**

## Governing selection and operating standards

- **TSBBF v1.0** (Actify Inc., ratified 31 October 2026) governs technology selection and build-vs-buy. Reuse suitable open-source software first; use reversible free/freemium pilots where appropriate; pay when reliability/support/security justify it; build custom code only for a demonstrated gap. This preference order is not absolute.
- **AADDG v1.0**, including Level 1 extensions, governs repository source-of-truth, backend/deployment separation, reproducible changes, environments, secrets, migrations, workers, physical-digital integrity, webhook/ledger integrity, observability, backup/recovery and release gates.
- **Concept Paper v1.1** remains strategic authority. Technical Development Manual v3.0 is a supporting implementation plan, not a stack decision. 024-F/G define security and test requirements; they do not select vendors.

## Candidate architecture descriptions requiring reconciliation

| Source | Candidate description | Status |
|---|---|---|
| Technical Development Manual v3.0 | Modular-monolith-first logical design with API/application service (NestJS/Express candidates), managed PostgreSQL, private file storage, background workers and replaceable provider adapters | Logical proposal; no final framework/provider selection |
| Developer Guide v0.1 (draft; 17 Nov 2026; prepared for Actify Inc.) | No verified stack attribution; the complete guide has not been recovered | **UNVERIFIED / NOT LOCATED:** prior project context records the draft title/version/date, but complete original content and underlying file/page were not recovered in targeted Notion, Library, repository or prior-conversation retrieval. Prototype v0.1/v0.2 are separate test artefacts. EVI-25 is IN PROGRESS; do not score from partial references. See `docs/delivery/evi-25-developer-guide-source-recovery-assessment-001.md`. |
| AADDG v1.0 | GitHub → selected backend → selected deployment; Supabase/Vercel are examples/defaults, not compulsory vendor selections; Level 1 adds workers and physical/edge bridges | Operating standard, not a stack selection |

Do not silently resolve these differences. The repository's `web/`, `packages/`, `workers/` and `supabase/candidates/` paths are logical organization, not proof that Next.js, NestJS, Supabase, Vercel, an ORM or a hosting topology has been selected. The `web/` versus `src/` convention remains open.

## TSBBF mandatory component scorecard

Score each candidate 1–5 and calculate `Σ(score × weight) ÷ 5`:

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

80–100: shortlist for practical testing and cost verification. 65–79: investigate further or improve terms. Below 65: do not adopt without a documented compelling reason. Any unresolved critical security, legal, privacy, data-recovery or business-continuity risk blocks approval regardless of score.

Assess components separately: frontend/runtime, API/application framework, database, identity, object storage, worker/queue, deployment/hosting, observability, backup, payment/messaging/logistics and developer tooling. Record data location, export/import, free-tier limits, overage behaviour, 12-month and 24–36-month TCO where material, maintainer/support, licensing, migration/exit and accountable owner.

## Required decision record

ADR-0001 remains OPEN until alternatives are evidenced and scored, candidate architecture conflicts are resolved, security/privacy and operational risks reviewed, a reversible pilot path defined and an authorised owner records the selection. ADR-0002–0005 remain dependent on the relevant component/topology choices.

No vendor account, deployment project, backend, production environment, database migration or live integration is declared provisioned by this document.


## Component inventory and TSBBF assessment preparation — 20 November 2026

The technology-neutral component inventory is `docs/architecture/technology-component-register.md`; the blank evidence-led assessment workbook is `docs/decisions/TSBBF-component-assessment-workbook.md`; and the synthetic-data spike plan is `docs/delivery/technology-spike-and-acceptance-plan.md`. These prepare evidence for ADR-0001/0002 and dependent ADRs. No candidate has been scored or selected. Developer Guide v0.1 canonical source remains unrecovered; candidate comparisons remain provisional until recovered. Spikes require separate approval and synthetic-only data.


## AADDG operational identity record

See `../delivery/application-operational-identity-register.md` for the current verified answers to the five operational identity questions. It confirms that the repository exists but backend, deployment, production URL and worker/edge runtime remain unprovisioned. ADR-0001/0002 remain OPEN.


## EVI-25 source recovery — 21 November 2026

A targeted search of the current Project Home hierarchy, Notion workspace, connected Library and recursive repository tree did not locate the complete Developer Guide v0.1. Concept Paper v1.1 remains the strategic authority; Technical Development Manual v3.0 remains the supporting technical plan. Partial prior references are source-recovery leads only, not a verified specification. EVI-25 is IN PROGRESS pending the complete source or a formal custodian-backed unavailability/supersession disposition. Do not score technologies from the excerpt.

See [`docs/delivery/evi-25-developer-guide-source-recovery-assessment-001.md`](../delivery/evi-25-developer-guide-source-recovery-assessment-001.md) and [Notion assessment](https://app.notion.com/p/41f6808bcd9e8130846cf2d7c22b16c0).
