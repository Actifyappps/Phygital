# Repository map — intended engineering workstation

This is a logical map. The presence of a directory does not select its framework, provider or deployment target.

| Area | Purpose | Activation condition |
|---|---|---|
| `.github/` | Contribution workflow, issue/PR controls and later CI | CI workflows only after build/test commands and secrets policy are approved |
| `docs/governance/` | Authority, status, traceability, change and source register | Active now |
| `docs/product/` | Product scope, user journeys, workflows and UX rules | Active for design |
| `docs/domain/` | Bounded contexts, glossary and domain ownership | Active for modelling |
| `docs/architecture/` | Context, boundaries, offline, topology and architecture decisions | Active for design; candidate topology only |
| `docs/data/` | Data classification, evidence, integrity, retention and migration controls | Active for design; migrations gated |
| `docs/api/` | Logical API/event contracts and error semantics | Active for design; generated API specs gated by architecture choice |
| `docs/security/` | Threat model, access controls, secure development and privacy | Active for design and review |
| `docs/integrations/` | Provider-neutral contracts, adapters, webhook and reconciliation design | Active for design; live adapters gated |
| `docs/quality/` | Test levels, acceptance, traceability and evidence rules | Active now |
| `docs/delivery/` | Environments, release gates, recovery and operational delivery | Active for planning |
| `docs/operations/` | Field/hub operations, exception handling and pilot readiness | Active for simulation; real operations gated |
| `packages/domain/` | Pure business rules by bounded context | Dormant until technology baseline and domain contracts approved |
| `packages/contracts/` | Versioned schemas and logical interface contracts | Dormant until contract format chosen |
| `packages/shared/` | Reusable primitives with no business authority | Dormant until architecture approved |
| `web/` | User-facing web application surfaces | Dormant; framework and routing not selected |
| `workers/` | Asynchronous jobs and scheduled processing | Dormant; queue/scheduler not selected |
| `integrations/` | Provider adapters and external-system boundaries | Contract stubs only until provider/authority gates pass |
| `supabase/` | Conditional candidate database-platform workspace | **Not selected or activated**; Migration 001 remains HOLD |
| `infra/` | Infrastructure definitions and environment overlays | Dormant until provider and deployment decisions approved |
| `tests/` | Unit, integration, contract, E2E, security, accessibility, resilience and migration tests | Test strategy active; executable harness depends on stack |
| `fixtures/` | Synthetic-only fixtures and test data builders | Active with synthetic data |
| `scripts/` | Reproducible validation, quality and maintenance scripts | Only safe, reviewed scripts may be activated |
| `evidence/` | Test runs, reviews, release evidence and provenance | Active for controlled evidence; never store secrets or unnecessary personal data |

## Structural rules
- Keep product/domain rules out of UI components and provider adapters.
- Keep external providers behind contracts and anti-corruption adapters.
- Keep schema migrations separate from seed data, fixtures and operational data.
- Keep synthetic fixtures separate from any later authorised real-data samples.
- Keep generated output out of source-of-truth folders unless reproducibly generated and reviewed.
- Keep evidence immutable; corrections create a new record linked to the superseded one.
- Do not add executable deployment or migration automation merely because a folder exists.
