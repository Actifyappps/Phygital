# Deliverables 015–018-B — technical review and conditional design reconciliation

**Review date:** 20 November 2026  
**Sources:** 015 Technical Readiness Review; 016 Migration 002 Design Decision Record; 017 Migration 002 Detailed Technical Design; 018-B Migration 001 Column-Level Data Dictionary & Source Inventory.  
**Related controls:** 014 test harness; 018-A sponsor decisions; 018-C conditional target ERD; live Phase 0 Evidence Register.  
**Disposition:** Source-to-repository crosswalk only. Migration 001 remains HOLD. Migration 002 remains NOT AUTHORISED.

## 1. Why these sources must be read together

The documents form a staged technical evidence chain, not four independent approvals:

1. **015** statically inspects the candidate Migration 001 SQL, its smoke/constraint script and acceptance checklist, and identifies defects/remediation.
2. **016** turns the 015 findings into a proposed technical decision record and a testable remediation specification.
3. **017** expands the proposed design into logical components, relationships, candidate database changes, transaction and security controls, service contracts, migration stages and implementation work packages.
4. **018-B** records what the existing Migration 001 SQL actually declares at column level. It is a source-derived inventory, not the target schema and not a PostgreSQL runtime catalogue export.

The correct repository treatment is to preserve source provenance, map findings to domain/data/security/test homes, and keep proposed design separate from implementation and execution evidence.

## 2. Reconciled Migration 001 source inventory

Deliverable 015 reported 20 tables. Deliverable 016 explicitly corrected that count to **22 CREATE TABLE definitions**; 018-B independently inventories all 22 tables and **230 declared columns**. The 015 count is a superseded counting error, not a separate schema version.

018-B reports the following source-derived metrics:
- 22 tables and 230 declared columns;
- 22 primary keys;
- 52 foreign-key references;
- 43 CHECK expressions;
- 18 explicit CREATE INDEX statements;
- 3 trigger functions and 3 triggers.

These are counts derived from the SQL source text. They are not verified against PostgreSQL `information_schema` or system catalogues because execution has not been performed.

The 22 source tables are:
`users`, `organizations`, `organization_memberships`, `hubs`, `products`, `listings`, `batches`, `documents`, `batch_measurements`, `quality_inspections`, `buyer_enquiries`, `quotations`, `orders`, `order_items`, `batch_allocations`, `inventory_movements`, `shipments`, `shipment_events`, `payment_records`, `payment_events`, `disputes`, and `audit_events`.

The complete column declarations remain in Notion 018-B and the immutable candidate SQL. This repository crosswalk intentionally does not copy 230 column descriptions into a second competing dictionary.

## 3. Deliverable 015 — static readiness review

015 inspected three source artefacts and recorded their SHA-256 values:
- Migration 001 SQL: `24d8f3458106e8a005cd05a7ecf9f057b4aee955b325358392b501de54c74ccd`.
- Smoke/constraint tests: `4b4c7c6b4c2be00ec5151f9466bb0365c39d8e9a53d91c009edab10bc432dad6`.
- Database acceptance checklist: `2d76e40de7c86c018732d29796624839b5a2bcfb819ba90efd82ca48c8de725f`.

The static review found that the candidate has a meaningful relational foundation and quantity-capacity triggers. However, the supplied smoke script only covers a subset of the required controls. It does not demonstrate successful migration execution, catalogue conformance, full inventory reconciliation, state eligibility, tenant isolation, audit immutability, payment signature verification, shipment idempotency or genuinely concurrent transactions.

The 12 remediation findings are:
- **R-01 P0:** allocation ignores ineligible batch states.
- **R-02 P0:** batch/listing/order semantic consistency is not guaranteed.
- **R-03 P0:** inventory movement history is not yet a complete authoritative ledger with atomic reconciliation.
- **R-04 P0:** memberships do not implement complete tenant/hub access enforcement.
- **R-05 P0:** audit history protection and mandatory event coverage are incomplete.
- **R-06 P0:** quotation/listing/order-item lineage and immutable terms are incomplete.
- **R-07 P0:** concurrency, lock ordering and recovery are unproven.
- **R-08 P1:** units are free text without controlled precision/conversion rules.
- **R-09 P1:** shipment provider-event idempotency is incomplete.
- **R-10 P1:** a payment signature boolean does not perform trusted provider signature verification.
- **R-11 P1:** hub authority/mandate over any physical activity is not established by a hub record.
- **R-12 P1:** event provenance is inconsistent and needs a standard contract.

**015 decision:** HOLD — do not treat Migration 001 as an accepted technical baseline. This was a static review, not a database test, penetration test or production-readiness certification.

## 4. Deliverable 016 — proposed technical decisions and acceptance

016 proposes technical design questions **D-01–D-12**. These identifiers are local to 016 and must never be confused with the separate sponsor decisions **D-01–D-07** in 018-A.

The 016 recommendations include:
- one seller organisation per listing;
- multi-batch listings only where compatibility, authority and source traceability are demonstrable;
- explicit seller/exporter organisation separate from producer identity;
- one accepted quotation per pilot order;
- allocation only from eligible, non-held batches with available accepted quantity;
- append-only inventory movement ledger with reconciled/transactionally maintained balance projection;
- controlled unit catalogue and commodity-specific precision/conversion;
- time-bounded hub mandate with explicit permitted activities;
- trusted server authorisation plus PostgreSQL RLS where appropriate;
- provider-specific verification, idempotency, provenance and reconciliation;
- role/state-based acceptance, rejection, release and quantity amendment;
- simulated workflow until separate live-pilot gates are approved.

The proposed M2-01–M2-24 tests cover ineligible/eligible allocations, semantic lineage, concurrent allocation, release, append-only movements and reversals, ledger reconciliation, unit/precision validation, tenant isolation and pooled-connection context, audit immutability, payment signatures, shipment event replay/reordering, hub mandate enforcement, immutable commercial terms, deadlock/retry/rollback and the synthetic end-to-end workflow.

The design recommends a forward-only Migration 002, preserving Migration 001 unchanged; clean-install and upgrade paths; automated regression; separate-session concurrency/security tests; retained evidence; and independent technical acceptance. None of those steps is marked complete by the design document.

## 5. Deliverable 017 — detailed logical design, not a selected implementation

017 makes explicit the trust boundaries:
- the browser/client is untrusted;
- authentication is not organisation authority;
- membership is not permission for every action;
- a hub record is not a mandate;
- provider callbacks are untrusted until authenticated and validated;
- a database verification label must point to a defined verification action.

Its candidate logical components are client, API/application service, PostgreSQL, evidence/document service, provider adapters and operations/review console. These are logical responsibilities, not a final framework, vendor or deployment decision.

Its candidate relationship rules include:
- one seller organisation per listing;
- listing-to-batch backing through an explicit relationship;
- one order from one accepted quotation for the pilot;
- each order item linked to an accepted quotation line;
- allocation linking one batch to one order item;
- append-only stock movements;
- provider event identity producing at most one accepted business transition.

Its candidate database design families include controlled units/rules/conversions, hub mandates, movement taxonomy/reversals and reconciliation, stronger allocation and commercial lineage, provider idempotency, RLS/grants and audit protection. They remain subject to exact schema impact analysis and review.

Its service contracts include intake, measurement, quality review, batch acceptance, allocation/release, quotation creation/acceptance, order creation, shipment event receipt, payment event receipt and inventory/payment reconciliation. SQL cannot replace authentication, application authorisation, provider signature verification, external evidence review, legal authority, privacy notices, operational approvals or human decisions.

The 017 delivery work packages TD-01–TD-10 are:
1. exact schema inventory;
2. sponsor decisions and technical choices;
3. relationship model;
4. inventory design;
5. security design;
6. integration design;
7. migration specification;
8. versioned SQL implementation;
9. automated test implementation;
10. technical acceptance.

No TD package is complete merely because its design is described. The stack remains subject to the separate technology decision process.

## 6. 018-B — source dictionary and conformance limits

018-B describes the existing migration as written. It identifies important source-level gaps:
- role/type fields do not establish contractual seller, exporter, hub or provider authority;
- unit fields are free text;
- listings lack a direct batch-backing relationship;
- allocation foreign keys do not prove product/seller/unit/listing/order consistency;
- movement records lack a fully defined signed quantity/balance contract;
- shipment lineage lacks a shipment-line/allocation link;
- shipment events lack a dedicated provider-scoped idempotency key;
- a payment signature boolean is not trusted signature verification;
- audit events lack source-level append-only enforcement and complete mandatory event catalogue;
- memberships do not implement authentication, RLS or complete service authorisation.

018-B also explicitly says the source inventory is not a runtime catalogue and that sponsor decisions D-01–D-07 were approved with conditions in 018-A. It cannot prove that any condition has been satisfied.

## 7. Critical ID and authority distinctions

| Identifier family | Meaning | Control |
|---|---|---|
| 015 R-01–R-12 | Static review findings | Remediation and evidence mapping |
| 016 D-01–D-12 | Local technical design questions | Proposed defaults; not sponsor approval |
| 016 M2-01–M2-24 | Migration 002 acceptance scenarios | Must be implemented and executed with evidence |
| 017 TD-01–TD-10 | Technical design/implementation work packages | No package completion inferred |
| 018-A D-01–D-07 | Sponsor role/custody/funds-flow decisions | Approved with conditions on 17 November 2026; conditions remain open |
| CV-06–CV-12 / E-021 | Phase 0 evidence items | Live Notion Evidence Register governs status/closure |

The approved-with-conditions sponsor decisions are not a blanket approval of the proposed technical design, SQL, Migration 002 or live pilot. The conditions and external evidence remain open.

## 8. Repository mapping

| Requirement | Repository home |
|---|---|
| Immutable source SQL/tests/checklist and hashes | `supabase/candidates/migration-001-hold/`; `docs/data/migration-001-source-provenance.md` |
| R-01–R-12 and M2-01–M2-24 | `docs/data/migration-002-design-boundary.md` |
| 22-table / 230-column source inventory and corrected count | This crosswalk; Notion 018-B remains full column dictionary |
| Conditional target mapping and sponsor-status reconciliation | `docs/data/migration-002-design-boundary.md` |
| Inventory, allocation, lineage and transaction invariants | `docs/data/`, `docs/domain/`, `docs/quality/`, `tests/` |
| Tenant/RLS, audit, privacy and document security | `docs/security/`, `tests/security/` |
| Provider event trust, idempotency and reconciliation | `docs/integrations/`, `integrations/`, `tests/integration/` |
| Test execution and independent review evidence | `evidence/test-runs/`, `evidence/reviews/`; live Evidence Register in Notion |

## 9. Current gate and next action

- Migration 001 remains **HOLD** and is preserved as a candidate, not an active migration.
- CV-12 remains **UNVERIFIED** until PostgreSQL execution, full acceptance evidence, defect disposition and independent review.
- Migration 002 remains **NOT AUTHORISED**. No production SQL is to be drafted/deployed under this crosswalk.
- 018-C remains a conditional logical target ERD, not a final physical schema or SQL authority.
- Live trade, custody, platform-held funds/escrow, payment activation and shipment remain outside this technical design authority.

Next technical work is controlled design refinement against the exact source schema, independent review of relationships/security/concurrency/privacy/operations, and only then a separately authorised implementation and test plan. The repository must continue to distinguish proposed, reviewed, implemented, executed, passed, independently accepted and authorised.


## 10. 018-C source-to-target conditional ERD representation

The complete 018-C source mapping, candidate target entities, conditional relationship model, D-01–D-07 schema branches, migration/backfill safeguards, G1–G8 gates and acceptance criteria are preserved in `docs/data/018c-source-to-target-conditional-erd.md`. This complements rather than replaces 018-B's source-column inventory and 017's detailed technical design. The model remains conditional; Migration 001 HOLD and Migration 002 NOT AUTHORISED.
