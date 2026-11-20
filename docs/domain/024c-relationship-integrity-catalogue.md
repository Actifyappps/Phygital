# 024-C relationship, cardinality and integrity catalogue

**Source:** 024-C — Information Architecture, Domain Data Dictionary & Entity Relationship Specification v0.1, 19 November 2026.
**Status:** Draft conceptual/logical model for review. Not a physical ERD, database schema, migration or implementation authorization.

## 1. Relationship and cardinality catalogue

All 34 source relationships REL-001–REL-034 are preserved below. Cardinality is logical; multiplicity remains constrained by authority, scope, compatibility, uniqueness, lifecycle and transaction rules.

## 5. Relationship and cardinality catalogue

Cardinality is expressed at logical level. “Many” does not mean unrestricted; scope, uniqueness, compatibility and lifecycle constraints still apply.

| Relationship ID | Parent → child / association | Cardinality | Required integrity rule |
| --- | --- | --- | --- |
| REL-001 | User → organisation membership | 1 to 0..many | Membership is effective-dated and separately revocable. |
| REL-002 | Organisation → membership | 1 to 0..many | User may belong to multiple organisations. |
| REL-003 | Organisation → authority mandate | 1 to 0..many | Each mandate has capacity, scope, evidence, dates and status. |
| REL-004 | Organisation → party capacity assignment | 1 to 0..many | Capacity is transaction-scoped; seller/exporter separate. |
| REL-005 | Hub → service mandate | 1 to 0..many | Service scope does not imply custody. |
| REL-006 | Product → specification version | 1 to 1..many | Only one applicable version for a given scope/time; preserve historical versions. |
| REL-007 | Commodity/product scope → rule set | 1 to 0..many | Applicability and effective period are explicit. |
| REL-008 | Batch → source organisation link | 1 to 1..many | Actual source lineage retained; member details minimized. |
| REL-009 | Product/specification → batch | 1 to 0..many | Batch uses a defined specification version or records why none applies. |
| REL-010 | Batch → intake/service event | 1 to 0..many | Event identifies service provider/operator and mandate; no implicit custody. |
| REL-011 | Batch → measurement/sample/evidence | 1 to 0..many | Each item retains source, method, unit, time and scope. |
| REL-012 | Evidence → claim link | 1 to 1..many | Evidence supports only scoped claims; class and acquisition type separate. |
| REL-013 | Listing ↔ batch via backing | many-to-many | Explicit backing rows; compatibility and aggregate capacity enforced. |
| REL-014 | Buyer → enquiry | 1 to 0..many | Buyer representative authority scoped and recorded. |
| REL-015 | Enquiry → compatibility assessment | 1 to 0..many | Assessment records versioned inputs, result and reviewer/algorithm version. |
| REL-016 | Enquiry → quotation | 1 to 0..many | Quote versions linked to buyer, seller, enquiry and terms. |
| REL-017 | Quotation → quotation lines | 1 to 1..many | Line totals, units and accepted snapshot reconcile to header. |
| REL-018 | Quotation → acceptance snapshot | 1 to 0..many | At most one effective accepted version for the pilot order basis; history retained. |
| REL-019 | Accepted quotation → order | 1 to 0..1 per pilot order basis | One accepted quote per pilot order; multiple orders from one quote require explicit policy and remaining quantity rules. |
| REL-020 | Order → order items | 1 to 1..many | Every item maps to one accepted quote line. |
| REL-021 | Order item ↔ batch via reservation/allocation | many-to-many | Quantity limited by eligible supply and outstanding order quantity; no double counting. |
| REL-022 | Batch → inventory movement | 1 to 0..many | One authoritative physical ledger per batch; movement requires separately authorized physical event. |
| REL-023 | Order → shipment | 1 to 0..many | Partial/multiple shipments permitted only with exact fulfilment lineage. |
| REL-024 | Shipment → shipment fulfilment line | 1 to 1..many | Each line maps to order item, allocation and batch. |
| REL-025 | Order → payment record | 1 to 0..many | External payments only; provider and payer/payee explicit. |
| REL-026 | Provider → event receipt | 1 to 0..many | Unique provider-scoped external event identity; replay-safe. |
| REL-027 | Payment record → payment event/reconciliation | 1 to 0..many | Status changes have source/provenance and reconciliation history. |
| REL-028 | Batch/evidence/listing/order → recall or case | 1 to 0..many | Trace-forward and trace-back relationships must be queryable. |
| REL-029 | Case → appeal | 1 to 0..many | Independent reviewer and decision history. |
| REL-030 | Device → offline action | 1 to 0..many | Server revalidates allow-list, authority, state and idempotency on sync. |
| REL-031 | Entity/action → audit event | 1 to 0..many | Material actions are attributable and protected from ordinary mutation. |
| REL-032 | Metric definition → metric observation | 1 to 0..many | Calculation version and denominator are retained. |
| REL-033 | Gate assessment → evidence | many-to-many | Gate decision references specific accepted evidence and conditions. |
| REL-034 | Service catalogue version → fee record | 1 to 0..many only after activation | No fee obligation before approval and effective date. |

---

## 2. Logical integrity invariants

All 36 source invariants are preserved below. They describe business/data integrity outcomes; later physical design may require a combination of database constraints, transactions, policy evaluation, application services and independent reconciliation.

## 7. Logical integrity invariants

These are model-level constraints that later physical design and application services must enforce. Some require transactional logic, database constraints, policy evaluation or independent reconciliation; a simple foreign key is not sufficient.

### 7.1 Identity, authority and tenant scope

1. A user identity, organisation membership, operational role and legal/contractual mandate are distinct records.
2. No authority is inferred from organisation type, membership role, account status or prior transaction.
3. Seller and exporter capacities require separate authority evidence, validity and scope checks.
4. A transaction records the actual seller, exporter, buyer, source and service providers in their respective capacities.
5. Every read/write is scoped to an authorized organisation, transaction, purpose and role. Cross-tenant access is denied by default.
6. A mandate expiry, suspension or revocation blocks future dependent actions; historical transactions retain the authority snapshot used at the time.
7. No actor may approve their own authority, evidence submission or contested case.

### 7.2 Product, batch, evidence and rules

8. Every batch has a stable identity and source lineage; split/blend operations, if ever permitted, preserve parent-child traceability and mass-balance rules.
9. A batch's declared, measured, eligible, reserved, allocated and dispatched quantities are distinct concepts.
10. Every measurement has unit, method, source/operator, time and relevant calibration/provenance.
11. E1–E4 evidence strength and acquisition type are separately stored and reported.
12. Evidence acceptance is claim-, scope-, competence- and time-specific; it is not a universal verification flag.
13. Mandatory rule/checklist evaluations reference the exact version and applicability context. Stale or withdrawn mandatory rules cause a hold.
14. Product/specification and rule changes do not silently rewrite historical listings, quotations, orders or dossiers.

### 7.3 Listing, quotation and order

15. A listing's offered quantity is derived from eligible compatible backing, less applicable active commitments; it is not an independent unbounded assertion.
16. Total live backing/commitment across listings cannot exceed eligible available batch quantity.
17. Public projections exclude restricted personal, member-level, authority and commercially confidential data.
18. An enquiry is not an order; a match is not a purchase commitment.
19. A quotation records the seller and buyer capacities, currency, validity, line details and terms version.
20. The accepted quotation snapshot is immutable; changes require a variation and counterparty acceptance.
21. One pilot order references one accepted quotation. Every order item maps to an accepted quote line with consistent party, product, quantity, unit, price and currency.
22. No platform operator is substituted as seller or contracting party without a separately approved role/authority decision.

### 7.4 Reservation, movement and shipment

23. Reservation/allocation is not a physical movement, custody transfer, title transfer or dispatch.
24. Allocation must be atomic and cannot exceed eligible uncommitted batch quantity or outstanding order-item quantity.
25. Inventory movements are typed, signed, attributable, evidenced and idempotent; corrections use reversal/compensating events.
26. No hub custody event is enabled under the service-only baseline.
27. Shipment fulfilment links each dispatched quantity to an order item, allocation and exact batch.
28. Shipment milestones preserve source/provider, event ID, time and evidence; the status label must not overstate what the source proves.

### 7.5 Payments, cases, offline and audit

29. Payment records reference external buyer-to-seller transactions. No platform wallet, pooled funds, escrow, release or payee substitution is represented.
30. Provider event identity is unique within provider namespace; callbacks are authenticated, replay-safe and idempotent.
31. Participant-declared payment is not provider-confirmed payment.
32. Recall/withdrawal can trace from affected evidence or batch to listings, enquiries, quotations, orders, allocations, shipments and recipients, and back from a complaint/order to source.
33. Allegation, interim hold, investigation finding, resolution and appeal are separate facts.
34. Offline action is accepted only if allow-listed and revalidated against current server state, authority, rule version and idempotency key.
35. Material events are auditable; ordinary application roles cannot alter or delete protected audit history.
36. Commercial fee records cannot exist as payable obligations unless a separately approved schedule is effective and the defined trigger is met.

---

## 3. Interpretation boundary

- The catalogue does not prescribe one table per entity, microservices, ORM models or a selected database.
- Many-to-many associations with business facts require explicit association records rather than implicit arrays or free-text references.
- A relationship cardinality does not itself grant authority or permit a physical action.
- Invariants must be converted into testable acceptance criteria and evidence before implementation acceptance.
- The 018-C source-to-target migration disposition remains separately governed; no target mapping or migration is authorized by this conceptual catalogue.

Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN.