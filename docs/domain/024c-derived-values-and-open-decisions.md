# 024-C derived values, migration safeguards and unresolved decisions

**Source:** 024-C — Information Architecture, Domain Data Dictionary & Entity Relationship Specification v0.1, 19 November 2026.
**Status:** Design guidance and open-decision register only. Not a physical design approval or migration authorization.

## 1. Derived values and authoritative sources

All nine source-derived values and their authoritative inputs are preserved below.

## 8. Derived values and authoritative sources

| Value / concept | Authoritative inputs | Derived treatment | Must not be treated as |
| --- | --- | --- | --- |
| Listing offerable quantity | Eligible listing-batch backing; active reservations/allocations; policy | Transactionally derived aggregate by compatible unit | A free-text seller estimate |
| Batch available quantity | Authoritative movement ledger; eligible quantity; active reservations; holds | Reconciled balance/projection with provenance | A hub custody balance under service-only model |
| Order outstanding quantity | Accepted order item quantity; fulfilled quantities; accepted variations/cancellations | Derived by line and unit | A manually editable order header total |
| Shipment fulfilled quantity | Shipment fulfilment lines with responsible-party dispatch evidence | Aggregated by order item and batch | Allocation total or planned shipment |
| Payment status | Authenticated provider events and reviewed reconciliation; participant declarations clearly distinguished | State derived from event history and provider evidence | User click, browser redirect or screenshot alone |
| Evidence status | Evidence review records, class/type, scope, validity and revocation | Purpose-specific evaluation | Universal “verified” badge |
| Rule compliance | Applicable versioned rules, evaluations and supporting evidence | Contextual decision with reviewer and timestamp | Permanent product-level pass |
| Producer net proceeds | Approved transaction price, actual deductions, third-party costs and settlement evidence | Calculated only when complete and legally permissible | A guaranteed price or an assumed amount |
| Metric result | Approved metric definition, data source and denominator | Versioned calculation | Unqualified dashboard count |

---

## 2. Migration 001 / 018-C source-model reconciliation

All 22 source-table mappings from 024-C §10 are retained below as the logical reconciliation view. This does not replace 018-B's source column inventory or 018-C's conditional migration disposition.

## 10. Source-model reconciliation: Migration 001 and 018-C

018-C maps all 22 Migration 001 source tables to a conditional target model. 024-C extends that logical picture to include the audit P1 requirements allocated by 024-R and 024-B. It does not replace 018-B's column-level source inventory or 018-C's migration disposition.

| Migration 001 source table | Logical entities / domain in 024-C | Reconciliation note |
| --- | --- | --- |
| users | ENT-001 User identity; ENT-004 membership; ENT-005 role | Login identity is separate from authority. |
| organizations | ENT-003 Organisation; ENT-006 mandate; ENT-007 capacity | Do not infer seller/exporter/custodian from organisation type. |
| organization\_memberships | ENT-004 membership; ENT-005 role | Membership and role scope remain distinct. |
| hubs | ENT-008 hub; ENT-009 mandate | Service-only baseline; custody separate and disabled. |
| products | ENT-011 taxonomy; ENT-012 product; ENT-013 specification | Normalize taxonomy, specification versions and units. |
| listings | ENT-030 listing; ENT-031 backing | Explicit listing-to-batch relationship required. |
| batches | ENT-019 supply declaration; ENT-020 batch; ENT-021 source link; ENT-025 eligibility | Preserve source and physical batch lineage. |
| documents | ENT-028 document; ENT-029 review; ENT-026 evidence | Document metadata, evidence class and review status are distinct. |
| batch\_measurements | ENT-023 measurement; ENT-026/027 evidence | Preserve method, unit, instrument, source and claim scope. |
| quality\_inspections | ENT-024 sample/inspection; ENT-025 eligibility | Competence, standard, sample and scope are explicit. |
| buyer\_enquiries | ENT-032 buyer; ENT-033 requirement; ENT-034 enquiry; ENT-035 compatibility | Preserve enquiry and specification versions. |
| quotations | ENT-036 quotation; ENT-037 line; ENT-038 terms snapshot | Version and acceptance history required. |
| orders | ENT-039 order; ENT-041 variation; ENT-038 snapshot | One accepted quote per pilot order. |
| order\_items | ENT-040 order item | Must map to accepted quotation line. |
| batch\_allocations | ENT-042 reservation; ENT-043 allocation | Reservation only, not movement. |
| inventory\_movements | ENT-044 movement; ENT-045 reconciliation | Separate physical ledger; baseline custody constraints apply. |
| shipments | ENT-046 shipment; ENT-047 fulfilment line | Add order-item/allocation/batch lineage. |
| shipment\_events | ENT-048 milestone; ENT-050 event receipt where provider-sourced | Source and idempotency provenance required. |
| payment\_records | ENT-049 external payment | Direct buyer-to-seller boundary. |
| payment\_events | ENT-050 provider receipt; ENT-051 payment event; ENT-052 reconciliation | Provider namespace, signature verification and idempotency. |
| disputes | ENT-053 complaint; ENT-054 case; ENT-055 appeal | Separate trust reports, commercial disputes and appeal lifecycle as needed. |
| audit\_events | ENT-061 audit event | Append-only protection and coverage policy. |

### 10.1 Logical entities not represented as dedicated Migration 001 tables

The following capabilities require explicit logical representation even if they are eventually implemented through shared tables, controlled reference data, event streams or external systems:

- authority mandates and transaction-party capacities;
- hub service/custody mandates;
- data-sharing purpose records;
- versioned product specifications, destination/rule sets and evaluations;
- canonical units and conversion rules;
- supply declarations, source links, batch eligibility and evidence claim links;
- listing-batch backing;
- buyer profiles, structured requirements and compatibility assessments;
- quotation lines, acceptance snapshots and order variations;
- reservations separated from allocations;
- shipment fulfilment lines;
- provider event receipts and reconciliation records;
- trust reports, recall/withdrawal actions, appeals and offline device/sync records;
- metric definitions, metric observations, gate assessments and conditional commercial service catalogue.

These are logical requirements, not an instruction to create one physical table per entity. Physical normalization, event sourcing, external provider references and controlled reference data remain design choices.

---

## 3. Migration and backfill safeguards

All 12 source safeguards are preserved below.

## 11. Migration and backfill safeguards

This document does not authorize migration execution. Any future source-to-target mapping or migration must preserve these rules from 018-C:

1. Preserve existing primary keys and original source identifiers unless a reviewed exception is approved.
2. Preserve original timestamps and source values; do not overwrite historical meaning.
3. Map free-text units only through exact, reviewed and reproducible conversion rules. Ambiguous values enter a remediation queue.
4. Do not manufacture authority mandates from organisation type, membership, hub registration or free-text notes.
5. Do not manufacture listing-batch links or backing quantities from descriptions or inference.
6. Do not convert an existing allocation into a physical movement.
7. Do not infer shipment batch fulfilment where source records do not identify the dispatched batch.
8. Do not infer provider signature verification from a stored boolean without trusted verification provenance.
9. Preserve provider-scoped event identifiers; do not merge unrelated provider events.
10. Classify each transformed record as direct carry-forward, deterministic transform, evidence-backed enrichment or unresolved exception.
11. Produce per-entity counts, reconciliation totals, rejected-row counts, exception references and reviewer sign-off.
12. Never discard unresolved records merely to achieve a green migration result.

---

## 4. Unresolved logical and physical design decisions

All 14 source decisions DC-01–DC-14 are preserved below with interim treatment and resolution evidence needed.

## 12. Unresolved logical and physical design decisions

| Decision ID | Question | Safe interim treatment | Required resolution before physical design/implementation |
| --- | --- | --- | --- |
| DC-01 | One generic authority mandate model or specialized mandate entities? | Define common semantics; do not duplicate authority facts | Technical/security review with sample seller, exporter, inspector, hub and provider cases |
| DC-02 | Exact legal identity and capacity of pilot seller/exporter? | Separate records; hold where missing | Evidence and sponsor/legal approval for actual entity and scope |
| DC-03 | Are source members individually represented or only aggregated? | Aggregate/pseudonymise by default | Data-protection purpose and lawful-basis assessment |
| DC-04 | Is batch split/blend/merge permitted in pilot? | Do not assume; preserve parent/child model as conditional | Commodity/operational protocol and mass-balance rules |
| DC-05 | Which measurement units, precision and conversions apply? | Controlled unit vocabulary; no ambiguous conversions | Selected commodity specification and competent measurement protocol |
| DC-06 | How is offerable quantity calculated across multiple listings and reservations? | Enforce one authoritative capacity calculation; pilot one batch per listing where practical | Concurrency design and tested invariants |
| DC-07 | Which destination rules are authoritative and who maintains them? | Versioned rule records; stale-rule hold | Named competent sources/reviewers and rule update process |
| DC-08 | How are external document files stored, scanned and retained? | Private storage, metadata and access policy; no public bucket | Security, privacy, retention and backup design |
| DC-09 | Which payment provider and event contract will be used? | Provider-neutral interface; direct payment only | Provider due diligence, contract and authenticated event specification |
| DC-10 | How are shipment and partial fulfilment events reconciled to physical movement? | Explicit shipment fulfilment line and source evidence | Responsible exporter/carrier workflow and custody model |
| DC-11 | What is the approved commercial fee/service catalogue (planned dependency 025)? | No fee engine or payable obligation | Programme owner confirms 025 status; commercial, legal and tax review; approved payer/trigger/schedule |
| DC-12 | What is the final case taxonomy and separation of commercial dispute vs platform trust report? | Separate report, case, dispute and appeal concepts | Policy owner and legal/operational review |
| DC-13 | What retention, deletion, anonymisation and cross-border transfer rules apply? | No real participant data until approved controls | Data mapping, controller/processor assessment and specialist approval |
| DC-14 | What are the final software-stage and pilot-level gate owners/criteria? | Keep axes separate and gate decisions evidence-backed | Sponsor/programme approval and accountable role appointments |

---

## 5. Approval and execution boundary

These are unresolved questions and safeguards, not decisions made by the repository. Do not resolve them by assumption, silently create missing commercial/legal facts, or infer that documentation authorizes schema changes.

Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN. No live trade, custody, platform-held funds, escrow, payment execution or shipment is authorized.