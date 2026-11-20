# Migration 002 — conditional design boundary and acceptance map

**Sources:** Deliverables 015, 016, 017, 018, 018-A/B/C; 024-B/C/D/F/G; DB-01–DB-12.  
**Status:** DESIGN INPUT ONLY. Migration 001 remains HOLD. Migration 002 is NOT AUTHORISED. This document does not create a migration script or approve schema changes.

## R-01–R-12 remediation requirements

| Finding | Priority | Required remediation | Primary control layer |
|---|---|---|---|
| R-01 Batch allocatability ignores ineligible states | P0 | Explicit allocatable states and active-hold checks at allocation time; reject invalid transitions | Database + service |
| R-02 Batch/listing/order consistency not guaranteed | P0 | Validate seller, product, unit, specification, listing, order item and source-batch lineage | Database + service |
| R-03 Inventory movement table is not a complete authoritative ledger | P0 | Typed movement model, append-only rules, atomic balance projection and reconciliation | Database + service + operations |
| R-04 Memberships do not provide complete tenant enforcement | P0 | Access matrix, server-side authorisation and RLS where appropriate | Identity + service + database |
| R-05 Audit history is not adequately protected/complete | P0 | Restrict mutation, define mandatory event coverage and privileged-access logging | Database + service + operations |
| R-06 Order/quotation/listing lineage is incomplete | P0 | Accepted quotation-line lineage and immutable commercial snapshot | Database + service |
| R-07 Concurrency and lock ordering unproven | P0 | Transaction boundaries, lock order, retry policy and conflict responses | Database + service |
| R-08 Unit fields are free text | P1 | Controlled unit catalogue, precision and commodity-specific conversion rules | Database + service + domain validation |
| R-09 Shipment events lack provider idempotency | P1 | Provider-scoped event IDs, processing ledger and duplicate/replay handling | Integration service + database |
| R-10 Payment signature verification is only represented by a boolean | P1 | Trusted provider adapter verifies signatures and records verification metadata/result | Integration service |
| R-11 Hub authority over producer goods is not established | P1 | Mandate, scope, validity and custody authority records; enforce permitted actions | Operating model + service + database |
| R-12 Event provenance is inconsistent | P1 | Standard event envelope and source/actor/reference contract | Service + database |

## Migration 002 candidate acceptance tests M2-01–M2-24

Every test requires an isolated disposable PostgreSQL environment and synthetic fixtures.

| Test | Scenario | Expected result |
|---|---|---|
| M2-01 | Allocate from recorded, under-review, rejected, closed or held batch | Rejected; no stock/order state change |
| M2-02 | Allocate from accepted eligible batch within capacity | Succeeds; reservation and audit/movement records atomic |
| M2-03 | Allocate batch from wrong seller/product/listing/unit | Rejected |
| M2-04 | Allocate to order item without accepted quote-line lineage | Rejected |
| M2-05 | Allocate same quantity concurrently from separate sessions | No over-allocation; request(s) fail cleanly |
| M2-06 | Two sessions allocate against same order-item capacity | Capacity never exceeded |
| M2-07 | Release/cancel allocation | Explicit release event; history retained |
| M2-08 | Ordinary role deletes/updates posted movement | Denied |
| M2-09 | Post compensating movement | Original retained; correction linked/reconciled |
| M2-10 | Compare ledger-derived quantity with cached balance | Exact reconciliation under defined precision |
| M2-11 | Unsupported unit or excessive precision | Rejected |
| M2-12 | Permitted conversion | Source, target, rule/version and actor retained |
| M2-13 | Tenant A reads/writes tenant B records | Denied under realistic non-owner role |
| M2-14 | Reuse pooled connection after tenant context changes | No tenant context leakage |
| M2-15 | Ordinary application role modifies/deletes audit history | Denied |
| M2-16 | Mandatory business transition omits audit event | Transaction fails or controlled contract prevents completion |
| M2-17 | Duplicate payment provider event | Processed once; duplicate safely acknowledged/ignored |
| M2-18 | Invalid payment signature | Rejected/quarantined; no payment state transition |
| M2-19 | Duplicate/reordered shipment events | No duplicate consequential transition; chronology/provenance retained |
| M2-20 | Intake/measurement/release without valid hub mandate | Rejected |
| M2-21 | Listing amended after order acceptance | Historical order terms unchanged |
| M2-22 | Deadlock or transient database conflict | Defined retry/error behaviour; no partial state |
| M2-23 | Failure between ledger and balance update | Entire transaction rolls back |
| M2-24 | Synthetic enquiry-to-order-to-allocation-to-mock-shipment workflow | Full traceability and reconciled quantities; no real-world side effect |

## Candidate schema change families
Subject to detailed review: controlled unit/conversion references; hub mandate/authority; movement types and reversal links; inventory balance projection/reconciliation; stronger lineage constraints; allocation eligibility/state transitions; provider event/idempotency records; audit protections; tenant-scoped RLS; immutable commercial snapshots. Do not add every candidate without schema/query analysis.

## Application controls that SQL cannot replace
Authentication and membership resolution; action-specific authorisation; provider-specific payment signature verification; webhook adapter/replay logic; external reconciliation; evidence/document review; hub mandate evidence and SOPs; commodity-specific rules; notifications/human approvals; privacy notices/lawful basis/retention; monitoring and incident response.

## Controlled delivery sequence
1. Reconcile technical R-01–R-12 with sponsor D-01–D-07; do not confuse the two ID series.
2. Map proposed changes to the 22-table Migration 001 source, constraints, triggers, indexes and service contracts.
3. Complete detailed table/column/key/state/permission/transaction/RLS/rollback design.
4. Obtain independent data, security, concurrency, privacy and operational review before SQL drafting.
5. Create a new versioned migration; preserve Migration 001 byte-for-byte.
6. Test clean install (001 then 002) and upgrade from a database at 001.
7. Run M2-01–M2-24 plus 014 regression tests with retained evidence.
8. Review residual risk; no unresolved P0 defect; only then recommend technical acceptance.

Technical acceptance does not authorise live trade. Separate sponsor, legal, regulatory, partner, facility, commercial and pilot readiness gates remain necessary.


## Reconciliation of Deliverables 016–018-C (source review: 20 November 2026)

The subsequent design set refines, but does not authorise, implementation:

- **016 — Migration 002 Design Decision Record:** proposed technical design decisions D-01–D-12 are a local technical question series. They are not sponsor decisions D-01–D-07 in 018-A. Sponsor D-01–D-07 were approved with conditions; the technical design and condition evidence remain open.
- **017 — Migration 002 Detailed Technical Design:** candidate table/service design only. It is not production SQL, an approved physical schema, implementation, PostgreSQL execution or acceptance. It remains subject to exact source inspection, technical review, condition checks and separate implementation approval.
- **018-B — Migration 001 Column Dictionary:** source-derived inventory of 22 tables and 230 declared columns. It is not a live PostgreSQL catalogue export.
- **018-C — Conditional Target ERD:** logical source-to-target mapping for all 22 source tables, candidate target entities and conditional relationships. It is not a final physical ERD or SQL specification. Its implementation gates G1–G8 separate source mapping and conditional design from sponsor-condition evidence, physical ERD, migration planning, SQL, controlled validation and technical acceptance.

### Corrected source table count

Deliverable 015 states that Migration 001 contains 20 tables. Deliverable 016 explicitly corrects that count: the source SQL contains **22 CREATE TABLE definitions**. Deliverable 018-B independently inventories all 22 tables and 230 columns. Use 22 as the reconciled source count; retain the 015 statement only as a superseded counting error, not as a second schema version.

### Conditional design principles carried forward

- Preserve Migration 001 unchanged as the historical candidate baseline; any future remediation is forward-only and versioned.
- Only explicitly accepted, eligible, non-held batches may be allocated. Recorded, under-review, on-hold, rejected and closed batches are not allocatable.
- Treat the append-only inventory movement ledger as the proposed authoritative stock history; any balance is a transactionally maintained projection reconciled to that ledger. Corrections use linked compensating movements, not silent edits.
- Preserve seller, exporter, producer, hub operator, custodian, marketplace operator and payment provider as distinct capacities/parties unless evidence and legal arrangements expressly establish otherwise.
- Preserve accepted quotation-line lineage and immutable accepted commercial terms on order items.
- Record hub mandates with exact permitted service/custody scope, validity and evidence. A hub record does not itself grant custody.
- Tenant isolation requires trusted service authorisation and appropriately designed database controls; client-supplied tenant context is not trusted.
- Payment and shipment events require provider/source identity, authenticity verification where applicable, idempotency, provenance and reconciliation.
- Do not backfill inferred mandates, listing-batch links, unit conversions or physical movements. Ambiguous historical data goes to a controlled remediation queue.

**Current disposition remains unchanged:** Migration 001 HOLD; CV-12 UNVERIFIED; Migration 002 NOT AUTHORISED. No SQL drafting, database execution or production deployment is authorised by this cross-source reconciliation.


## 018 parent schema-review metrics

The later 018 source-based static review reports 22 tables, 52 inline foreign-key references, 43 CHECK expressions, 4 table-level UNIQUE constraints, 18 explicit indexes and 3 trigger functions with 3 triggers. These are source-file inventory counts, not PostgreSQL runtime catalogue results. The 22-table / 230-column inventory is the reconciled source description. No SQL execution, concurrency test, API test or security test is claimed.
