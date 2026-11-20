# 011 operating blueprint — service-stage to digital repository crosswalk

**Source:** Deliverable 011 — Pilot Operating Model & End-to-End Service Blueprint v1.0, current Project Home-linked record.  
**Status:** Proposed operating design for validation; not an approved SOP, implementation or live-pilot authority.  
**Purpose:** Translate the physical/digital service sequence into stable repository owners, controls and test obligations without treating a document stage as a separate application or service.

## End-to-end service-stage mapping

| Stage | Operating activity and authoritative records | Digital repository owner | Key gate / negative control |
|---|---|---|---|
| 0. Programme and participant readiness | Scope, participant roles, due diligence, agreements, licences, readiness gates and decision log | governance, identity, organisations, authority, partner-readiness | G0: critical roles, permissions, privacy and safeguards evidenced; otherwise HOLD/FAIL. Discovery and synthetic simulation may continue. |
| 1. Producer and seller onboarding | User, organisation, membership, producer/seller profile, consent/lawful-basis record, onboarding and training | identity, organisations, authority, privacy; producer surface | G1: identity and authority for the claimed role. No public identity documents or precise farm coordinates by default. |
| 2. Supply declaration and availability | Supply offer, dated quantity snapshots, commitments, production period and evidence | supply, inventory, evidence | G2: distinguish historical deliveries, physically available stock, forecast, committed and uncommitted potential. Forecast is never current inventory. |
| 3. Hub intake and batch creation | Batch, intake, measurement, sample, evidence, custody event only when custody transfers, movement and QR identity | hub-services, measurement, supply, inventory, evidence, public-projections | G3: exact site activity approved; reconcile identity/origin/quantity. A digital site is not automatically a warehouse or custodian. |
| 4. Quality assessment and product passport | Requirement/check, inspection, lab result, certificate reference, non-conformity, corrective action and passport version | measurement, evidence, documents, compliance-rules, public-projections | G4: buyer/destination-specific evidence sufficient. Issuer, scope, date and validity retained; no unsupported certification. |
| 5. Buyer discovery and qualification | Buyer profile/authority, enquiry, specification, RFQ, match candidate, screening and communications | buyer-requirements, marketplace, authority, cases | G5: distinguish enquiry/RFQ/LOI/purchase order. An enquiry is not a purchase commitment; matching is advisory. |
| 6. Quotation and negotiation | Versioned quotation/lines, price components, Incoterm reference, fee disclosure, seller approval and revisions | quotations-orders, commercial, authority | G6: seller-authorised and complete quote; disclose currency, unit, price, validity, delivery, payment, quality and claims terms. |
| 7. Order acceptance and stock reservation | Accepted order/lines, contract reference, inventory reservation/allocation, status and cancellation events | quotations-orders, inventory, fulfilment, commercial | G7: atomic reservation, no over-allocation, correct buyer/seller/product/unit/batch/quote lineage. Acceptance is not payment clearance or export permission. |
| 8. Export readiness and documents | Export case, document requirements, documents/approvals, customs/permit references, logistics booking and exceptions | documents, compliance-rules, fulfilment, partner-readiness | G8: responsible exporter/provider and competent sources confirm requirements. Never infer or fabricate official approvals. |
| 9. Payment instruction and reconciliation | Payment instruction/event, provider reference, settlement, reconciliation, refund/reversal and exception | payment-status, commercial, integrations, cases | G9: direct buyer-to-seller pathway through agreed bank/licensed provider; status backed by trusted evidence. No platform-held funds by default; screenshots/SMS alone are not cleared-funds proof. |
| 10. Dispatch, custody and tracking | Shipment/items, custody/handover, dispatch, customs, tracking, delivery, proof and exceptions | fulfilment, inventory, partner-readiness, evidence | G10: source/actor/time/reference/verification on each event; reconcile shipped quantity to allocation. Dispatch requires separate authority and evidence. |
| 11. Acceptance, settlement and closure | Buyer acceptance/rejection, claim/dispute, resolution, final reconciliation, fee/proceeds record and closure | cases, commercial, payment-status, inventory, measurement | G11: reconcile ordered/allocated/shipped/delivered/paid/claimed quantities and amounts. No silent history edits; open claims/discrepancies hold closure. |

The stages are one service journey with shared domain ownership. They are not eleven independently deployed applications. A domain owns each authoritative fact and state transition; other surfaces consume controlled projections.

## Cross-cutting engineering controls

- **Identity and isolation:** organisation/hub-scoped access enforced at trusted service/database boundaries; least privilege, separation of duties, sensitive-read/export audit and timely revocation.
- **Inventory:** forecasts, declarations, accepted stock, reservations, physical movements, custody and dispatch are distinct facts. Atomic allocation, idempotent release and ledger reconciliation are mandatory.
- **Evidence:** DECLARED, HUB-RECORDED, DEVICE-MEASURED and INDEPENDENTLY VERIFIED remain distinct. Every material fact has actor/source, time, method, scope and evidence.
- **Payment/documents:** provider references and issuer-owned documents are versioned and provenance-aware. The platform records status and evidence; it does not issue regulated certificates or hold funds.
- **Security/continuity:** tenant isolation, audit protection, private document access, data minimisation, offline retry/idempotency, backup/restore, incident handling and controlled access.
- **Exceptions:** holds, non-conformities, rejected quantities, payment reversals, shipment discrepancies, complaints and disputes have named owners, evidence, resolution and appeal paths.

## Minimum digital pilot scope from 011 §9

The proposed controlled-pilot scope includes user/organisation/role management; producer/seller and buyer profiles; supply declarations; batch/evidence labels and QR passport; versioned documents; enquiries/RFQs/quotes; orders/order lines; transaction-safe reservations and inventory ledger; manual payment status with provider reference/reconciliation; shipment/custody events; audit, exceptions and reporting; organisation/hub access isolation.

The following remain deferred until justified and separately approved: platform custody/escrow; smart-contract release; direct customs integration; blockchain anchoring; authoritative connected sensors; AI forecasts used for commitments; automated FX/payouts; multi-country scale; automated certification/compliance decisions.

## Required simulation coverage

Deliverable 011 identifies at least these simulation cases: forecast cannot create inventory; duplicate/overlapping batch review; concurrent over-allocation prevention; reservation expiry/release once; suspended batch cannot be reserved; expired certificate blocks export readiness; duplicate payment callback processed once; reversal creates a new event and pauses dependent workflow; cross-tenant access denied; hub operator cannot self-approve high-risk verification; unsupported manual shipment event remains unverified; replaced document preserves version history; offline retry does not duplicate batches/movements; physical count variance requires reason/evidence/approval.

These cases are design/test obligations, not proof of execution. Map them to the existing tests and evidence catalogue; do not create a second test system.

## Current boundary

The blueprint is suitable as a controlled design baseline, not live operation authority. Real contracting, custody, hub handling, payment integration, export, dispatch and shipment remain subject to separate partner, legal, regulatory, commercial, technical and sponsor gates. No named partner is assumed committed.

## Source

[011 Pilot Operating Model & End-to-End Service Blueprint](https://app.notion.com/p/dfe6808bcd9e82ebb7a201abdbb64836)
