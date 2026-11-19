# Repository architecture and ownership

**Status:** technology-neutral repository architecture. No framework, hosting provider, ORM, database, cloud, microservice topology or deployment target is selected by this document.

## Layers
- `docs/`: authoritative engineering interpretation, architecture, decisions, product and operational controls.
- `packages/domain/`: framework-neutral domain concepts, invariants, policies and pure application logic, grouped by bounded context.
- `packages/contracts/`: versioned commands, events, API schemas and shared interface contracts; no business state ownership.
- `web/`: user-facing web application and surface-specific features; UI is a projection of authorised domain state.
- `workers/`: asynchronous jobs, scheduled tasks and reconciliation processes; each must be idempotent, observable and bounded.
- `integrations/`: provider adapters and anti-corruption layers; provider-specific semantics stay out of domain core.
- `supabase/`: reserved for a future approved Supabase implementation only; its presence does not select Supabase.
- `infra/`: reproducible environment, monitoring and deployment definitions after platform decision.
- `tests/`: unit, contract, integration, end-to-end, security, accessibility, offline and resilience tests.
- `fixtures/`: synthetic, versioned and privacy-safe test records.
- `evidence/`: minimised, sanitised test outputs, review records and release evidence.
- `scripts/`: repeatable validation, migration inspection, quality and maintenance automation.

## Dependency direction
UI → application/contract boundary → domain policy. Infrastructure and provider adapters implement ports defined inward. Domain packages must not import UI, database clients, provider SDKs or framework runtime. Cross-domain interaction uses explicit application services and versioned contracts.

## Repository is not a deployment topology
Do not create a service, queue, database, cloud resource or external integration merely because a directory exists. Start as a modular monolith unless evidence and an approved architecture decision justify distribution. Keep deployment decisions reversible while the stack remains open.

## Source and authority
Concept Paper v1.1 governs strategy. 018-A constrains roles, custody, funds and order/inventory relationships. 024/024-A–G define product requirements. AADDG governs engineering lifecycle; TSBBF governs build-vs-buy/technology selection. This repository cannot amend any higher authority.

## Required architecture decisions before implementation
- Hosting/runtime and frontend framework.
- Database, schema ownership, migration and transaction strategy.
- Identity provider, session and organisation membership model.
- Object storage, evidence integrity, access and retention.
- Offline-first scope, local persistence, sync conflict resolution and device trust.
- API/event transport and versioning.
- Background jobs, scheduler and observability.
- Integration provider selection, secrets and webhook verification.
- CI/CD, environment isolation, backup/restore and recovery objectives.
- Data residency, privacy, records retention and incident response.
