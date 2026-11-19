# Domain data lineage and transaction snapshots

This is an implementation-facing checklist derived from 024-C, 024-B, 018-A and 024-R. It is not a physical schema.

## Required relationships
- Person ↔ organisation membership ↔ role/capacity ↔ mandate/authority ↔ scoped permission.
- Producer/source ↔ supply declaration ↔ product specification ↔ batch ↔ evidence/measurement.
- Batch ↔ inventory ledger entries ↔ reservations/allocations ↔ order item; prevent over-allocation under concurrency.
- Buyer requirement ↔ enquiry ↔ quotation version ↔ accepted quotation ↔ order ↔ order item.
- Each order item links to the accepted quotation line and immutable terms/fee snapshot.
- Order/batch ↔ document requirement ↔ document instance/version ↔ issuer and verification.
- Shipment/payment status events link to provider/buyer/seller references and source evidence.
- Withdrawal/recall case links to affected products, batches, orders, buyers, providers, evidence and actions.
- Service session ↔ facility capability ↔ operator mandate ↔ equipment ↔ evidence ↔ service fee record.

## Integrity requirements
Use explicit units and conversion rules; no silent rounding. Enforce non-negative balances, uniqueness/idempotency, valid state transitions, tenant/organisation scope, referential integrity and temporal validity. Allocation is reservation, not physical movement. Preserve reversals and compensating ledger events. Never infer seller/exporter equivalence. No wallet/escrow/platform settlement tables by default.

## Versioned commercial facts
At quote acceptance retain the accepted quote version, line values, currency, unit basis, Incoterm/delivery basis where relevant, fees, tax treatment reference, payer, payee, provider terms and effective schedule identifiers as reviewed. Later changes create a new version and cannot mutate a past order's commercial basis.
