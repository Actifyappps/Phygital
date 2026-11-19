# Exception and reconciliation management

## Exception classes
Authority/qualification; evidence authenticity/expiry; batch identity; quantity/unit; allocation concurrency; physical measurement; document completeness; quote/order mismatch; payment-status mismatch; provider callback; shipment milestone; offline sync; privacy/security incident; system availability.

## Required case record
Unique case ID, type/severity, affected organisations and records, detected-at, source, evidence, current safe state, owner role, due/next action, communication record, resolution, reviewer and closure evidence.

## Safe-state rules
- Ambiguous authority: deny/hold affected action.
- Quantity mismatch: stop dependent reservation/fulfilment; reconcile against source evidence.
- Duplicate or out-of-order provider event: quarantine and reconcile.
- Payment-status disagreement: show unresolved; do not infer funds received.
- Missing shipment evidence: show milestone unknown; do not mark dispatched/delivered.
- Sync conflict: preserve both versions and require domain-specific resolution.
- Security/privacy incident: follow incident response, preserve evidence and restrict access as needed.

Close an exception only after a reviewer accepts the resolution evidence. Corrections must retain the original event and link the compensating record.
