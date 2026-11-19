# Repository and application architecture — candidate baseline

## Current decision
The repository is organised to support a modular application, but the runtime architecture is **not selected**. The Technical Development Manual v3.0 recommends a modular-monolith-first approach. The Developer Guide candidate and manual contain technology/topology differences that must be resolved through TSBBF and an approved ADR before implementation.

## Architectural principles
- Modular monolith before distributed services unless measured requirements justify separation.
- Relational integrity for transactional records and explicit audit history.
- Domain rules independent of UI, database vendor and external providers.
- Explicit organisation/tenant scoping and default-deny authorisation.
- Commands for state-changing actions; queries for read models; events for durable facts.
- Provider adapters behind stable contracts.
- Offline capture as a controlled local queue with explicit sync/reconciliation, not a second source of truth.
- No trust in client-side checks for permissions, stock, pricing or workflow transitions.
- Design for observability, backup, restore, portability and controlled operational ownership.

## Logical layers
1. Experience: buyer, supplier/producer, hub service, seller/exporter, operations and oversight surfaces.
2. Application: use cases, command/query orchestration and transaction boundaries.
3. Domain: identity/authority, organisations, evidence, catalogue, supply, inventory, enquiry, quotation, order, documents, fulfilment, payment-status and audit.
4. Infrastructure: database, file/object storage, messaging, identity provider, telemetry and deployment.
5. Integration adapters: external identity, inspection/lab, logistics, payment, customs/document and notification providers.

These are logical boundaries, not a mandate to create microservices or packages for every noun.

## Architecture decisions still open
- Frontend framework and rendering model.
- Backend framework/API style and process topology.
- Database/identity/storage provider.
- Hosting, CI/CD and environment topology.
- Offline storage/sync implementation.
- Queue/event delivery and scheduler.
- Document storage, malware scanning and retention.
- Observability and backup providers.

Record selections in ADRs only after TSBBF evidence and relevant AADDG controls are satisfied.
