# 024-H architecture, deployment and operations — source gap record

**Status:** gap recorded; this file is not the missing 024-H specification.

024-R allocates architecture, deployment and operations requirements to a proposed 024-H companion, including TSBBF technology selection, support/runbooks, recovery, service levels, cost ownership and vendor exit. A targeted search of the current Project Home and connected Notion workspace on 20 November 2026 did not locate a completed 024-H page.

## Requirements already represented in this repository
- Technology selection and build-vs-buy: `docs/delivery/actify-engineering-operating-standards.md`, ADRs and technology-decision status.
- Environments, release, rollback, backup/restore and observability: `docs/delivery/`, `infra/`.
- Support ownership, incidents, operations and partner handoffs: `docs/operations/`.
- Offline/device security: `docs/architecture/offline-and-sync-architecture.md`.
- Security and privacy: `docs/security/`.
- Integration failure, callbacks and reconciliation: `docs/integrations/`, `docs/operations/`.

## Still requiring a canonical design/decision
1. Confirm whether 024-H is planned, drafted elsewhere or should be commissioned.
2. Reconcile TSBBF against candidate stacks and whole-life cost, data location, security, portability, support capacity and exit.
3. Approve deployment topology, environment separation, identity, storage, database, queues and observability.
4. Define operational ownership, support hours, severity and escalation only after service validation.
5. Define backup/restore objectives, recovery exercises and evidence.
6. Define supplier/provider operational dependencies and exit/continuity.
7. Link architecture choices to the six surfaces, domain boundaries, APIs, data protection and acceptance tests.

No stack, hosting provider, production topology or service-level target is selected by this gap record.
