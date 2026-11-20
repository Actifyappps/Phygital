# 024-B / 024-C workflow-to-logical-model integrity review

**Snapshot:** 20 November 2026  
**Sources:** Notion 024-B v0.1 (19 November 2026); Notion 024-C v0.1 (19 November 2026); 024-R; 024-A; 018-A D-01–D-07; Framework 008; Evidence Register protocol.  
**Status:** Source-to-repository and cross-specification reconciliation. Draft requirements only. Not logical-model approval, physical-schema approval, implementation evidence, test execution or migration authorization.

## 1. Purpose

024-B defines the observable workflow, states, guards, events, surfaces and acceptance expectations. 024-C defines the conceptual entities, relationships, integrity invariants and derived-value authority. This review checks that the repository represents their connection as one coherent digital product.

The authoritative chain is:

**Governing decision / requirement → WF / BR → actor and authority → state transition and stop condition → logical entity / relationship / invariant → command or event contract → screen → test → retained evidence.**

Repository context names are conceptual ownership boundaries. They do not prescribe one table per entity, microservices, ORM models or a selected technology.

## 2. Source coverage confirmed

| Source element | Notion source | Repository representation | Verification boundary |
|---|---:|---|---|
| 024-B workflows | WF-01–WF-18 (18) | `docs/product/workflow-to-context-crosswalk.md`; `docs/product/workflow-state-index.md`; domain homes | All workflow IDs and names are mapped; this does not prove all transitions are implemented |
| 024-B business rules | BR-001–BR-034 (34) | Workflow crosswalk; authority, evidence, commerce, inventory, privacy and trust homes | All IDs and rule statements represented in the crosswalk |
| 024-B domain state inventory | 24 state-owning domains | Source remains authoritative; workflow/state and screen-state indexes provide navigation | Exact state semantics must be carried into contracts and tests; no generic status column |
| 024-B cross-workflow stop conditions | 17 conditions | Workflow crosswalk; domain constraints; quality/security test homes | Stop conditions require executable negative tests before implementation acceptance |
| 024-B traceability/acceptance matrix | 18 workflow rows | Workflow crosswalk; 024-G crosswalk and test catalogue | Requirement-to-test plan exists; no execution inferred |
| 024-B interface coverage | Six surfaces | `docs/product/end-to-end-product-realization-map.md`; surface and screen catalogues | Surface coverage is represented; no UI implementation implied |
| 024-C conceptual entities | ENT-001–ENT-065 (65) | `docs/domain/024c-entity-to-context-crosswalk.md` | Exact ID/name comparison passed |
| 024-C relationships | REL-001–REL-034 (34) | `docs/domain/024c-relationship-integrity-catalogue.md` | All relationship rows represented |
| 024-C integrity invariants | 36 | Same relationship/integrity catalogue | All numbered invariants represented; physical enforcement not established |
| 024-C derived values | Nine | `docs/domain/024c-derived-values-and-open-decisions.md` | Source rows represented; calculations not implemented |
| 024-C source-model mapping | 22 Migration 001 tables | Same derived-values/migration document; 018-C conditional ERD | Logical mapping only; Migration 001 remains HOLD |
| 024-C migration safeguards | 12 | Same derived-values/migration document | Safeguards represented; no migration execution |
| 024-C open design decisions | DC-01–DC-14 (14) | Same derived-values/migration document | Open decisions remain open; no inferred resolution |

The 024-C source-verification record is `docs/quality/024c-entity-catalogue-verification.md`. It records the 65/65 entity ID/name comparison and the expanded source-section reconciliation. That record expressly does not claim full logical-model acceptance.

## 3. WF-to-entity and relationship crosswalk

The following mapping is a repository-level integration aid derived from the two source catalogues. It does not create new source IDs or alter authoritative ownership.

| 024-B workflow | Principal 024-C entities | Related 024-C relationships | Critical integrity themes |
|---|---|---|---|
| WF-01 Identity, organisation membership and authority | ENT-001–010 | REL-001–005 | Identity, membership, role, mandate, party capacity and hub service mandate remain distinct; seller/exporter are separate |
| WF-02 Producer and supplier onboarding | ENT-003–004, ENT-010, ENT-019–021 | REL-001–004, REL-008 | Organisation representation, purpose-bound data sharing and source lineage |
| WF-03 Product specification and commodity/destination rules | ENT-011–018 | REL-006–007 | Versioned specifications, rule scope/effective dates, canonical units and conversions |
| WF-04 Batch declaration, intake and physical service event | ENT-019–025 | REL-008–011 | Batch/source lineage; measured versus declared quantity; service-only hub boundary |
| WF-05 Evidence review and verification | ENT-026–029 | REL-011–012 | Evidence class E1–E4 separate from acquisition type; claim scope, competence, review and expiry |
| WF-06 Listing creation, backing and publication | ENT-006–007, ENT-020, ENT-025, ENT-030–031 | REL-003–004, REL-009, REL-013 | Seller authority; eligible compatible batch backing; no double counting or restricted disclosure |
| WF-07 Buyer onboarding, enquiry and supply compatibility | ENT-032–035 | REL-014–015 | Buyer authority, versioned requirements and compatibility; enquiry is not an order |
| WF-08 Quotation creation, approval, version and acceptance | ENT-006–007, ENT-036–038 | REL-016–018 | Seller/buyer capacity, quotation lines, terms version and immutable acceptance snapshot |
| WF-09 Order creation and order-line lineage | ENT-036–041 | REL-019–020 | One accepted quote per pilot order; each order item traces to its accepted quote line |
| WF-10 Reservation, allocation and inventory movement | ENT-020, ENT-025, ENT-039–047 | REL-021–024 | Atomic reservation/allocation, quantity constraints, movement separation and shipment fulfilment lineage |
| WF-11 Commercial terms, fees and service billing | ENT-038–041, ENT-065 | REL-034 | Fee schedule only after approval/effective date; no payable obligation before approved trigger |
| WF-12 Documents, shipment dossier and milestone visibility | ENT-028–029, ENT-046–048 | REL-023–024 | Responsible-party authority, source/issuer provenance and no dispatch inference from allocation |
| WF-13 Direct payment status and reconciliation | ENT-039, ENT-049–052 | REL-025–027 | Direct buyer-to-seller funds flow; authenticated provider events; idempotency and reconciliation |
| WF-14 Withdrawal, recall, suspension and trace-back/trace-forward | ENT-020, ENT-026–031, ENT-039–048, ENT-056 | REL-028 | Trace affected evidence/batches through listings, orders, allocations and shipments; holds propagate |
| WF-15 Trust, abuse, complaints, disputes and appeals | ENT-053–055, ENT-057 | REL-028–029 | Allegation, interim hold, finding, resolution and independent appeal are distinct |
| WF-16 Offline capture, synchronisation and device lifecycle | ENT-001–002, ENT-059–060, ENT-061 | REL-030–031 | Device identity is not human authority; allow-list, revalidation, idempotency and conflict review |
| WF-17 Exceptions, support, incidents and recovery | ENT-057–061 | REL-031 | Named ownership, controlled recovery and attributable immutable history |
| WF-18 Operational reporting, outcomes and pilot gates | ENT-061–064 | REL-031–033 | Metric definitions/denominators, evidence-backed gate decisions and separate software/pilot axes |

## 4. Cross-specification integrity checks

### 4.1 Authority and legal capacity

- 024-B WF-01, WF-06, WF-08 and WF-12 rely on 024-C ENT-006/007 and REL-003/004.
- Seller and exporter must remain distinct scoped capacities; the same organisation may hold both only where separate evidence supports both.
- A membership, operational role, login or organisation profile must not manufacture legal authority.
- A transaction must preserve the actual seller, exporter, buyer, source and provider capacities used at the relevant time.
- Expiry, revocation and scope mismatch block future dependent actions; historical decisions retain their authority snapshot.

**Required verification:** table-driven seller-only, exporter-only, dual-capacity, expired, revoked, out-of-scope, cross-organisation and self-approval-denial tests at API and data-access boundaries.

### 4.2 Evidence and physical supply

- 024-B WF-04/WF-05 and 024-C ENT-019–029, REL-008–012 require separate source, batch, measurement, evidence, claim and review facts.
- E1–E4 is evidence strength under Framework 008 §4.1; acquisition type is a separate provenance dimension.
- A hub service record is not custody, title, stock held, release or dispatch.
- Declared, measured, eligible, reserved, allocated, moved and dispatched quantities must not collapse into one quantity or status.
- Evidence acceptance is claim-, scope-, competence- and time-specific, not a universal verified flag.

**Required verification:** E1–E4 vocabulary tests; provenance-axis independence; source/batch lineage; unit/precision checks; service-only negative tests; expiry/revocation propagation; correction-history preservation.

### 4.3 Listing, quotation, order and reservation

- WF-06–WF-10 map to ENT-030–047 and REL-013–024.
- Listing supply is derived from compatible eligible backing and active commitments; it is not an independent free-text stock assertion.
- Pilot order references one accepted quotation; each order item references its accepted quote line and terms snapshot.
- Allocation/reservation does not create a physical movement or shipment.
- Partial shipment requires exact fulfilment-lineage to order item, allocation and batch.

**Required verification:** overlapping listing capacity, concurrent reservation, atomic over-allocation denial, duplicate/replay, quote-line linkage, immutable snapshot, variation acceptance and dispatch-provenance tests.

### 4.4 Fees, payment and shipment

- WF-11 and ENT-065/REL-034 keep the service catalogue separate from goods-sale proceeds and payment status.
- No fee engine, payable balance, deduction or collection is enabled before an approved service catalogue, payer, trigger, basis, tax treatment and effective schedule.
- WF-13 and ENT-049–052/REL-025–027 represent external buyer-to-seller payments only; platform status is not possession or control of funds.
- WF-12/13 must not infer dispatch, payment or settlement from a user click, screenshot, allocation or document upload.

**Required verification:** approval-gate denial; fee schedule version/snapshot; no-funds-custody tests; provider signature/replay/idempotency tests; participant-declared versus provider-confirmed payment; shipment-source tests.

### 4.5 Recall, trust, offline and audit

- WF-14–WF-17 map to ENT-053–061 and REL-028–031.
- Recall and withdrawal require traversable source-to-downstream lineage and controlled holds.
- Allegation, investigation finding, appeal and operational support ticket remain separate.
- Offline actions are allow-listed and revalidated against current server state, authority, rule version and idempotency; no last-write-wins for consequential conflicts.
- Material actions and corrections retain attributable history.

**Required verification:** trace-forward/back graph completeness; held-item publication/allocation denial; independent appeal; revoked-device and replay tests; conflict quarantine; restore/reconciliation; audit immutability and access tests.

### 4.6 Measurement and gate evidence

- WF-18 and ENT-062–064/REL-032–033 require governed metric definitions, versioned observations and evidence-linked gate assessments.
- Activity counts are not automatically outcome measures.
- Software delivery stage and physical pilot maturity remain separate assessments.
- Gate decisions must cite the evidence and conditions used, with an accountable decision authority.

**Required verification:** numerator/denominator/source/owner checks; calculation-version reproducibility; gate evidence reference checks; tests preventing software-stage advancement from authorizing physical activity.

## 5. Crosswalk to 024-C's 36 integrity invariants

The 36 source invariants are preserved in `docs/domain/024c-relationship-integrity-catalogue.md`. The following grouping identifies the principal workflow dependencies; it is a reviewer-derived navigation aid, not a replacement for the source invariant text.

| 024-C invariant numbers | Principal 024-B workflows | Main control |
|---|---|---|
| 1–7 | WF-01, WF-02, WF-06, WF-08, WF-09, WF-12 | Identity/authority/tenant scope, separate capacity, revocation, separation of duties |
| 8–14 | WF-03, WF-04, WF-05, WF-06 | Batch lineage, measurement provenance, evidence axes, claim scope, rule version and historical snapshots |
| 15–22 | WF-06, WF-07, WF-08, WF-09 | Offerable quantity, backing integrity, privacy projection, enquiry/order separation, quote/order lineage |
| 23–28 | WF-10, WF-12 | Reservation/movement distinction, atomic allocation, movement evidence, custody restriction, fulfilment and milestone lineage |
| 29–31 | WF-13 | Direct external payment, authenticated provider events, declared-versus-confirmed status |
| 32–33 | WF-14, WF-15 | Recall traceability; allegation/finding/appeal separation |
| 34 | WF-16 | Offline allow-list and server revalidation |
| 35 | WF-05, WF-16, WF-17 | Protected audit history and attributable material events |
| 36 | WF-11 | Approved fee schedule and trigger only |

## 6. Decisions and unresolved dependencies that remain open

| Item | Current disposition | What is needed |
|---|---|---|
| 024-B and 024-C source status | Draft specifications for review | Sponsor, product, technical, operational, legal, privacy and assurance comments/disposition |
| 024-H | Full canonical source page not located in targeted search | Programme owner confirms whether planned, stored elsewhere, renumbered or not yet prepared |
| Deliverable 025 | Dedicated canonical page not located in targeted search; 024-B WF-11 and 024-C DC-11 treat it as a planned dependency | Programme owner confirms status and owner; commercial/legal/tax work remains gated |
| Developer Guide v0.1 | Canonical source not recovered in targeted Notion/Library search | Recover exact artifact and version before candidate architecture scoring |
| DC-01–DC-14 | All remain recorded as open design decisions unless separately evidenced | Resolve each at its stated decision gate; do not silently select |
| ADR-0001/0002 | OPEN | TSBBF evidence and authorized technology/topology decision |
| Migration 001 / 002 | HOLD / NOT AUTHORISED | Separate controlled approval; this review gives none |
| EVI-21 | OPEN; Closure Accepted = NO | Actual browser rehearsal, operator execution and independent review evidence |

No new 024-I is proposed. The existing 024-A–H sequence and separate commercial dependency should be maintained unless programme governance directs otherwise.

## 7. Next controlled engineering step

The 024-C logical model is sufficiently represented in the repository to support the next design integration activity, but it is not approved for physical implementation.

Proceed next with a **024-D contract-to-domain integrity review**:
1. map every command, query, event and provider callback to the owning workflow and entity state;
2. verify authority, tenant scope, idempotency, replay, versioning and safe error semantics;
3. check each contract against REL-001–REL-034 and the 36 invariants;
4. identify missing or over-broad contracts and any provider assumption;
5. link the resulting contract cases to 024-G tests.

Do not provision services or execute migrations as part of this review.

## 8. Non-negotiable boundaries

- 018-A D-01–D-07 remain approved with conditions.
- Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**.
- EVI-21 remains **OPEN**, Closure Accepted **NO**.
- No selected technology stack, production backend, deployment, CI runtime or live provider connection is implied.
- No live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment is authorized.
- All executable spike work remains synthetic-only and subject to separate approval.

This document is a traceability and design-quality control, not evidence that any workflow, entity, relationship, invariant or test is implemented or accepted.
