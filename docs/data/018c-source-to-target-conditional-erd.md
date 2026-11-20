# 018-C — Migration 001 source-to-target mapping and conditional target ERD

**Canonical source:** Notion 018-C — Migration 001 Source-to-Target Mapping & Conditional Target ERD.
**Source page:** https://app.notion.com/p/4136808bcd9e819c8506ecdcd9880d1d
**Source retrieved:** 20 November 2026; source page metadata reports 18 November 2026.
**Source status:** Candidate design for review; not approved for implementation.
**Repository status:** Faithful source-to-repository representation; not physical schema approval.
**Governing references:** Concept Paper v1.1; 015–018-B; 018-A conditional sponsor decisions; 024-B workflow/state rules; 024-C logical model; 024-F security requirements; 024-G quality gates.

## 1. Purpose and authority boundary

This file preserves 018-C's complete source-to-target mapping, candidate target entities, conditional logical relationship model, seven sponsor-decision branches, migration/backfill rules, design gates and acceptance criteria. It is not a new approval, physical ERD, final data dictionary, SQL specification or migration authorization.

018-C must be read with 018-B for the exact existing source columns, 018-A for sponsor decisions, 017 for detailed conditional technical design, and 024-C for the broader logical information model. It does not replace any of those sources.

**Hard controls:** Migration 001 remains HOLD; CV-12 remains UNVERIFIED; Migration 002 remains NOT AUTHORISED. No SQL execution, PostgreSQL catalogue inspection, concurrency/security/recovery test, external partner evidence or independent acceptance is claimed.

## 2. Preserved source content

## 2. Design constraints carried forward

The target model must preserve these separations:

- marketplace operator ≠ seller/exporter of record;
- seller/exporter ≠ producer, unless the evidence and legal arrangement establish they are the same organisation;
- hub operator ≠ physical custodian, unless a valid mandate and custody controls exist;
- listing visibility ≠ ownership or availability of physical stock;
- reservation/allocation ≠ physical inventory movement;
- payment status recorded by the platform ≠ custody of money or escrow;
- a recorded measurement ≠ independent verification;
- shipment status ≠ proof of delivery or customs clearance unless supported by authoritative evidence.

The database may enforce internally consistent records. It cannot create legal authority, verify a partner's licence, replace contractual mandates, or make an unverified external statement true.
## 3. Source-to-target mapping — all 22 existing tables

Disposition terms:

- <b>Retain:</b> keep the existing table as a core target entity, with targeted constraints or added fields.
- <b>Extend:</b> retain and strengthen the table.
- <b>Re-key/normalise:</b> retain the business concept but move repeated or free-text attributes into controlled reference entities.
- <b>Relate:</b> retain the table and add an explicit relationship table.
- <b>Retain with service controls:</b> database structure remains, but important enforcement also belongs in the application or trusted integration service.

| Migration 001 source | Target disposition | Main target change | Decision dependency |
| --- | --- | --- | --- |
| users | Retain with service controls | Keep identity record; connect access through organisation memberships and scoped permissions; avoid treating user identity as organisational authority | D-01, D-03 |
| organizations | Extend | Keep organisation master; add/relate explicit legal and operational roles, authority status and effective-dated mandates rather than relying on organisation\_type alone | D-01, D-02, D-03, D-07 |
| organization\_memberships | Extend | Preserve membership; constrain roles and scopes; distinguish platform access from authority to act for a seller, exporter, hub or provider | D-01, D-02, D-03 |
| hubs | Extend | Retain facility identity and status; connect to operating organisation and effective-dated service/custody mandate; do not assume every hub takes custody | D-03 |
| products | Re-key/normalise | Preserve product identity; link to canonical unit definitions and commodity-specific unit/quality rules | D-04; technical unit design |
| listings | Extend and relate | Retain commercial offer; add explicit listing-to-batch backing relation, offer state and quantity derivation rules | D-04, D-01, D-02 |
| batches | Extend | Retain batch identity and provenance; strengthen seller/producer/hub authority, state eligibility, unit precision and evidence classification | D-02, D-03, D-04 |
| documents | Extend with access controls | Retain document metadata; add classification, issuer/source, verification status, version/hash and access policy as appropriate | D-02, D-03, D-07 |
| batch\_measurements | Extend | Retain measurements; normalise units; preserve capture method, device/lab source and evidence linkage; do not collapse declared and verified values | D-04; quality protocol |
| quality\_inspections | Extend | Retain inspection decisions; distinguish inspector authority, standard, scope, sample/batch, outcome and evidence; independently verified status requires evidence | D-02; D-03 |
| buyer\_enquiries | Retain | Preserve buyer request; link to listing version/specification and record destination requirements without overwriting the original enquiry | D-04, D-05 |
| quotations | Extend | Preserve versioned quotes; strengthen party/listing/specification/quantity/unit/price lineage and acceptance status | D-01, D-02, D-04, D-05, D-07 |
| orders | Extend | Preserve order; enforce accepted commercial basis, buyer/seller parties, currency and immutable accepted terms; pilot default is one accepted quotation per order | D-01, D-02, D-05, D-07 |
| order\_items | Extend | Preserve order lines; enforce product, listing, quotation, unit, quantity and seller consistency; retain explicit line-level fulfilment linkage | D-04, D-05 |
| batch\_allocations | Extend and clarify | Treat as reservation/commitment record, not physical movement; enforce batch eligibility, compatibility, order-line lineage, atomic capacity and release rules | D-04, D-05, D-06 |
| inventory\_movements | Extend as ledger | Make immutable movement events the physical stock ledger; define signed effect, location, reason, authority, source reference and reversal/correction semantics | D-03, D-06 |
| shipments | Extend | Retain shipment header; add shipment-line/fulfilment linkage to order items, allocations and batches; record responsible carrier/shipper roles | D-02, D-03, D-07 |
| shipment\_events | Extend | Retain event history; add provider/source identity, external event ID/idempotency receipt, provenance and evidence state | D-02, D-07 |
| payment\_records | Retain with strict boundary | Record externally processed payment obligations and outcomes; do not model a platform wallet, safeguarded balance or escrow by implication | D-01, D-02, D-07 |
| payment\_events | Extend with receipt layer | Preserve payment event history; add provider-scoped event receipt/idempotency and trusted signature-verification result provenance | D-07 |
| disputes | Extend | Link dispute to relevant order, order line, shipment, payment or batch where applicable; preserve resolution and evidence history | D-01, D-02, D-03, D-07 |
| audit\_events | Extend and protect | Append-only application audit contract, actor/source/tenant context, mandatory event catalogue, restricted DB permissions and retention controls | D-01, D-03, D-07 |

The table above is the mapping index, not a substitute for the column-level source inventory in 018-B. Exact source column definitions remain in 018-B; exact proposed constraints and service behaviour remain in 017.
## 4. Target entities and relationship changes

The following additions or explicit relationships are required in the candidate target model. Names are logical design names, not final SQL identifiers.

| Candidate target entity / relation | Purpose | Minimum relationship rule |
| --- | --- | --- |
| organisation\_role\_assignments or authority\_mandates | Records an organisation's authority to perform a defined role for a defined scope and period | Must identify grantor/mandating party where applicable, role, scope, evidence, effective dates, status and revocation |
| hub\_mandates | Records the hub's permitted service scope and whether physical custody is authorised | A hub may provide non-custodial services; custody requires a distinct active mandate and controls |
| listing\_batch\_backings | Connects a listing to one or more batches without losing batch-level traceability | Each backing row identifies batch, committed/offer quantity, unit, status and effective period; aggregate offer cannot exceed eligible backing |
| unit\_definitions | Canonical unit code, dimension and precision | All operational quantities resolve to a controlled unit |
| commodity\_unit\_rules | Defines permitted units and precision for a commodity/product class | Product/batch/listing/order quantities must use permitted compatible units |
| unit\_conversions | Controlled conversion factors with scope and provenance | Conversion is allowed only for compatible dimensions and approved rules; no implicit text-based conversion |
| inventory\_balance\_snapshots (optional projection) | Performance-oriented calculated balance | Derived from the ledger; never the sole source of truth |
| inventory\_reconciliation\_runs | Records comparison of ledger, physical count and source evidence | Differences require reason, reviewer, evidence and disposition |
| shipment\_lines or shipment\_fulfilments | Links each shipment to exact order items, allocations and batches | Shipment quantity cannot exceed the relevant allocated/eligible fulfilment quantity |
| provider\_event\_receipts | Provider-scoped event identity, payload digest, signature-verification metadata and processing outcome | Unique provider + external event identifier; duplicate delivery is idempotent and auditable |
| audit\_event\_protection / event policy | Defines immutable event handling and mandatory coverage | Ordinary application roles cannot update/delete protected audit records |

A generic authority-mandate model may ultimately cover sellers, exporters, hub operators, custodians and service providers. Whether one generic table or several specialised tables is safer is a detailed design choice; the essential requirement is explicit scope, evidence, effective dates and revocation. Do not duplicate the same authority facts across loosely related tables.
## 5. Conditional target ERD — logical relationships

This section is the target relationship model at logical level. It is not a final physical ERD or SQL specification.

### 5.1 Identity, organisations and authority

- One <b>user</b> may hold memberships in multiple <b>organisations</b>.
- One <b>organisation</b> may have many users and many role assignments.
- An organisation's platform membership does not itself confer authority to sell, export, take custody, inspect, carry, clear or process payments.
- An <b>organisation role/authority mandate</b> is scoped by role, counterparty or asset where relevant, geography/product/service scope, validity period and documentary evidence.
- A <b>hub</b> is operated by an organisation. The hub may have one or more active service mandates. A custody mandate is a separate permission, not an automatic consequence of hub registration.

### 5.2 Product, batch, listing and supply

- One <b>product</b> may have many <b>batches</b>.
- One <b>producer organisation</b> may originate many batches; the batch must preserve the actual producer/origin identity even where another seller markets it.
- One <b>hub</b> may record intake or provide services for many batches, subject to its mandate.
- One <b>listing</b> may be backed by one or many <b>batches</b>, but only if D-04 permits multi-batch backing and the batches are compatible with the listing specification.
- Each listing-to-batch backing record carries its own quantity, unit, state and provenance. The listing's offerable quantity is a controlled aggregate, not a manually asserted number.
- A batch can back more than one listing only where total live commitments across all listings remain within eligible uncommitted quantity and policy permits it.
- A listing is not proof of physical custody, ownership transfer or export eligibility.

### 5.3 Enquiries, quotations, orders and allocations

- One buyer may submit many <b>enquiries</b>; each enquiry refers to a listing and a versioned specification.
- One enquiry/listing negotiation may produce multiple <b>quotation versions</b>.
- An <b>order</b> must have a clearly identifiable accepted commercial basis.
- Under the recommended pilot default, one order references one accepted quotation; order lines must reconcile to that quotation's seller, buyer, product, unit, price, currency and quantity.
- Each <b>order item</b> may be fulfilled from one or more <b>batch allocations</b> if the approved model allows it. Each allocation must identify a compatible batch and must not exceed either the batch's eligible available quantity or the order item's outstanding quantity.
- Allocation reserves quantity. It does not itself record receipt, transfer, dispatch or title transfer.

### 5.4 Inventory, custody and fulfilment

- A <b>batch</b> has one authoritative physical inventory ledger.
- <b>Inventory movements</b> record physical quantity changes and location transitions. They are not used as a substitute for reservation records.
- <b>Batch allocations</b> record reserved/committed quantity and have their own lifecycle.
- If a hub is authorised to hold physical stock, custody movements identify the custodian, location, handover, time, quantity and evidence. If it is non-custodial, the platform records hub services without representing the hub as custodian.
- A <b>shipment</b> belongs to an order and contains one or more shipment fulfilment lines.
- Each shipment line links the order item to the allocation(s) and batch(es) actually dispatched. This preserves order-to-batch-to-shipment traceability.
- Partial dispatches and multiple shipments must not erase prior allocations or movement history.

### 5.5 Payment, events, documents and disputes

- An <b>order</b> may have one or more external payment records, depending on the agreed commercial terms.
- Payment records identify payer, payee, provider, amount, currency and provider transaction reference. They do not imply the platform receives or holds funds.
- Each provider callback/webhook is first recorded in a provider-scoped event receipt; trusted integration code verifies authenticity before accepted state changes.
- Shipment provider events use equivalent source identity and idempotency controls.
- <b>Documents</b> may support batches, inspections, quotations, orders, shipments, payments or disputes, with classification and access rules.
- A <b>dispute</b> may reference the relevant order and, where needed, a specific line, batch, shipment or payment.
- <b>Audit events</b> preserve actor, organisation/tenant, action, entity, source, timestamp and reason/context. They are protected from ordinary mutation.
## 6. Seven sponsor decisions — conditional branches and safe design treatment

These are the seven decisions already presented in 018-A. This section does not repeat their full rationale; it records the target-model consequence of each answer.

| Decision | Recommended default in 018-A | Target-model treatment now | What changes if the sponsor chooses another route |
| --- | --- | --- | --- |
| D-01 Marketplace operator role | Disclosed technology/transaction coordinator, not principal or custodian | Keep operator identity and service role distinct from seller/exporter and funds recipient; no platform-held balances | If principal/agent or another role is chosen, obtain legal review and model contractual role, liability, revenue, authority and transaction obligations before implementation |
| D-02 Seller/exporter of record | Qualified seller/exporter partner, not assumed to be the operator | Order and quotation preserve seller organisation; exporter authority is separately evidenced | If producer/cooperative or operator is seller/exporter, record that entity explicitly and require relevant authority evidence; do not collapse roles by default |
| D-03 Hub custody | Service-only hub by default | Separate hub operation, service mandate and custody mandate; physical ledger location and custodian are explicit | If custody is authorised, add custody acceptance, handover, insurance/liability and stock-count controls before live stock is handled |
| D-04 Listing-to-batch cardinality | Multiple compatible, separately traceable batches may back a listing; pilot one batch where practical | Build explicit listing\_batch\_backings relation; enforce compatibility and aggregate capacity | If one batch per listing is selected, constrain active backing cardinality to one; relation may remain useful for future migration but must not permit multi-batch pilot use |
| D-05 Order-to-quotation cardinality | One accepted quotation per order in pilot | Keep accepted\_quotation\_id at order level; line-level quotation references must reconcile to it | If multiple quotations per order are required, redesign order commercial basis as explicit order\_quote/contract components and define mixed seller, currency, terms and dispute handling |
| D-06 Allocation semantics | Allocation is reservation, not movement or title transfer | Keep batch\_allocations separate from inventory\_movements; distinct states, capacity calculations and audit events | If allocation is intended to mean physical transfer, do not overload the existing table; define a separate movement/transfer event and legal/title boundary |
| D-07 Payment/funds flow | Buyer pays seller/exporter through licensed provider; platform records status | Keep payment records/events as external references; no wallet, escrow or safeguarded balance | Any provider-led escrow, split settlement, FX conversion or platform receipt requires provider confirmation, legal/regulatory review, contract and a separately approved funds-flow design |

<b>Design-safe position following conditional sponsor approval:</b> implement the approved direction as role separation and explicit authority modelling, without assuming that the named legal entities, permissions, provider arrangements or operating controls have been evidenced. Conditional approval does not appoint a seller/exporter, hub or payment provider, nor authorise live operations.
## 7. Source-to-target migration and backfill rules

Migration 002 must not invent missing historical facts. The following rules govern any eventual backfill:

1. Preserve all Migration 001 primary keys unless a documented exception is approved.
2. Preserve original created/updated timestamps and original source identifiers where available.
3. Map existing free-text units only when an exact, reviewed mapping to a canonical unit exists. Ambiguous or incompatible values go to a remediation queue; do not guess.
4. Do not create authority mandates from organisation\_type, membership role, hub registration or a free-text note alone. Create a mandate only from documentary evidence approved for that purpose.
5. Do not manufacture listing-batch links from listing descriptions or inferred quantities. Backfill only where batch provenance and quantity can be established.
6. Do not convert existing allocations into physical inventory movements. Preserve them as reservations/commitments unless documentary evidence establishes a separate movement.
7. Do not infer shipment batch fulfilment where the original records do not identify the dispatched batch. Mark lineage unresolved for review.
8. Do not infer provider signature verification from a stored boolean without the trusted verification record or integration evidence.
9. Preserve payment and shipment event identifiers exactly; introduce provider-scoped idempotency without silently merging events from different providers.
10. Retain unresolved rows and their reason in a migration exception report. A successful database migration is not a successful data migration if material lineage is lost.

### 7.1 Backfill classification

Each transformed record should be labelled as one of:

- <b>Direct carry-forward:</b> source value copied without semantic change.
- <b>Deterministic transform:</b> conversion governed by a documented rule and reproducible.
- <b>Evidence-backed enrichment:</b> new relationship or status added from a referenced document or approved evidence.
- <b>Unresolved exception:</b> missing, conflicting or ambiguous source; excluded from unsafe automated inference.

The migration run must produce counts by table and classification, rejected-row counts, exception references, reconciliation totals and a reviewer sign-off.
## 8. Design dependencies and implementation gates

| Gate | Required output | Can proceed before sponsor approval? |
| --- | --- | --- |
| G1 Source mapping | This deliverable reviewed against 018-B | Yes |
| G2 Conditional relationship model | Role separation, cardinalities and branch impacts accepted for design | Yes, as a conditional model |
| G3 Sponsor decisions and conditions | D-01 to D-07 approved with conditions in 018-A; condition evidence/reviews and any unresolved technical choices recorded | Sponsor direction approved; conditions remain open |
| G4 Target ERD and data dictionary | Physical table/column definitions, keys, constraints, indexes and data ownership | Only after G3 or a documented decision-safe scope |
| G5 Migration plan | Deterministic backfill, exception handling, rollback/forward recovery and reconciliation | Drafting can begin; finalisation follows G4 |
| G6 SQL implementation | Versioned Migration 002 scripts and repeatable test suite | No, until G3/G4 design review |
| G7 Controlled database validation | Migration 001 + 002 execution, smoke, integrity, concurrency, security and recovery tests | No, requires controlled PostgreSQL environment |
| G8 Technical acceptance | Evidence pack, independent review and closure of acceptance criteria | No, after G7 |

No code or SQL has been executed by this deliverable. No PostgreSQL catalogue output, concurrency test, security test, external partner evidence or sponsor approval is represented here.
## 9. Acceptance criteria for 018-C

This mapping can be marked reviewed when:

- all 22 Migration 001 tables have a documented target disposition;
- every new target entity has a stated purpose and relationship rule;
- the target model separates authority, custody, reservations, physical movements and external payment processing;
- listing-to-batch and order-to-quotation cardinalities are explicitly conditional on D-04 and D-05;
- shipment fulfilment preserves order-item and batch lineage;
- provider events are idempotent and provenance-aware in the proposed model;
- backfill rules prohibit unsupported inference;
- each unresolved sponsor decision has a clear schema consequence; and
- the technical and evidence limitations are accurately stated.

## 3. Interpretation and repository implementation boundary

- The 22-table mapping is the source disposition for the existing Migration 001 schema; it is not permission to modify those tables.
- Candidate target entity names are logical names. Generic versus specialized authority-mandate tables, optional projections and shipment-line naming remain design choices.
- 018-A D-01–D-07 are approved with conditions as sponsor direction; the evidence, legal/operational conditions and implementation gates remain outstanding.
- D-04 supports multiple compatible batch backings as a target design direction, while the pilot can be constrained to one batch where practical. The relationship must not permit over-commitment.
- D-05 pilot default is one accepted quotation per order; order lines must reconcile to the accepted quotation and immutable commercial snapshot.
- D-06 allocation remains a reservation/commitment, never a physical movement or title transfer.
- D-07 payment records are external references/status evidence only; no platform wallet, escrow, safeguarded balance or platform receipt of funds is implied.
- Data migration must preserve source lineage and explicitly classify unresolved exceptions; missing authority, batch lineage, shipment lineage or provider verification must not be invented.
- G1–G2 conditional source mapping and relationship modelling can proceed. G4 physical ERD/data dictionary is conditional on the recorded decision/evidence requirements. G6 SQL implementation, G7 controlled database validation and G8 technical acceptance remain blocked by their stated gates.

## 4. Traceability to repository homes

| Concern | Canonical repository home |
|---|---|
| 22-table source inventory and column provenance | `docs/data/015-018b-technical-design-reconciliation.md`; 018-B source register entry |
| 024-C entities, relationships and invariants | `docs/domain/024c-entity-to-context-crosswalk.md`; `024c-relationship-integrity-catalogue.md` |
| Detailed technical remediation and work packages | `docs/data/015-018b-technical-design-reconciliation.md` |
| Sponsor role, custody and funds-flow direction | `docs/commerce/role-and-funds-flow-boundaries.md` |
| Workflow/state invariants | `docs/product/workflow-to-context-crosswalk.md` |
| Data lineage, provenance and migration exception controls | `docs/data/domain-data-lineage.md`; `docs/data/migration-001-source-provenance.md`; `docs/data/migration-002-design-boundary.md` |
| Security and test requirements | `docs/security/`; `docs/quality/` |

## 5. Current disposition

018-C is represented as a conditional source design, not a completed physical database design. The next safe work is independent technical review of the relationship/cardinality rules and their mapping to 024-C, 017 and the 018-B source columns; record any conflict as an explicit decision or design issue. Do not generate Migration 002 SQL until the applicable sponsor conditions, G4 design review and authorization gates have been satisfied.

Migration 001: **HOLD**. CV-12: **UNVERIFIED**. Migration 002: **NOT AUTHORISED**. EVI-21: **OPEN**.