# ADR-0006 Offline operation and synchronisation

**Status:** OPEN — no implementation strategy selected.  
**Context:** Level 1 rehearsal, minimum-documentation operation and 024-F identify offline/device/synchronisation risks.  
**Decision required:** define which workflows may operate offline, what is read-only, how local data is protected, and how commands reconcile when connectivity returns.

## Options to assess
- Online-only with explicit unavailable states.
- Read-only offline cache with no queued mutations.
- Narrow offline capture queue with signed/identified device, idempotency keys, expiry, local encryption, user/device binding and conflict review.
- Broader offline-first transaction processing (higher risk; not presumed for pilot).

## Mandatory criteria
No offline action may bypass authority, duplicate inventory allocation, create a false measurement, overwrite evidence, expose private documents, or silently resolve conflicting states. Local device role selection is never authentication. Replayed commands must be duplicate-safe and auditable. Device loss, clock drift, tampering, queue expiry, conflict and revocation must be addressed.

## Consequences
Do not implement offline write capability until data classification, device trust, local storage, key management, sync protocol, conflict policy and test evidence are approved.
