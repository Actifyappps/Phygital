# Inventory integrity remediation matrix

**Sources:** Database & Inventory-Integrity Validation 002; 014; 015; 016; 017; 018-B/C; 024-B/C/G; 024-R.  
**Status:** Design and test obligations. Migration 001 remains HOLD; Migration 002 is not authorised.

| Finding | Required control / repository home | Required proof |
|---|---|---|
| DB-01 Allocation cross-record consistency | Batch, order item, product, seller, buyer, quote/listing and unit lineage; `packages/domain/inventory/`, `packages/domain/authority/` | Positive and negative relational tests; mismatch rejected |
| DB-02 Order/quote/listing/seller/buyer linkage | Accepted quote line and seller/buyer identities retained on order item | Referential and cross-organisation tests |
| DB-03 Concurrency not proven | Atomic reservation, row/serializable locking strategy, retry policy | Two-session concurrent over-allocation test and deadlock/retry evidence |
| DB-04 Movements not authoritative ledger | Append-only movement ledger; opening balance and derived balance reconciliation | Rebuild balance from ledger; discrepancy test |
| DB-05 Batch status vs accepted quantity divergence | State transition and quantity eligibility invariants | State/quantity matrix tests |
| DB-06 Unit compatibility/precision | Canonical unit, conversion provenance, precision/rounding policy | Cross-unit rejection/conversion and precision boundary tests |
| DB-07 Access control absent | Tenant/organisation/hub scoping and authority tuple | RLS/service-layer tests; cross-tenant negative tests |
| DB-08 Audit history mutable | Append-only audit, privileged access separation, integrity controls | Mutation denial, tamper detection and reviewer evidence |
| DB-09 Payment idempotency scope | Provider/account-scoped event identity and duplicate-safe processing | Same event replay and cross-account collision tests |
| DB-10 Shipment event provenance | Source, actor, reported/verified distinction, timestamp, provider ref, idempotency | Duplicate, spoofed, stale and unverified event tests |
| DB-11 Test coverage incomplete | Trace all requirements to 024-G test cases | Coverage report and missing-case register |
| DB-12 Migration controls incomplete | Versioning, checksums, preconditions, backup, rollback/recovery, environment isolation | Disposable PostgreSQL rehearsal and retained logs |

## Acceptance principles
- A passing schema test does not prove legal eligibility, quality acceptance, authority, physical custody or shipment.
- A reservation is not physical movement or dispatch.
- Payment/shipment status is source-specific and must not be promoted from an unverified event.
- Migration tests must run on a disposable isolated PostgreSQL instance; retain version, checksum, commands, output and reviewer.
- No real participant or commercial data until privacy, security and authorisation controls are approved and tested.
