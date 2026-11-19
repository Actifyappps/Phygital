# Product withdrawal, recall and trace-forward / trace-back

**Source:** 024-R F-04; 024-B, 024-C, 024-D, 024-E, 024-F, 024-G; 011 and 018-C.  
**Status:** Required product capability before any real-batch or shipment workflow; no live operation is authorised.

## 1. Core requirement
The system must be able to identify every downstream record affected by a source batch, evidence finding, product defect or authorised withdrawal/recall instruction—and trace each affected record back to its source. This is a cross-cutting integrity capability, not merely a dispute status.

## 2. Controlled actions
- Place a batch, listing, order, allocation or affected shipment on hold/quarantine/withdrawal.
- Record the initiating authority, reason, scope, evidence, effective time, urgency and review date.
- Prevent new publication, quotation acceptance, reservation, allocation or dispatch where the hold applies.
- Identify all linked and derived records, including split/merged batches, multiple listings, order lines, allocations, documents and shipment legs.
- Trace backwards from a shipment/order/listing to source batch, producer/source organisation, intake, measurements and evidence.
- Trace forwards from a source batch/evidence item to all listings, orders, allocations, recipients and shipment records.
- Record notices, acknowledgement, corrective action, reinspection/retest, release or final disposition.
- Preserve full history; correction or release is a new event, not deletion of the hold.
- Require authorised independent release; no automatic republishing after a hold expires.

## 3. Data relationships
Logical concepts: product-integrity case; hold/withdrawal instruction; affected-record relation; trace query/run; notification and acknowledgement; corrective action; disposition; release approval. Each relation needs source/target identity, relation type, effective scope, event and evidence references. The model must support lineage through batch split/merge and order-item/shipment-line allocations.

## 4. Authority and legal boundary
The platform coordinates and records actions by authorised parties. It does not declare a regulatory recall, certify a product unsafe, or override a competent authority. Exact terminology, notice duties, time limits and reporting rules must be configured only after commodity/destination and legal review.

## 5. Minimum acceptance scenarios
- Hold a batch and verify all affected listings become unavailable.
- Trace a source batch forward to every linked order, shipment and recipient.
- Trace a shipment backward to every source batch and supporting evidence.
- Split/merge a batch and preserve complete lineage.
- Prevent held stock from new reservation/allocation/publication.
- Attempt release by an unauthorised actor; deny and audit.
- Record correction/retest and require explicit authorised release.
- Replay a duplicate hold event; idempotent result.
- Handle partial shipment, returned goods and affected-only scope without over-withdrawal.
- Preserve historical snapshots and evidence when rules or statuses change.
