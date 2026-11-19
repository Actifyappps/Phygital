# Repository map

| Path | Responsibility | Status / boundary |
|---|---|---|
| `docs/governance/` | Authority hierarchy, source register, project status, traceability and disposition | Current programme governance references |
| `docs/product/` | Product scope, actors, journeys, states, surfaces and maturity gates | Requirements, not implementation |
| `docs/domain/` | Bounded-context definitions and domain glossary | Technology-neutral |
| `docs/architecture/` | System boundaries, offline/sync, data and deployment decisions | Candidate architecture only |
| `docs/decisions/` | ADRs and unresolved decision records | Decisions require named authority |
| `docs/data/` | Logical data lineage, evidence, integrity and migration controls | No migration approval implied |
| `docs/api/` + `packages/contracts/` | Logical API/event contracts and schemas | No endpoints/deployment implied |
| `docs/security/` | Identity, privacy, threat and abuse requirements | Not certification |
| `docs/commerce/` | Service catalogue, fees, billing, proceeds and commercial snapshots | Model requires sponsor validation |
| `docs/compliance/` | Commodity/destination rules, sources and review lifecycle | Not legal clearance |
| `docs/product-integrity/` | Holds, withdrawal, recall and traceability | Controlled case workflows |
| `docs/marketplace-trust/` | Listing integrity, reports, moderation and appeals | Separate from product facts |
| `docs/measurement/` | Outcomes, metric definitions and data lineage | No unsupported targets |
| `docs/operations/` | Facility, service ownership, exceptions, runbooks and support | No facility appointment implied |
| `web/` | User-facing application and prototypes | No runtime assumed |
| `packages/domain/` | Pure domain policies and use-case logic | No framework/ORM coupling |
| `integrations/` | Provider adapters and contracts | Providers unselected |
| `workers/` | Background processing and reconciliation | Dormant until approved |
| `supabase/` | Reserved implementation area | Supabase not selected |
| `infra/` | Environment, observability, deployment and recovery | Platform not selected |
| `tests/` + `fixtures/` | Test suites and synthetic datasets | Test design ≠ execution |
| `evidence/` | Sanitised execution/review artefacts | Not the live Notion evidence register |
| `scripts/` | Reproducible validation and maintenance | No production execution implied |

A directory or placeholder reserves a governed home only. It does not authorize code, data migration, deployment, external integration or live operations.
