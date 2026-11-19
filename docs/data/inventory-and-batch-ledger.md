# Inventory, batch lineage and movement ledger

## Separate quantity concepts
Declared supply, physically received quantity, measured quantity, quality-eligible quantity, available-to-offer quantity, reserved quantity, allocated quantity, physically moved quantity, dispatched quantity and reconciled quantity must not collapse into one mutable stock field.

## Batch lineage
Every listing allocation must trace to one or more compatible source batches. Compatibility rules include product/specification, grade, unit, origin, harvest/production period, quality status and any buyer/destination restrictions. Pilot baseline uses one batch where practical; multi-batch is a target capability only with tested lineage and no-double-counting controls.

## Reservation versus movement
Allocation is a reservation (D-06), not movement, custody, title transfer or dispatch. Physical movement is recorded separately with actor, authority, location, event time, quantity/unit, source/destination, evidence and reconciliation status. Hub service-only records do not imply the hub holds stock.

## Concurrency and integrity
- Enforce available-quantity checks in a serializable/atomic transaction or equivalent proven mechanism.
- Prevent over-allocation under concurrent requests.
- Make reservation creation, expiry, cancellation and release explicit and auditable.
- Enforce idempotency for retries and duplicate events.
- Do not permit negative available quantities except through a separately approved correction process.
- Preserve reversals and adjustments as ledger events; do not delete material history.
- Reconcile measurement units and conversions with explicit precision and rounding policy.
- Keep commercial quantity, physical quantity and document quantity distinguishable.

## Order lineage
One accepted quotation per pilot order. Every order item links to the exact accepted quotation line and preserves price, currency, unit, quantity, tax/fee basis and relevant terms as an immutable commercial snapshot. Later quote edits must not rewrite an accepted order.

## Migration implication
Any candidate schema must be checked for inventory movement ledger, reservation/allocation concurrency, batch allocation over-allocation, order-item-to-quote-line linkage and commercial snapshot completeness before migration approval. Migration 001 remains HOLD; no migration is authorised by this document.
