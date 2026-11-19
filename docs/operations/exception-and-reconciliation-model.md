# Operational exception and reconciliation model

Exceptions are first-class operational records, not informal notes.

## Core exception classes
- Identity, organisation membership or mandate mismatch.
- Evidence missing, conflicting, expired, altered or unverified.
- Product specification, unit, quantity or quality discrepancy.
- Intake/measurement/device/calibration failure.
- Batch identity, split/merge or traceability break.
- Inventory over-allocation, duplicate reservation or ledger mismatch.
- Quote version, price, fee, currency or order-line mismatch.
- Compliance rule unknown, expired, contradictory or not applicable.
- Document missing, invalid, rejected or revoked.
- Facility service failure, equipment failure, safety incident.
- Provider webhook, payment status or shipment milestone discrepancy.
- Listing abuse, impersonation, fraud concern or recall signal.
- Privacy/security incident, unauthorised access or data loss.

## Minimum case record
Case ID; category/severity; affected context/entity; detected time; reporter/source; accountable owner role; immediate containment; evidence; customer impact; decision and reason; approvals; communication; corrective/preventive action; linked defects; retest/reconciliation; closure reviewer and timestamp.

## Reconciliation
Compare independent source facts, not just two copies of the same record. Preserve discrepancies and corrections. High-impact actions require a human decision by a role with authority. A system may suspend, quarantine or flag automatically where approved, but must not invent a legal conclusion.
