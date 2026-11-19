# ADR-0008 Physical–digital event integrity

**Status:** OPEN — event authority model requires design review.  
**Context:** Phygital links digital records to real-world goods, facilities, measurement and shipment events. A digital record must not invent a physical or legal fact.

## Decision required
Define event sources, evidence strength/provenance, device/operator identity, time and location confidence, corrections, attestations, independent verification, and dispute handling for physical events.

## Mandatory criteria
- Distinguish declared, observed, device-measured, independently verified and provider-reported events.
- Record actor, capacity, method, source, time, relevant device/calibration, evidence and limitations.
- Never infer custody, title, stock release, dispatch, certification, customs clearance or payment settlement from a weaker event.
- Correct with linked compensating events; preserve original history.
- Define replay/idempotency, offline clock drift, conflicting event order and human review.
