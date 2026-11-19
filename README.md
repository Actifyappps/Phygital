# Phygital Export Marketplace
**A County-Led Virtual Infrastructure for Cross-Border B2B Trade**

> **Repository status:** governed foundation and design workspace. This repository is not yet an executable application, selected production architecture, or live trading system.

## Product core
Verified supply → buyer enquiry → quotation → order → documents → shipment/payment-status tracking.

The platform is a multi-organisation B2B trade coordination and evidence system connecting producer/source organisations, service hubs, separately authorised sellers and exporters, wholesale buyers, and qualified service providers. Physical operations and digital records must remain linked without allowing a digital status to invent a physical or legal fact.

## Non-negotiable controls
- Platform operator coordinates; it is not the default buyer, seller, exporter, custodian, payee, carrier or holder of funds.
- Seller and exporter-of-record are distinct, independently evidenced transaction capacities. No automatic fallback.
- Hub baseline is service-only. No implied custody, title, stock-held, release or dispatch.
- Declared supply, hub-recorded intake, verified quantity, reservation, physical movement and dispatch are distinct.
- Allocation is a reservation, not movement or dispatch.
- Pilot order: one accepted quotation; every order item retains accepted quote-line lineage and a commercial snapshot.
- Direct buyer-to-seller payment through an appropriately authorised provider; the platform records status and evidence, not funds.
- Preserve evidence strength E1–E4 separately from evidence acquisition/provenance type.
- No live trade, custody, platform-held funds, escrow, live payment integration, dispatch or shipment is authorised by this repository foundation.
- Advanced measurement devices, blockchain anchoring, provider-led escrow and AI forecasting remain phase-gated.

## Governing hierarchy
1. Concept Paper v1.1 — strategic authority.
2. Sponsor Decision Pack 018-A — D-01 to D-07, approved with conditions; conditions/evidence remain open.
3. Phase 0 validation, evidence and operating records — establish external facts and readiness.
4. Technical Development Manual v3.0 — supporting implementation plan, subordinate to the Concept Paper.
5. 024 product specification series — digital product requirements and acceptance.
6. Actify AADDG — engineering lifecycle and operating controls; TSBBF — technology selection/build-vs-buy.
7. This repository — controlled source for implementation artefacts and engineering evidence; it cannot amend higher authority.
8. Runtime behaviour — established only by reproducible environment evidence.

## Current holds
- EVI-21 OPEN; Closure Accepted = NO.
- DEF-L1-001 and DEF-L1-002 OPEN.
- Migration 001 HOLD; Migration 002 not authorised.
- Technology baseline remains OPEN pending documented TSBBF assessment and approved ADR.
- No named buyer, producer, exporter, hub, regulator, payment provider or logistics provider is assumed committed.

## Start here
1. `docs/governance/project-status.md`
2. `docs/governance/source-of-truth.md`
3. `docs/governance/source-document-register.md`
4. `docs/governance/requirements-traceability.md`
5. `docs/architecture/repository-architecture.md`
6. `docs/decisions/README.md`
7. `docs/delivery/development-workflow.md`
8. `docs/quality/evidence-and-acceptance.md`

## Repository map
See `docs/governance/repository-map.md` for the complete directory purpose, ownership boundaries, and what is intentionally dormant.

**A folder, placeholder, specification, candidate script or unexecuted test is not implementation evidence.** Follow: Diagnose → isolate → change → test → regression-check → verify source → deploy only when authorised → verify runtime.


## Repository navigation
- [Notion-to-repository disposition map](docs/governance/notion-to-repository-map.md) — which programme documents deserve repository homes and where they belong.
- [Complete source-document register](docs/governance/source-document-register.md) — canonical source links, status and hierarchy.
- [024-R audit coverage matrix](docs/quality/024r-audit-coverage-matrix.md) — all 12 independent audit findings mapped to repository homes.
- [Commerce and fee model](docs/commerce/service-catalogue-and-fee-model.md)
- [Commodity/destination rule governance](docs/compliance/commodity-destination-rule-governance.md)
- [Product withdrawal, recall and traceability](docs/product-integrity/withdrawal-recall-and-traceability.md)
- [Marketplace trust and appeals](docs/marketplace-trust/trust-safety-and-appeals.md)
- [Product outcomes and metrics](docs/measurement/product-outcomes-and-metrics.md)

- [024-C 65-entity crosswalk](docs/domain/024c-entity-to-context-crosswalk.md) — maps every logical entity to a repository owner.
- [Bounded-context catalogue](docs/domain/bounded-context-catalogue.md) — reconciles the ten 024-C information domains to engineering contexts.
- [Inventory integrity remediation matrix](docs/data/inventory-integrity-control-matrix.md)
- [Migration 001 candidate (HOLD)](supabase/candidates/migration-001-hold/README.md)
- [Level 1 v0.4 prototype](tests/prototypes/level1/README.md)

- [024-B workflow and business-rule crosswalk](docs/product/workflow-to-context-crosswalk.md) — 18 workflows and 34 cross-cutting rules.
- [024-D API contract map](docs/api/024d-contract-domain-map.md) — all 11 contract groups and 12 open decisions.
- [024-F security control/test crosswalk](docs/security/024f-control-and-test-crosswalk.md) — SEC-001–020 and ST-01–24.
- [024-G acceptance catalogue](docs/quality/024g-test-catalogue-crosswalk.md) — QAT-001–036.

- [Migration 002 conditional design boundary](docs/data/migration-002-design-boundary.md) — R-01–R-12 and M2-01–M2-24; no migration authorised.
- [024-D candidate domain event catalogue](docs/api/024d-domain-event-catalogue.md)
- [024-E journey crosswalk](docs/product/024e-journey-crosswalk.md)
- [Counterparty validation checklist](docs/operations/checklists/counterparty-validation.md)

- [Sponsor decisions D-01–D-07](docs/governance/sponsor-decisions-D01-D07.md) — approved with conditions; constraints, not live authorization.
