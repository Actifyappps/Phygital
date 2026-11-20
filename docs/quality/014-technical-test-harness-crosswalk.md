# Deliverable 014 — technical test harness and end-to-end simulation crosswalk

**Notion source:** [014 — Technical Test Harness & End-to-End Simulation Specification](https://app.notion.com/p/4136808bcd9e81e0bb13f2ea26004dd1)  
**Source status:** Execution-ready test specification; not evidence of execution  
**Repository review:** 20 November 2026

## 1. Disposition

This source is a test-execution contract. It is distinct from 024-G's product-wide quality strategy and the 021–023 Level 1 operator rehearsal. It gives the database and workflow test layers a concrete synthetic fixture, execution order, stop rules, result vocabulary and evidence-report structure.

Repository homes:
- `tests/unit/`, `tests/integration/`, `tests/e2e/`, `tests/contracts/` — executable suites when implementation exists.
- `tests/fixtures/` and `fixtures/synthetic/` — synthetic fixtures only.
- `tests/acceptance/` — acceptance mappings.
- `evidence/test-runs/` — retained raw execution output and reports.
- `docs/data/` — schema/migration review and data-integrity boundaries.
- `docs/security/` — tenant isolation, role enforcement and audit controls.
- `docs/quality/` — execution and acceptance crosswalks.

## 2. Required environment and safety boundary

A valid database run requires:
- dedicated isolated PostgreSQL instance and fresh disposable database;
- exact candidate migration and smoke/constraint test files, with versions/checksums;
- database version, environment identifier and least-privilege operator access;
- named operator and independent reviewer;
- controlled location for full logs, SQL output, screenshots where useful and report.

Use synthetic identities, organisations, commodities, batches, orders and events only. Do not connect production services, payment gateways, real messaging, shipment booking or real participant data. Stop immediately if the database cannot be positively identified as disposable or production credentials/endpoints appear.

Migration 001 remains **HOLD**. This specification does not authorise its execution, and it does not authorise Migration 002. Actual execution requires the separately governed migration decision and approved environment.

## 3. Required test layers

| Layer | Scope | Minimum retained evidence |
|---|---|---|
| T0 Environment | Database identity, version, isolation, permissions | Environment record |
| T1 Migration | Fresh install and object creation | Full output and catalogue checks |
| T2 Constraints | Required fields, foreign keys, uniqueness, checks, invalid values | Positive/negative results |
| T3 Inventory integrity | Movements, balances, allocations, concurrency, rollback | Before/after balances and transaction logs |
| T4 Batch lifecycle | Allowed and forbidden state transitions | Transition matrix and results |
| T5 Access control | Organisation/hub scoping and role permissions | Positive and negative access results |
| T6 Audit and events | Audit protection, event provenance and duplicate handling | Event records and audit evidence |
| T7 Workflow simulation | Listing → quotation → order → allocation → mock shipment | End-to-end run and reconciled dossier |
| T8 Recovery | Failure injection, rollback, retry and reconciliation | Recovery results and residual defects |

Run in dependency order. A critical failure in an earlier layer blocks dependent layers. Do not mark skipped later layers as passed.

## 4. Synthetic arithmetic fixture

The source fixture is test-only:
- Organisation A and Organisation B (tenant-separation test), Hub A, two synthetic producers, synthetic buyer and test roles.
- 600 kg + 400 kg intake = 1,000 kg gross.
- 50 kg quality rejection = 950 kg net eligible.
- 900 kg listing leaves 50 kg eligible but unlisted.
- 700 kg order/allocation leaves 250 kg eligible and unallocated.
- Attempting to allocate 901 kg against a 900 kg listing must fail without changing balances.

The fixture tests reconciliation and must not be interpreted as real supply, a selected commodity or available stock. Do not double-count a derived balance and the ledger movements that produce it.

## 5. Critical test families

| Family | Required assertions |
|---|---|
| Database structure | Fresh migration, expected tables/keys/constraints/indexes/relationships |
| Data validation | Required fields, uniqueness, non-negative quantities, supported units |
| Inventory | Correct movement arithmetic, over-allocation rejection, concurrent allocation safety, atomic rollback |
| Batch lifecycle | Allowed transitions succeed; forbidden transitions are rejected or require authorised review |
| Tenant and hub isolation | Cross-organisation reads/writes and out-of-scope hub actions are denied |
| Audit | Critical actor/time/action/context retained; ordinary users cannot alter protected history |
| Events | Duplicate payment/shipment identifiers have no duplicate effect; untrusted provenance is rejected or quarantined |
| Workflow lineage | Listing links to batch; quote to requirement/listing; order items to accepted quote lines; mock dossier reconciles |
| Recovery | Failure, retry, cancellation, rejection and rollback leave consistent state |

Every test case must have a unique run identifier and actual result: **PASS, FAIL, BLOCKED or NOT RUN**. PASS requires the expected outcome and retained evidence.

## 6. Execution protocol and test report

The execution record must include:
- run ID, environment/database identifier and PostgreSQL version;
- migration and test-script versions/checksums;
- run date/time/timezone, operator and independent reviewer;
- planned/run counts and PASS/FAIL/BLOCKED/NOT RUN counts;
- P0 failures, defects and linked IDs;
- evidence folder/reference and reviewer decision/date.

Overall results:
- **PASS:** all required P0 tests passed, evidence complete, no unresolved critical defect, reviewer accepts.
- **FAIL:** a required P0 test failed or a critical integrity/security defect remains.
- **BLOCKED:** prerequisites unavailable, so no valid conclusion.
- **PARTIAL:** some bounded tests passed but required later work remains; never equivalent to acceptance.

Critical defects include cross-tenant exposure, over-allocation, incorrect stock balance, audit tampering, duplicate financial effect, unsafe funds handling and misleading verified/export-ready status. P0 cases cannot be waived informally.

## 7. Evidence Register links and closure discipline

The source maps:
- CV-06 — cross-record allocation consistency;
- CV-07 — role matrix and tenant isolation;
- CV-08 — authoritative ledger and atomic allocation lifecycle, including concurrency;
- CV-09 — state, unit and precision rules;
- CV-10 — protected critical audit history and mandatory events;
- CV-11 — payment/shipment provenance and duplicate handling;
- CV-12 — Migration 001 and full PostgreSQL acceptance suite;
- E-021 — simulated transaction and mock shipment dossier.

CV-12 remains UNVERIFIED until the migration and full acceptance suite have actually run against PostgreSQL, output is retained, failures are resolved or formally dispositioned, and an independent reviewer accepts the evidence. E-021 remains open until the full simulated transaction and dossier are generated, reconciled and reviewed.

A written specification, schema review, mocked-DOM logic harness or repository commit does not close these items. A technical PASS also does not establish buyer demand, producer capacity, hub readiness, export compliance or commercial viability.

## 8. Preconditions to execution

Before actual execution, confirm the authoritative migration SQL, matching test SQL, database acceptance checklist, isolated PostgreSQL environment, operator and independent reviewer. Inspect the real schema and align test cases to actual table/column names before running. Retain full outputs and preserve failures/blocked cases.

## 9. Repository acceptance

- [x] Test layers, synthetic fixture, core integrity assertions and report structure mapped.
- [x] Separation from product-wide QA and Level 1 browser rehearsal clarified.
- [x] Migration and production safety boundaries preserved.
- [ ] No PostgreSQL execution or test acceptance is claimed by this document.
- [ ] CV-06–CV-12 and E-021 remain governed by the live Evidence Register.
