# Release, deployment and operational acceptance gates

**Status:** Repository control index. This file does not authorize a deployment, production environment or live pilot. Apply AADDG and the selected technology decision/ADR once confirmed.

## 1. Layered acceptance gates

| Gate | Required evidence | Decision boundary |
|---|---|---|
| G0 — Specification readiness | Stable/testable requirements; source conflicts resolved or explicitly blocked; traceability; approved synthetic fixtures and stop conditions; named test/review roles and evidence repository | Test programme is specified; software is not yet proven |
| G1 — Component and contract readiness | Unit/component/API contract results; authorization and validation tests; exact build/configuration identity; no unresolved Critical/High defect in accepted scope | Components/contracts only |
| G2 — Integrated workflow readiness | End-to-end positive, negative, exception and recovery tests; data/event lineage; concurrency/idempotency/replay; relevant security/privacy/accessibility/usability evidence | Integrated behaviour only |
| G3 — Operational acceptance readiness | Representative role-based workflow review; approved SOPs; support ownership; incident/exception handling; independent review of high-risk evidence; authorized sponsor/operational acceptance | Operational acceptance within delegated scope only |
| G4 — Production or pilot authorization | Applicable commercial, legal, regulatory, exporter, facility, commodity, destination, privacy, security, payment, logistics, insurance and operational evidence; explicit authorized decision and defined limits/exit conditions | Separate governance authorization; never automatic from G0–G3 |

## 2. Minimum release decision record

Record decision ID/date/authority; product build/version/commit/checksum; scope and environment; requirements and tests covered; defects by severity and approved exceptions; independent review findings/limitations; privacy/security status; operational readiness/support; external approvals/dependencies; decision (ACCEPT / ACCEPT WITH CONDITIONS / REJECT / DEFER); conditions, owners, triggers and expiry.

## 3. Mandatory evidence discipline

- A test case is not an execution result; execution is not independent review; review is not acceptance.
- Preserve raw logs and original failures; link retests rather than overwriting.
- Record environment, build, schema, fixture, tools, operator, reviewer, timestamps and deviations.
- Use synthetic data unless real-data processing has separate approved safeguards and authority.
- No production secrets in development/test; no production system used as a test environment.
- No numeric SLA, RTO/RPO, performance threshold or availability promise without a validated workload/business-impact basis.

## 4. Current project holds

- EVI-21 remains OPEN; Closure Accepted NO.
- DEF-L1-001 and DEF-L1-002 remain OPEN.
- Migration 001 remains HOLD; CV-12 remains UNVERIFIED.
- Migration 002 remains NOT AUTHORISED.
- Technology stack and providers are not selected by this file.
- No live trading, custody, binding reservation, platform-held funds/escrow, live payment integration, dispatch or shipment is authorized.

A release gate may record a bounded decision only within its actual evidence and delegated authority. It cannot override sponsor, legal, regulatory, facility, commercial or pilot controls.
