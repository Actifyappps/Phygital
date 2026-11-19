# Domain package index

Domain packages hold framework-independent policies, invariants and use-case logic. They do not own infrastructure, transport, UI or persistence technology. The package list is a proposed modular-monolith boundary map, not a mandate to deploy separate services.

See [bounded-context catalogue](../../docs/domain/bounded-context-catalogue.md) and [repository architecture](../../docs/architecture/repository-architecture.md).

## Package rules
- Each package owns its state vocabulary and invariants.
- Export stable interfaces; keep internal models private.
- Avoid cross-package writes and shared mutable entities.
- No ORM, database SDK, UI framework or provider SDK imports.
- Commands validate actor authority, scope, state and idempotency.
- Events publish committed facts with schema versions and provenance.
- Use synthetic fixtures and tests for invariants, abuse and concurrency.
- Do not implement a package before its requirements, owner and acceptance evidence are clear.
