# 024-D contract-to-workflow, data and test crosswalk

**Sources:** 024-D v0.1; 024-B v0.1; 024-C v0.1; 024-A v0.1b; 024-F v0.1; 024-G v0.1; 018-A D-01–D-07.  
**Status:** Logical traceability aid. Not endpoint schema, protocol selection, implementation, provider approval or test execution.

## 1. Purpose

The 65 logical operations in 024-D are preserved in `024d-logical-operation-catalogue.md`. This crosswalk connects those operations to their owning 024-B workflows, 024-C entities/relationships and relevant 024-G product acceptance tests.

The mapping is at logical contract-group level because 024-D does not assign stable IDs to each operation. Do not invent operation IDs or treat the illustrative names as final routes.

## 2. Contract group traceability

| 024-D section / operation count | Principal 024-B workflows | 024-C entities | 024-C relationships | Relevant QAT coverage | Contract focus |
|---|---|---|---|---|---|
| 5.1 Identity, organisation and authority (7) | WF-01, WF-02 | ENT-001–010 | REL-001–005 | QAT-001–005, QAT-025–026 | Principal, membership, mandate, seller/exporter capacity, self-approval, tenant and purpose scope |
| 5.2 Product, commodity and destination rules (6) | WF-03 | ENT-011–018 | REL-006–007 | QAT-006–007, QAT-012 | Versioned product/rule definitions, applicability, stale-rule holds, unit vocabulary |
| 5.3 Supply, batch, intake and physical service (6) | WF-04 | ENT-019–025 | REL-008–011 | QAT-008–012 | Source lineage, service-only hub, measurement provenance, quantity distinctions and eligibility |
| 5.4 Evidence and document management (7) | WF-05, WF-12 | ENT-026–029 | REL-011–012 | QAT-006–007, QAT-028, QAT-033 | Evidence class/type separation, claim scope, review independence, private files, expiry and revocation |
| 5.5 Marketplace listings and buyer demand (7) | WF-06, WF-07, WF-14, WF-15 | ENT-030–035, ENT-056 | REL-013–015, REL-028 | QAT-008, QAT-012–013, QAT-023–025, QAT-027 | Compatible batch backing, public-safe projection, enquiry/match separation, holds and trust reports |
| 5.6 Quotations, terms, acceptance and orders (6) | WF-08, WF-09 | ENT-006–007, ENT-036–041 | REL-016–020 | QAT-003–005, QAT-014–016 | Separate party capacity, versioned quote, exact acceptance, one quote per pilot order, immutable terms and order-line lineage |
| 5.7 Reservations, allocations, movements and fulfilment (6) | WF-10, WF-12, WF-14 | ENT-020, ENT-025, ENT-039–048, ENT-056 | REL-021–024, REL-028 | QAT-008–012, QAT-023–024, QAT-032 | Atomic reservation, no movement inference, typed movement, fulfilment lineage and recall holds |
| 5.8 External payment status and reconciliation (6) | WF-13 | ENT-049–052 | REL-025–027 | QAT-017–019, QAT-031–032 | Direct buyer-to-seller flow, provider authentication, idempotency, mismatch and reconciliation |
| 5.9 Trust, complaints, disputes, appeals and recalls (7) | WF-14, WF-15, WF-17 | ENT-053–058, ENT-056 | REL-028–029, REL-031 | QAT-023–028, QAT-031–033 | Report/case/finding/appeal separation, hold authority, traceability, secure evidence and recovery |
| 5.10 Offline capture and synchronisation (constrained requirements; no operation table) | WF-16 | ENT-001–002, ENT-059–061 | REL-030–031 | QAT-020–022, QAT-030 | Device lifecycle, allow-list, revalidation, idempotency, replay, conflict and safe local state |
| 5.11 Audit, reporting, readiness and commercial configuration (7) | WF-11, WF-17, WF-18 | ENT-038, ENT-057–065 | REL-031–034 | QAT-026, QAT-032–036 | Restricted audit, metric provenance, gate evidence, conditional fee schedule and operational exception history |
| **Total** | **WF-01–WF-18** | **ENT-001–ENT-065** | **REL-001–REL-034** | **QAT-001–QAT-036** | **65 logical operations plus constrained offline requirements** |

QAT references identify relevant product-level coverage, not a claim that one QAT case alone proves every operation. 024-F ST-01–ST-24 remain a separate security test catalogue and must be linked to exact contracts during implementation planning; do not renumber or merge them into QAT.

## 3. Contract design requirements inherited across every group

Each state-changing command and protected query must resolve, as applicable:

1. Authenticated principal and service identity; client-supplied role/tenant claims are not trusted.
2. Active organisation membership and resource/transaction scope.
3. Operational permission plus separate legal mandate/capacity where the action represents one.
4. Current resource state, expected version and applicable rule/terms version.
5. Required evidence references, class, acquisition type, claim scope and validity.
6. Idempotency key for retryable commands; same key with different payload must not silently mutate state.
7. Concurrency precondition for scarce quantity and other contested state.
8. Explicit quantity, unit, precision, currency and time semantics.
9. Safe response/error behaviour that does not disclose secrets, hidden policy internals or other-tenant records.
10. Audit, correlation, causation and provenance references.
11. Privacy classification, minimum disclosure and permitted consumers.
12. Retry, replay, provider outage, conflict, recovery and reconciliation behaviour.

Queries are not exempt from authorization. A public read is a deliberately allow-listed projection, not unrestricted access to the underlying record.

## 4. Event mapping and rules

The 77 candidate event names in `024d-domain-event-catalogue.md` are grouped by identity/authority, product/rules/supply, marketplace/commercial, reservation/movement/fulfilment, payment/cases and operations/governance.

- Events represent committed facts, not commands, requests or rejected attempts.
- Event envelope carries event ID/type, schema version, resource ID/version, occurred/recorded time, actor/service and organisation scope, correlation/causation, source and privacy classification.
- Consumers must tolerate duplicate delivery, replay and out-of-order arrival.
- A provider event receipt is not successful business reconciliation.
- Replaying an event must not create a second order, reservation, movement, payment confirmation or case action.
- No exactly-once end-to-end delivery claim is assumed.

## 5. Critical crosswalk checks before contract implementation

| Check | Required evidence | Blocking outcome |
|---|---|---|
| Authority and tenant | Positive/negative role-capacity and cross-tenant tests at API and database boundaries | Any unauthorized read/write or seller/exporter inference |
| Evidence and documents | Class/provenance, claim-scope, expiry/revocation, private access and malware test results | Unsupported verification or public/private data leakage |
| Listing and quantity | Backing compatibility, aggregate capacity and concurrency results | Double-counted or overstated offerable quantity |
| Quote and order | Exact accepted version, one accepted quote per pilot order, order-item/quote-line link | Mutable accepted terms or orphan/mixed quote order |
| Reservation/movement | Atomic reservation and explicit no-movement/no-dispatch tests | Allocation presented as custody, movement or dispatch |
| Provider/payment | Signature, timestamp, provider event identity, idempotency, mismatch and reconciliation evidence | Browser/screenshot/user declaration treated as provider confirmation |
| Offline | Allow-list, device revocation, current authority/rule revalidation, conflict and replay evidence | Stale or duplicate offline action changes authoritative state |
| Trust/recall | Case independence, hold propagation and trace-forward/back evidence | Affected supply remains publishable/allocatable or appeal lacks independence |
| Fee configuration | Sponsor-approved schedule, payer, trigger, tax/legal review and effective version | Draft fee creates payable obligation or platform balance |
| Audit/recovery/gates | Protected history, restore/reconciliation, evidence-linked gate decision | Missing lineage, unreviewed recovery or false gate pass |

## 6. Open decisions carried forward

API-OD-01–API-OD-12 remain open and are listed in `024d-contract-domain-map.md`. The operation-to-workflow mapping does not resolve API style, authentication provider, tenant enforcement design, event transport, file storage/scanning, offline trust, payment provider, export/lab/logistics integrations, commercial fees, data-controller/processor roles, rule authority or stage-gate authority.

The following boundaries remain unchanged:
- no framework, endpoint protocol, event broker or provider selected;
- no live credentials, live external integration or real participant data;
- Migration 001 HOLD; Migration 002 NOT AUTHORISED;
- EVI-21 OPEN / Closure Accepted NO;
- no live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment.

## 7. Implementation handoff

When the architecture and spike are separately authorized, assign stable contract IDs, define machine-readable request/response/error/event schemas, link exact 024-A permission tuples, bind each operation to domain commands and state transitions, and turn the above test requirements into executable contract/security/integration tests.

Until then, this crosswalk remains a technology-neutral design aid.
