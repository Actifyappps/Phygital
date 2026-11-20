# Minimum-documentation operating model and pilot route selection

**Sources:** Deliverable 019 — Minimum-Documentation Operationalization Strategy; Deliverable 020 — Pilot Route Selection & Minimum-Documentation Feasibility Assessment.  
**Status:** Repository design crosswalk. No route or physical pilot is selected or authorised.

## Design principle

**Minimum documentation is not minimum control.** Capture information once, at the point it naturally arises, reuse it across outputs, and attach evidence to one batch identity. Keep producer-facing interaction short and assisted. Do not shift exporter, customs, certification, laboratory, insurance or payment-provider responsibilities to producers by default.

The marketplace is a coordination, evidence and buyer-connection layer. It does not become the exporter, legal seller, warehouse custodian, customs agent, laboratory, insurer or payment institution by default.

## Minimum viable evidence pack

The eight record groups are a proposed minimum internal evidence set for a controlled pilot rehearsal, not a universal legal export checklist.

| Record | Minimum content | Responsible source / owner | Reuse rule |
|---|---|---|---|
| A. Participant profile | Legal/operating name, contact, location, organisation type, responsible contact, available identity/registration evidence and transaction role | Each organisation once; reviewed by operator | Reuse until information changes |
| B. Authority and role confirmation | Producer, seller, exporter, site operator and provider capacities; permitted actions; mandate/agreement evidence | Relevant parties; operator records | Reuse until expiry, revocation or change |
| C. Product specification | Commodity, product form/grade, unit, buyer attributes, packaging basis and destination requirements | Buyer plus seller/exporter; operator structures | Reuse for equivalent offers where still valid |
| D. Batch record | Unique batch ID/QR, producer/origin, date, quantity/unit, aggregation point, capture method, evidence links and status | Producer/site contact; operator assists | One per batch; updated through events |
| E. Quality/evidence record | Required checks, competent person/provider, method, date, result, evidence and verification class | Competent person/provider | Linked to batch; avoid duplicate entry |
| F. Offer and quotation | Seller, buyer, listing/batch, quantity, unit, price/currency, validity, delivery and payment terms | Seller/exporter; operator records | Generated from existing product/batch records |
| G. Order and fulfilment record | Accepted quote, order quantity, allocation, delivery milestones and exception/dispute status | Parties; operator records | Derived from accepted quotation |
| H. Export/shipment dossier (conditional) | Invoice, packing list, customs declaration/entry, transport document, certificates/permits and destination-specific evidence | Exporter, clearing agent and competent providers | Only for a real export consignment |

Do not ask every producer to complete all eight records. A–E support participant, authority, product, batch and evidence foundations. F–G arise when buyer intent exists. H is conditional and belongs to the exporter and competent providers.

## One record, multiple outputs

The same authoritative records may generate a QR-linked buyer summary, intake receipt, product/offer sheet, seller-approved quotation draft, consolidated evidence index and exporter-facing shipment checklist. A QR page is a permission-filtered projection, not a certificate. It must not resemble or claim to be a government, laboratory or independent inspection certificate.

## Lean operating sequence and stop conditions

1. Qualify one producer group, one existing site, one prospective buyer and one product. Stop if credible supply, buyer requirement or responsible seller is absent.
2. Onboard each participant once and record authority relevant to the claimed role. Stop if authority cannot be evidenced.
3. Assign a batch identity; record quantity, unit, origin and date. Stop if identity, origin or quantity cannot be reconciled.
4. Perform only buyer-, commodity- and destination-relevant checks. Hold if required checks are missing or fail.
5. Generate the buyer-facing batch summary and offer. Never promote unverified claims.
6. Obtain seller/exporter approval of price, quantity, terms and validity. No binding order before authorised approval.
7. Rehearse allocation, packing, document assembly and shipment milestones. No physical dispatch or payment in a simulation.
8. Consider a live transaction only after the relevant regulatory, commercial, provider, custody and sponsor gates are satisfied.

## Three pilot maturity levels

| Level | What happens | What it can establish | What it cannot establish |
|---|---|---|---|
| 1 — Digital readiness rehearsal | Synthetic or properly authorised sample data; participant intake, sample batch, QR summary, quotation and simulated workflow | Usability, workflow, data capture and document reuse | Real supply, buyer willingness, physical quality or export readiness |
| 2 — Controlled physical batch demonstration | Observe and record one real batch at an existing site; no platform custody, live sale, payment or export dispatch; obtain buyer feedback | Real supply evidence, intake workflow, traceability and buyer relevance | Export clearance, live payment or shipment performance |
| 3 — Partner-led micro-export | Qualified seller/exporter executes a small real order; platform coordinates and records evidence without acting as exporter or holding funds | The specific end-to-end commercial/export transaction | Repeatability, scale or profitability beyond that transaction |

**Required progression: Level 1 → Level 2 → Level 3**, only after each level's gates. The phrase in 019 about using a small real batch record belongs to the Level 2 physical demonstration. It must not be imported into the synthetic-only Level 1 rehearsal specified by 020–023.

## Route selection scorecard (Deliverable 020)

Compare complete producer-to-buyer routes, not commodities or facilities in isolation.

| Criterion | Weight |
|---|---:|
| Identifiable producer supply and authority | 15 |
| Buyer relevance and written specification | 15 |
| Existing site suitability and permission | 10 |
| Seller/exporter and role clarity | 15 |
| Commodity/destination requirements | 15 |
| Quality and traceability practicality | 10 |
| Logistics and handling practicality | 5 |
| Payment and commercial feasibility | 5 |
| Low producer burden | 5 |
| Rehearsal and learning value | 5 |
| **Total** | **100** |

Score each criterion 0–4 and calculate (score ÷ 4) × weight. Record evidence source and date for every score. Mark unknowns **NE — not evidenced**; do not manufacture a total from missing data. A high score never overrides a failed mandatory gate.

### Mandatory gates

- **Gate A — Level 1:** synthetic/authorised sample data, explicit test roles, no physical stock/funds/binding orders/shipment, acceptance criteria, test log and named reviewer.
- **Gate B — Level 2:** identifiable producer and real batch; evidenced authority; written site permission; service-only site unless separate custody mandate; reconciled identity/quantity/unit/origin; competent checks; buyer feedback against written specification; no platform custody, sale, payment or dispatch.
- **Gate C — Level 3:** all Level 2 evidence plus resolved sponsor directions/conditions, qualified seller/exporter and providers under written roles, confirmed commodity/destination requirements, agreed buyer and commercial terms, licensed payment pathway, liability/title/custody/rejection/claims allocation and all required approvals before dispatch.

### Route decision rules

Prefer the existing site where product already moves; a qualified existing exporter; a service-only site; a small traceable batch; and the route with the lowest producer burden that still answers the test question. Missing buyer, producer, permission, seller/exporter or regulatory pathway means HOLD for the relevant higher level. A route may be rejected or deferred; the process must not force a winner.

## Current route position

Deliverable 020 records **NO ROUTE SELECTED**. Level 1 is the only route that can be prepared without further external evidence. Kericho and the example commodities remain hypotheses, not commitments. No producer group, site permission, buyer specification, seller/exporter, commodity/destination pathway or provider acceptance is evidenced as confirmed.

The current Level 1 v0.4 prototype is a candidate rehearsal aid. Its logic-harness results do not equal browser execution, completion of the 16 operator steps, independent review or EVI-21 acceptance. See `tests/prototypes/level1/README.md` and `evidence/level-1/README.md`.

## Technical implications

The digital system should support reusable organisation/participant profiles, scoped authority evidence, one batch identity with linked evidence, listing-to-batch backing, conditional document requirements, generated summaries/quotations, explicit reservation-versus-movement separation, provider/exporter-owned document references, an exception queue and an auditable capture/change history.

Do not build a large universal document-management workflow, blockchain layer, AI forecasting or complex escrow system into the minimum operating path without validated need and authority.

## Source links

- [019 Minimum-Documentation Operationalization Strategy](https://app.notion.com/p/4136808bcd9e8189bdeefc419a3f65f4)
- [020 Pilot Route Selection & Minimum-Documentation Feasibility](https://app.notion.com/p/4136808bcd9e81e291ddd6b90f91f3d1)
- [021 Level 1 Digital Readiness Rehearsal](https://app.notion.com/p/4136808bcd9e811884ecefe0f95c1a4a)
- [022 Level 1 Test Data Pack & Execution Workbook](https://app.notion.com/p/4136808bcd9e8135bdb8de63173fe192)
- [023 Level 1 Local Prototype & Operator Handover](https://app.notion.com/p/4196808bcd9e81cdbfede47869a9d464)
