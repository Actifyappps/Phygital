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


## 024-H source re-check and AADDG/TSBBF integration — 20 November 2026

A further targeted search of the current Phygital Project Home and connected Notion workspace did not locate a completed 024-H page. 024-R's intended scope remains architecture, deployment and operations. This gap record is not a substitute 024-H specification.

The Actify governing standards have now been read and applied:
- AADDG v1.0, including Level 1 extensions, is represented in `docs/delivery/actify-engineering-operating-standards.md`. Its repository/backend/deployment separation, single authoritative repository default, worker/physical bridge controls, reproducible migrations, secrets, private files, webhook/ledger integrity, observability, backup/restore and release gates are mapped.
- TSBBF v1.0 is represented in the same operating note and ADR-0001. Its component-level scorecard, TCO, data portability, licensing, free-tier limits, maintenance, security/privacy and exit requirements are preserved.
- ADR-0001 (technology baseline) and ADR-0002 (application topology) remain OPEN. The source-retrieval gap for Developer Guide v0.1 prevents a complete source-to-source architecture comparison until that exact document is recovered.

The following 024-H decisions remain open: selected stack and providers; topology and runtime count; hosting commercial/bandwidth economics; environment and secrets model; worker/queue ownership; support/incident ownership; backup/restore objectives; operational service levels; supplier exit/continuity. Do not invent SLA/RTO/RPO targets or select vendors without workload and cost evidence.

No completed 024-H page, approved stack, production deployment, service-level target or operational readiness acceptance is claimed.


## 024-C / 024-G downstream dependency confirmation — 20 November 2026

The current Notion 024-C v0.1 and 024-G v0.1 sources both identify a 024-H companion in the downstream specification sequence:
- 024-C describes 024-H as the delivery, operations and observability specification covering support ownership, deployment stages, monitoring, backup/restore, incident runbooks and operational metrics.
- 024-G describes 024-H as the release, deployment, environment, configuration and operational-readiness control model, subordinate to AADDG, TSBBF and the existing programme authority.

A further targeted search of the current Phygital Project Home/connected Notion workspace for 024-H and its delivery/operations/observability scope did not locate a completed 024-H page. The absence is recorded as **not located in the current targeted search**, not proof that no draft exists elsewhere.

Repository coverage exists across the environment/promotion model, release gates, release/rollback checklist, observability, operations ownership, runbook placeholders, AADDG/TSBBF operating crosswalk and architecture ADRs. These distributed homes do not constitute an approved 024-H source specification.

**Disposition:** retain this gap record; do not silently create a replacement 024-H or treat existing repository notes as its approval. Confirm whether 024-H is planned, stored elsewhere or should be commissioned. Until then, keep all vendor, topology, service-level, RTO/RPO, support-hours and production decisions open unless separately approved by their proper authority.


## Consolidated delivery/operations coverage assessment — 20 November 2026

The distributed repository homes and their actual unprovisioned/runtime status are mapped in docs/quality/024h-delivery-operations-coverage-assessment.md. It also separates the 024-H operational specification from the 025 commercial service/fee model and provides a proposed commissioning outline only. This assessment is not the missing 024-H source or an approved replacement.
