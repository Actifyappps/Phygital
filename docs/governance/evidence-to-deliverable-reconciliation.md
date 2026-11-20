# Phase 0 evidence-to-deliverable reconciliation

**Source:** Phase 0 Evidence-to-Deliverable Reconciliation — Working Control Note (Notion).  
**Source snapshot:** 18 November 2026; all 24 active Evidence Register rows were queried on that date.  
**Status:** Repository crosswalk only. Not the live Evidence Register, not a closure decision, not an approval and not evidence that an external activity or technical test occurred.

## How to read this document

“Covered” means a topic is addressed by a design, plan, template, analysis or candidate artefact. It does **not** mean real-world evidence has been obtained, a test has passed, a provider has been appointed, or an Evidence Register item can be closed.

The source snapshot recorded Closure Accepted = NO and no Evidence Reference for all 24 rows. At that snapshot EVI-12 was UNVERIFIED, EVI-20 was IN PROGRESS, and the other 22 items were OPEN. These are historical snapshot values; consult the live Notion Evidence Register before making any current-status statement or change.

## EVI-01 to EVI-24 coverage map

| Evidence ID | Requirement | Existing coverage | Remaining proof / gap |
|---|---|---|---|
| EVI-01 / CV-01 | Legal/commercial role and transaction responsibility | 003, 004, 009, 011, 018-A | D-01/D-02 approved with conditions. Obtain qualified Kenyan legal/trade review, named counterparties, seller/exporter authority, contracts and title/risk/claims evidence. No cooperative/exporter is selected or qualified. |
| EVI-02 / CV-02 | Select one commodity/destination | 004, 008, 020 | Screening framework exists; no commodity, product form or destination has been validated and selected. Need comparative evidence and signed selection memo. |
| EVI-03 / CV-03 | Qualify prospective buyer and obtain specification | 007, 012, 013 | Instruments exist; no verified buyer, written specification, volume, price basis, delivery terms, acceptance terms or order evidenced. |
| EVI-04 / CV-04 | Validate producer/cooperative supply and traceability | 007, 012, 013, 011 | Workflow and instruments exist; no producer/cooperative group, authority, seasonality, realistic volume, quality/traceability pack or aggregation consent verified. |
| EVI-05 / CV-05 | Assess hub/site readiness and permitted activities | 010, 019, 020, 011 | Assessment approach exists; no site permission or selected ICTA hub, TTI or alternative site. Need site-specific assessment, written permission, activity limits, safety, custody/storage, connectivity and cost evidence. |
| EVI-06 / CV-06 | Cross-record data consistency | 002, 014–018, 018-B/C and Migration 001 artefacts | Static design/schema review exists; enforcement unproven. Need approved target model, constraints/service invariants, negative tests and PostgreSQL execution evidence. |
| EVI-07 / CV-07 | Organisation/hub role matrix and tenant isolation | 002, 014–018, 018-B/C, 023 | Requirements/design exist; implementation and security tests outstanding. Prototype 023 has no authentication or production role-based access. Need trusted server-side authorisation and cross-tenant/cross-hub tests. |
| EVI-08 / CV-08 | Authoritative inventory ledger and atomic allocation lifecycle | 002, 011, 014–018 | Design issues and lifecycle described; technical integrity unproven. Need append-only movement rules, reconciliation, reversal/idempotency and concurrency/over-allocation tests. Reservation remains distinct from physical movement. |
| EVI-09 / CV-09 | Batch states, units, conversions and precision | 002, 011, 014, 018-B/C, 022, 023 | Partially covered. Synthetic kg fixture is not a commodity-approved unit policy. Final states, units, conversions, rounding and rejection tests depend on commodity/product-form selection. |
| EVI-10 / CV-10 | Protect critical audit history and mandatory events | 002, 011, 014–018, 018-B/C | Design requirements exist; control effectiveness unproven. Need append-only/privilege design, transaction-level audit coverage, tamper tests and privileged-access evidence. Prototype event log is not a protected audit trail. |
| EVI-11 / CV-11 | Payment/shipment event provenance and duplicate handling | 002, 011, 014–018, 018-B/C | Design requirements exist; implementation/tests outstanding. Need authenticated provider events, scoped identifiers, idempotency, verifier provenance and proof that untrusted events cannot trigger release. |
| EVI-12 / CV-12 | Execute Migration 001 and full PostgreSQL tests | 002, 014–018 and Migration 001 SQL/test/checklist | **UNVERIFIED in the 18 Nov snapshot.** No PostgreSQL apply log, full test output, rollback/re-run evidence or independent review. Migration 001 remains HOLD. |
| EVI-13 / CV-13 | Cost/revenue model and payer willingness | 003, 005, 009, 011, 018-A, 019 | Genuine model gap: no validated cost per batch/order, gross contribution, working capital, producer net proceeds, payer evidence or funding commitment. Full unit-economics model remains necessary. |
| EVI-14 / CV-14 | Qualify quality, logistics, clearing and payment providers | 004, 009, 011–013, 018-A, 020 | Roles and due-diligence needs described; no provider appointed or evidenced. Need identity/credentials, exact service scope, quote, capacity, insurance/SLA, exception handling and written availability. |
| EVI-15 / CV-15 | Dispute, rejection, cancellation, refund and claims procedures | 003, 009, 011, 019 | Partially covered; approved procedures are a gap. Need authority, timelines, evidence standards, cost/liability allocation, escalation and appeal. 011 is not an approved SOP. |
| EVI-16 / CV-16 | Commodity/destination export and import requirements | 004, 008, 011, 020 | Regulatory screening framework exists; route-specific confirmation outstanding. No commodity/destination chosen. Need current official requirements and confirmation from competent authorities or qualified authorised parties. |
| EVI-17 / CV-17 | Data protection, privacy and security obligations | 004, 011, 014, 018, 019, 023 | Genuine formal-assessment gap. Need data map, controller/processor roles, lawful purposes, notices, processor terms, retention/deletion, incident plan and ODPC applicability assessment. |
| EVI-18 / CV-18 | Dependency-based plan and readiness gates | 005, 006, 012, 019–021 | Sequencing and gate concepts exist; approved dependency baseline outstanding. Need critical path, owners, dependencies, decision dates, fallback dates and explicit shipment stop rule. |
| EVI-19 / CV-19 | Numeric pilot indicators and evidence thresholds | 005, 006, 012, 021, 022 | KPI concepts exist; complete KPI dictionary is a gap. Need definitions, formulas, baselines, thresholds, sources, owners, frequency and decision use. Do not invent targets before commodity and pilot scope are selected. |
| EVI-20 / CV-20 | Keep advanced capabilities phase-gated | Concept Paper v1.1, Manual v3.0, 011, 019, 020 | Substantively covered; **IN PROGRESS in the 18 Nov snapshot**. Blockchain, smart-contract escrow/release, automated FX, connected sensors and AI forecasting remain deferred/conditional. Maintain reconsideration triggers and keep them off the pilot critical path unless separately approved. |
| EVI-21 | Simulated end-to-end transaction and mock shipment dossier | 011, 014, 021–023 | Test design, fixtures, workbook and local prototype exist; execution/review outstanding. v0.4 logic harness is not browser execution. Need operator run, 16 positive steps, 12 browser negative tests, retained evidence, defects/workarounds and independent review. |
| EVI-22 | Controlled evidence repository and decision log | 005, 006, 018-A, Project Home, Evidence Register protocol | Repository structures exist; control operation not evidenced in the snapshot. Need confirmed controlled location, access roles, naming/version rules, dated evidence references, change history and maintained decision log. |
| EVI-23 | Pilot scope boundaries and stop-loss conditions | 005, 011, 012, 018-A, 019, 020 | Principles and boundaries exist; formal scope/stop-loss decision outstanding. Need parties, commodity, geography, volumes, activities, exclusions, budget ceiling, stop conditions and escalation approved by authorised decision-maker. |
| EVI-24 | Formal Phase 0 checkpoint and GO/HOLD/NO-GO decision | 005, 006, 018-A, Project Home, 021–023 | Decision framework exists; formal Phase 0 decision not issued in the snapshot. Need mandatory evidence review, signed decision, evidence references, residual risks, owners and review/expiry date. Sponsor D-01–D-07 approval is not the Phase 0 GO decision. |

## Consolidated gap classification

### A. Design covered, evidence or execution still missing

EVI-01, 02, 03, 04, 05, 06, 07, 08, 10, 11, 14, 16, 18, 20, 21, 22, 23 and 24. Do not automatically create more documents. Obtain the specific proof required by each closure test and update the existing evidence record.

### B. Partially covered; targeted completion required

- **EVI-09:** batch states, units, conversions and precision.
- **EVI-15:** dispute, rejection, cancellation, refund and claims procedures.
- **EVI-19:** KPI dictionary and thresholds.

### C. Genuine document/design gaps

- **EVI-13:** full cost/revenue and unit-economics model, including payer validation and producer net proceeds.
- **EVI-17:** formal data-protection and security assessment.
- Approved operational SOP pack remains a separate gap; 011 is a proposed operating blueprint, not an approved SOP.
- Product Blueprint extensions, UI/UX pack and Go-to-Market strategy are future product/commercial work, not existing evidence-register deliverables.

### D. Execution and decision gates

- **EVI-12:** Migration 001 PostgreSQL execution and full tests; UNVERIFIED in source snapshot.
- **EVI-21:** Level 1 rehearsal execution and independent review; OPEN in source snapshot.
- **EVI-24:** formal Phase 0 decision; OPEN in source snapshot.

## Controlled corrections and cautions

- Sponsor D-01–D-07 were approved with conditions on 17 November 2026. This does not close the attached conditions, appoint counterparties, authorise Migration 002 or constitute Phase 0 GO.
- Deliverable 015's old 20-table count is superseded by the corrected 22-table inventory in 016/018. Preserve 015 as historical review.
- Do not change EVI-12 without PostgreSQL execution evidence and independent review.
- Do not change EVI-21 without an executed rehearsal and review.
- Do not treat prototype negative prompts or a mocked-DOM harness as production security/data-integrity proof.
- Do not infer a selected commodity, buyer, producer, exporter, hub, provider, destination, budget or funding commitment.

## Recommended order of work

1. Confirm evidence repository access/roles, decision log and accountable workstream owners.
2. Obtain buyer specification and producer/cooperative supply evidence; screen/select one commodity/destination; then identify qualified seller/exporter and site.
3. Confirm legality and service chain; qualify providers; settle contracts, claims/disputes, data roles and site permissions.
4. Build the cost/revenue model, test payer acceptance and define KPIs/stop-loss limits.
5. Under authorised conditions, execute Migration 001 in isolated PostgreSQL and run the Level 1 rehearsal with synthetic data and independent review.
6. Review all mandatory evidence and issue signed GO/HOLD/NO-GO. Live trade remains NO-GO until applicable gates pass.

## Source and authority

[Phase 0 Evidence-to-Deliverable Reconciliation — Working Control Note](https://app.notion.com/p/41c6808bcd9e81ca9616e80cb359b70d)

The Notion Evidence Register remains the operational master. This repository file is a navigation and gap-analysis aid only. It does not create deliverables, approve SOPs, change Evidence Register statuses, authorise migration execution or authorise live operations.
