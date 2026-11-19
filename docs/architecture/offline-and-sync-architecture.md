# Offline capture and synchronisation architecture

## Required behaviour
Field and hub workflows must remain usable under intermittent connectivity without creating conflicting or falsely authoritative records.

## Design requirements
- Offline-capable actions are explicitly allow-listed; sensitive approvals, authority grants, commercial acceptance and externally verified claims may require connectivity or controlled re-review.
- A client-generated operation ID and device/session context support duplicate detection.
- Local queued records are visibly marked **pending sync**, never presented as server-accepted or independently verified.
- Server remains authoritative for permissions, current state, quantity availability, commercial snapshots and final acceptance.
- Synchronisation is idempotent and ordered where domain dependencies require it.
- Conflict policy is domain-specific: reject, merge non-conflicting metadata, or create a review task; never silently overwrite a material fact.
- Attachments are checksum-verified, size/type constrained and scanned before trusted use.
- Clock skew, stale permissions, revoked membership, expired mandate and changed batch/order state are handled explicitly.
- User receives clear sync result, retry status and human-readable resolution path.
- Audit trail preserves original capture time, server receipt time, actor, device context and correction history.

## Required tests
Duplicate replay; out-of-order operations; offline role revocation; expired authority; concurrent allocation; upload interruption; checksum mismatch; device clock skew; stale quotation; changed batch status; conflict resolution; app restart and lost connectivity.

No offline queue may authorise dispatch, custody, payment, export or a state transition prohibited by current programme gates.
