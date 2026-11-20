# Technical Development Manual v3.0 — repository implementation crosswalk

**Source:** [Phygital Technical Development Manual v3.0](https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce)  
**Strategic authority:** Concept Paper v1.1.  
**Status:** Source-derived architecture and capability map; not a technology selection, implementation approval or production-readiness claim.  
**Review date:** 20 November 2026.

## 1. Authority and interpretation

The Concept Paper v1.1 remains the authoritative statement of vision, four technological pillars, proposed operating model and indicative rollout. Manual v3.0 is a supporting technical and operational plan. It is not legal, financial, customs, tax or regulatory advice. Partner, provider, payment, export, data-protection and destination-market requirements require competent validation.

The manual's initial migration and stack recommendations are planning artefacts. Current project controls prevail where later sponsor decisions, the 024 specifications or the current Phase 0 baseline impose a stricter boundary:

- Migration 001 remains **HOLD**; do not execute it or put it on an active migration path.
- Migration 002 is **not authorised**.
- Technology selection remains **OPEN** pending TSBBF evidence and approved ADRs.
- EVI-21 remains **OPEN / Closure Accepted = NO**.
- Synthetic data only for current prototype and rehearsal activity.
- No live trade, custody, platform-held funds, escrow, live payment integration, dispatch or shipment is authorised.

## 2. Logical architecture and technology-neutral implementation homes

Manual v3.0 recommends a modular-monolith-first product: participant web surfaces and an API layer; authentication/authorization; cohesive domain modules; relational transaction storage; private evidence/file storage; background processing; and replaceable external adapters. This is a candidate logical shape, not an approved deployment topology.

| Manual capability | Repository home | Boundary / decision |
|---|---|---|
| Producer, cooperative, buyer, hub, administration surfaces | `web/surfaces/`, `web/features/` | 024-E defines six surfaces; screen specifications precede implementation |
| Identity, organisations, memberships and permissions | `packages/domain/identity/`, `organisations/`, `authority/` | Enforce server-side, organisation-scoped authority; seller and exporter are separate capacities |
| Product catalogue, listings and discovery | `packages/domain/catalogue/`, `marketplace/` | Only eligible, evidence-supported supply may be represented as verified |
| Hub intake, batch identity and quality | `hub-services/`, `supply/`, `measurement/`, `evidence/` | Hub is service-only; no implied custody/title/stock control |
| Inventory, reservations and movements | `inventory/`, `docs/data/inventory-and-batch-ledger.md` | Reservation is not physical movement; atomic concurrency and lineage controls required |
| Buyer enquiry, quotations and orders | `buyer-requirements/`, `quotations-orders/`, `commerce/` | One accepted quotation per pilot order; immutable accepted commercial snapshot |
| Documents, commodity/destination checks and fulfilment | `documents/`, `compliance-rules/`, `fulfilment/` | Competent authority/provider evidence required; no automated legal clearance implied |
| Payment status and reconciliation | `payment-status/`, `reconciliation/`, `integrations/` | Direct buyer-to-seller funds flow; platform records provider references/status only |
| Cases, disputes, exceptions and support | `cases/`, `marketplace-trust/`, `docs/operations/` | Restricted case evidence, accountable owner and review trail |
| Notifications, reporting and audit | `notifications/`, `measurement/`, `audit/` | Purpose, consent, access, retention and provenance controls |
| Private files, APIs, background work and provider adapters | `integrations/`, `workers/`, `docs/api/` | Contracted, replaceable, authenticated and idempotent boundaries |

## 3. Product and workflow requirements to preserve

The manual's initial product outcome spans account/organisation management; product listings; source-linked batches; evidence and quality review; buyer enquiries; quotations and orders; allocation; secure export/quality documents; shipment milestones; payment status; audit trails; and operational reporting.

The corresponding workflow chain is:

1. Producer/cooperative onboarding with evidence review and explicit pending/approved/rejected/correction states.
2. Product listing with product/grade, supplier, origin at appropriate precision, quantity/unit, packaging/MOQ, quotation method, relevant season, evidence and expiry.
3. Hub intake and batch creation with stable internal IDs, source, operator, quantity/unit and measurement provenance.
4. Quality review against commodity/buyer-specific standards, recording method, equipment, inspector, result, evidence, decision and review history.
5. Buyer enquiry and seller-issued, versioned quotation with validity, currency, price basis, quantity, delivery terms and conditions.
6. Order confirmation and inventory reservation with database-level concurrency protection and no double allocation.
7. Documents and fulfilment milestones with actor, source, timestamp, evidence and external reference.
8. Provider-verified payment status and reconciliation; a browser redirect or QR scan is not proof of payment.
9. Exception/dispute handling with case owner, timeline, evidence, resolution and reason.

These are capability requirements, not permission to execute live transactions.

## 4. Data and integrity requirements

The manual identifies users, organisations, memberships, producer profiles, hubs, products, listings, batches, measurements, inspections, inventory movements, enquiries, quotations, orders, order items, batch allocations, documents, payments, shipments and audit events as distinct logical records.

Preserve the following in domain contracts and tests:

- Stable internal identifiers and explicit foreign-key relationships.
- Decimal/numeric quantities and monetary values; explicit currency and unit.
- Consistent timestamp/time-zone policy and explicit status transitions.
- Separate declared, received, measured, quality-eligible, available, reserved, allocated, moved, dispatched and reconciled quantities.
- Append-only inventory movements and correction events; no silent overwrite of material history.
- Atomic/serializable or equivalently proven allocation checks under concurrency.
- Idempotency for retryable intake, order, payment and provider events.
- Accepted order lines retain the exact accepted quotation line and immutable price, currency, unit, quantity, fees/tax basis and terms snapshot.
- Private file metadata and scoped access; retention and archival rules.
- Database constraints complement, but never replace, service-layer authorization.

The inventory equation in the manual is a conceptual check only; the approved ledger model must define quantity semantics and all movement/reservation states before implementation.

## 5. API and integration requirements

The manual proposes versioned APIs (example prefix `/api/v1`), consistent response/error envelopes, server-boundary validation, server-side authorization, pagination/filtering, idempotency, optimistic concurrency/state checks, OpenAPI documentation and safe correlation IDs.

Its endpoint names are examples, not approved contracts. 024-D is the current technology-neutral API/integration contract authority. No endpoint should be implemented from the manual alone where 024-D, 024-B or sponsor decisions provide more precise constraints.

Provider boundaries include payment, logistics, notifications, inspection/laboratory, identity, file storage and future regulatory/measurement sources. Verify provider identity, signatures, schema, authority and event provenance; design retries, replay protection, reconciliation, rate limits, timeouts, observability and exit strategy.

## 6. Offline and connected-device controls

Manual v3.0 describes an offline capture queue with client-generated operation IDs, retry/backoff, server-side deduplication and validation, server acknowledgement/timestamp, visible rejected submissions and operator sync status.

This is not blanket offline authorization. Offline actions must be allow-listed; local data must be minimized and protected, especially on shared devices. The server remains authoritative for current permissions, batch/order state, quantity availability and acceptance. Revoked membership, expired mandate, stale quotation, clock drift, replay, duplicate submission and conflicting records must fail safely or create review tasks.

Future sensor ingestion requires authenticated device/gateway identity, device model/protocol, calibration status, raw and normalized readings where appropriate, units, timestamps, plausible-range checks, manual-override records and tests for disconnect, duplicate events, clock drift and power loss. Mock readings must remain isolated and visibly synthetic.

## 7. Passport, blockchain and public projection

The baseline passport is a controlled QR-linked batch projection containing only approved public fields: public batch reference, product/grade, appropriately generalized origin, approved status, relevant inspection summary, selected verification references and last-updated time. It must not expose private contact details, prices, personal data or restricted documents. A QR code resolves to a record; it does not prove the physical goods match that record.

Use an auditable conventional database first. Blockchain anchoring remains deferred unless a real partner requirement or measurable trust benefit justifies it and privacy, correction/revocation, source-of-truth, key management, cost and independent security controls are approved. No prototype smart contract or QR scan may authorize financial settlement.

## 8. Financial boundary

The first digital capability records payment obligations/terms, provider references, verified status, reconciliation and exceptions. It does not hold customer funds. Webhooks require cryptographic verification, provider-scoped event identity, replay protection and idempotent processing. Do not store raw card/banking credentials. Future escrow, FX, payout or payment initiation requires licensed-provider arrangements, legal/commercial review, explicit funds-flow ownership and separate approval.

## 9. Success measures and operational readiness

Manual v3.0 proposes measuring verified producer onboarding, complete listings, batches reviewed, evidence completeness, enquiry-to-quotation time, accepted-quote-to-order time, fulfilment/cancellation, inventory discrepancies, rejected/duplicate submissions, document completeness, payment exceptions, support resolution, availability, error rate and recovery performance. Targets must be established from a validated pilot baseline; do not invent targets.

Separate local development, automated test, staging/pilot acceptance and production environments, credentials, storage and provider accounts. No environment is declared provisioned by the repository.

## 10. Traceability and non-implementation statement

The detailed product requirements are decomposed into 024, 024-A–G and 024-R crosswalks. This file links Manual v3.0 into the existing repository architecture; it does not create a parallel specification series or supersede those sources.

No application runtime, database migration, provider integration, sensor connection, public passport, payment flow or production environment is claimed as implemented by this crosswalk.
