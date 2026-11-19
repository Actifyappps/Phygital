# 024-B workflow and business-rule repository crosswalk

**Source:** 024-B v0.1 — End-to-End Workflow, State & Business Rules Catalogue.  
**Status:** Draft behavioural specification; not a database schema, approved SOP, production policy or build authorization.

## Workflow ownership

| Workflow | Name | Repository domain owners |
|---|---|---|
| WF-01 | Identity, organisation membership and authority | identity / organisations / authority / privacy |
| WF-02 | Producer and supplier onboarding | organisations / authority / supply / evidence |
| WF-03 | Product specification and commodity/destination rules | catalogue / compliance-rules |
| WF-04 | Batch declaration, intake and physical service event | supply / hub-services / measurement / inventory |
| WF-05 | Evidence review and verification | evidence / documents / authority |
| WF-06 | Listing creation, backing and publication | marketplace / inventory / authority / marketplace-trust |
| WF-07 | Buyer onboarding, enquiry and supply compatibility | buyer-requirements / marketplace / compliance-rules |
| WF-08 | Quotation creation, approval, version and acceptance | quotations-orders / commercial / authority |
| WF-09 | Order creation and order-line lineage | quotations-orders / commercial / inventory |
| WF-10 | Reservation, allocation and inventory movement | inventory / fulfilment / hub-services |
| WF-11 | Commercial terms, fees and service billing (conditional) | commercial / payment-status / authority |
| WF-12 | Documents, shipment dossier and milestone visibility | documents / fulfilment / compliance-rules |
| WF-13 | Direct payment status and reconciliation | payment-status / cases / audit |
| WF-14 | Withdrawal, recall, suspension and trace-back/trace-forward | product-integrity / evidence / inventory / marketplace / fulfilment |
| WF-15 | Trust, abuse, complaints, disputes and appeals | marketplace-trust / cases / authority |
| WF-16 | Offline capture, synchronisation and device lifecycle | offline-sync / identity / authority / audit |
| WF-17 | Exceptions, support, incidents and recovery | cases / audit / operations |
| WF-18 | Operational reporting, outcomes and pilot gates | measurement / audit / governance |

## Cross-cutting business rules

| Rule | Requirement | Implementation/verification note | Primary repository owner |
|---|---|---|---|
| BR-001 | Authentication is not organisational or legal authority | Server and database authorization; authority evidence | identity / authority |
| BR-002 | Default-deny; ambiguity, expiry, conflict or failed verification means deny/hold | Negative authorization tests | authority |
| BR-003 | Seller and exporter are distinct transaction capacities | Separate scoped authority records and permissions | authority |
| BR-004 | No automatic seller/exporter fallback | Explicit hold and sponsor/party decision | authority |
| BR-005 | Hub service does not imply custody, title, stock held, release or dispatch | Separate service and custody domains; custody disabled in baseline | hub-services / inventory |
| BR-006 | E1–E4 class semantics must match Framework 008 | Controlled enum and acceptance tests | evidence |
| BR-007 | Evidence acquisition type is separate from evidence class | Separate fields and reporting | evidence |
| BR-008 | Evidence acceptance is claim-, scope-, competence- and time-specific | Review provenance and expiry/revocation logic | evidence / documents |
| BR-009 | Declared, measured, eligible, reserved, allocated and dispatched quantities remain distinct | Typed quantities and ledger constraints | supply / measurement / inventory / fulfilment |
| BR-010 | Listing-batch backing is explicit and compatible; no double counting | Relationship constraints and concurrency tests | marketplace / inventory |
| BR-011 | One accepted quotation per pilot order | Unique/transaction validation | quotations-orders |
| BR-012 | Order item preserves accepted quotation-line and terms lineage | Immutable commercial snapshot | quotations-orders / commercial |
| BR-013 | Allocation is reservation only | Separate reservation and movement events | inventory |
| BR-014 | Physical movement requires separately authorized model and typed, attributable evidence | Disabled by default; movement ledger tests | inventory / fulfilment / hub-services |
| BR-015 | Buyer enquiry is not a purchase commitment or order | Distinct state machines | buyer-requirements / quotations-orders |
| BR-016 | Public listings expose no restricted personal/member data | Field-level privacy and access tests | marketplace / privacy |
| BR-017 | Rule/checklist versions and effective dates are preserved | Versioned rule records; stale-rule holds | compliance-rules |
| BR-018 | Product/batch withdrawal and recall trace backward and forward | Relationship graph and notification tests | product-integrity |
| BR-019 | Accepted commercial terms cannot be silently changed | Versioned snapshot and variation workflow | commercial / quotations-orders |
| BR-020 | Fees are disabled until approved commercial model and payer/trigger are defined | Feature gate; no fee obligation before approval | commercial |
| BR-021 | Platform never holds/releases funds under D-07 | Architecture, integration and security boundary tests | payment-status |
| BR-022 | Payment status is provider-sourced or clearly labelled participant-declared | Provenance and reconciliation tests | payment-status |
| BR-023 | Offline actions are allow-listed and revalidated on sync | Device, replay, conflict and idempotency tests | offline-sync |
| BR-024 | High-risk actions require online validation unless separately approved | Server-side stage/authority gate | offline-sync / authority |
| BR-025 | Corrections preserve original events and traceability | Append-only audit or equivalent immutable history | audit / evidence |
| BR-026 | Trust reports and allegations are not findings without review | Case workflow and appeal | marketplace-trust / cases |
| BR-027 | Support role does not inherit party authority | Permission and impersonation-denial tests | cases / authority |
| BR-028 | Operational metrics require definitions, denominator, owner and source | Metric governance | measurement |
| BR-029 | Software stages 0–4 and pilot levels 1–3 are separate axes | Separate fields and gate checks | measurement / governance |
| BR-030 | Synthetic test data must never be presented as real supply, buyer, partner or transaction evidence | Environment labels and test-data controls | tests / fixtures / evidence |
| BR-031 | No live trade, custody, funds handling or shipment without all applicable gates and recorded approval | Global transaction/phase guard | governance / all domains |
| BR-032 | A service catalogue/fee schedule is not enabled by draft or existence alone | Approval/version/activation gate | commercial |
| BR-033 | Participant data sharing is purpose-bound and minimally disclosed | Data-sharing record and access tests | privacy / authority |
| BR-034 | No user can approve their own authority, evidence submission or contested case | Separation-of-duties controls | authority / evidence / cases |

## State ownership and cross-context rule
Each workflow has one authoritative state owner. Other contexts may hold references, read models or projections, but may not create competing mutable status. Every transition must be connected to an authorised actor/capacity, preconditions, evidence and provenance, domain command/event, API contract, screen state, negative test and acceptance evidence.

## Two separate maturity axes
Software delivery stages 0–4 and pilot maturity levels 1–3 must remain separate fields and separate gate assessments. A software feature being built or tested does not imply the physical pilot has advanced; a pilot level does not imply software production readiness.

## Non-negotiable transaction constraints
- Seller and exporter capacities are distinct; no fallback.
- Hub service does not imply custody, title, stock held, release or dispatch.
- Evidence class E1–E4 follows Framework 008 and is separate from acquisition type.
- Declared, measured, eligible, reserved, allocated, moved and dispatched quantities remain distinct.
- Listing backing must be explicit and must not double count stock.
- One accepted quotation per pilot order; order items retain accepted quote-line and immutable commercial snapshot lineage.
- Allocation is reservation only.
- Direct buyer-to-seller payment; no platform-held funds, wallet or escrow.
- Unknown, expired or conflicting compliance evidence means HOLD/human review.
- Offline actions are allow-listed and revalidated; high-risk actions require online validation.
- Corrections preserve original events and history.
- Synthetic data is never presented as real trade or partner evidence.
