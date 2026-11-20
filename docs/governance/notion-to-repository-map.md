# Phygital Notion-to-repository disposition map

**Review date:** 20 November 2026  
**Repository:** Actifyappps/Phygital  
**Purpose:** Decide which Notion programme records require a durable repository home, where that home belongs, and which records should remain source/evidence references rather than being copied wholesale.

## 1. Disposition rules

- **Dedicated repository section:** the source defines a durable product/domain/engineering/operational capability that needs implementation artefacts, tests, runbooks or versioned contracts.
- **Integrated into an existing section:** the source is important but its requirements belong in an already established domain; do not create a parallel subsystem just to mirror a Notion document number.
- **Governance/evidence index only:** the record governs, explains, validates or proves a decision; keep its source link, version, status and findings traceable, but do not reproduce the full report as code structure.
- **Historical/archive only:** preserve provenance and lessons; do not implement superseded or conflicting design as current requirements.
- **Conditional/future:** reserve a logical home only where a real future capability is established; do not activate it before its evidence and authority gates.

A Notion document number is not automatically a repository folder, package, service or module. Repository boundaries follow stable product capabilities and domain ownership, not the sequence of documents.

## 2. Strategic and governing sources

| Notion source | Repository disposition | Exact home / treatment |
|---|---|---|
| Concept Paper v1.1 — governing strategic baseline | Governance index + capability roadmap | `docs/governance/source-document-register.md`; `docs/product/product-scope.md`; `docs/architecture/phase-gated-capabilities.md`. Preserve the four pillars and staged ambition; do not turn future pillars into active services. |
| Technical Development Manual v3.0 | Integrated engineering/operating baseline | `docs/architecture/`, `docs/delivery/`, `docs/operations/`; source link in register. It is subordinate to Concept Paper v1.1 and is not itself a technology selection. |
| Project Home (current: 44c6808b…) | Repository governance index | `docs/governance/source-document-register.md`; current programme status and hierarchy mirrored in `project-status.md`. |
| Earlier Project Home (4136808b…) | Historical/superseded | Keep as source history only; do not use as current authority. |
| 018-A Sponsor Decision Pack D-01–D-07 | Governing constraints in domain, data and test controls | `docs/governance/source-of-truth.md`, `docs/governance/requirements-traceability.md`, `docs/domain/`, `docs/data/`, `docs/quality/`. These are approved with conditions, not permission for live operations. |
| Actify AADDG and TSBBF | Engineering lifecycle and technology selection controls | `docs/delivery/`, `docs/security/`, `docs/decisions/`; retain external governing references. Do not treat folder names as stack selection. |

## 3. Phase 0 validation and operating records 001–023

| Source | Disposition | Repository home |
|---|---|---|
| 001 Strategic Baseline Audit | Governance/evidence index only | `docs/governance/source-document-register.md`; preserve assumptions and unresolved decision references. |
| 002 Database & Inventory-Integrity Validation | Integrate findings | `docs/data/`, `docs/quality/`, `docs/architecture/`; particularly allocation consistency, concurrency, stock ledger, tenant security, event idempotency and migration controls. |
| 003 Commercial & Operational Assumption Validation | Dedicated commerce + operations sections | `docs/commerce/`, `docs/operations/`, `docs/measurement/`; fees, payer, value received, costs, unit economics, hub/provider shares, working capital and ownership. |
| 004 Pilot Feasibility & Kenya-Specific Compliance Validation | Dedicated compliance section; source report indexed | `docs/compliance/`; preserve commodity/destination specificity and legal-review boundaries. This report is not a legal clearance. |
| 005 Consolidated Baseline Validation & Phase 0 Go/No-Go | Governance/evidence index only | `docs/governance/project-status.md`, `docs/governance/source-document-register.md`, `docs/delivery/release-gates.md`. |
| 006 Phase 0 Evidence Register & Workstream Assignment | Evidence control integration | `evidence/`, `docs/governance/`, `docs/operations/`; Notion remains the master live evidence register. |
| 007 Buyer & Producer Validation Instruments | Discovery templates and synthetic test scenarios | `docs/product/`, `docs/operations/checklists/`, `fixtures/`; actual interview records remain controlled evidence, not source code. |
| 008 Commodity & Destination Screening Framework | Dedicated rule-governance section | `docs/compliance/commodity-destination-rule-governance.md`; rule lifecycle, source authority, versioning and hard-stop handling. |
| 009 Legal & Commercial Role Map and Funds-Flow | Integrate into authority and commerce | `docs/domain/`, `docs/commerce/`, `docs/data/`; reconcile older role proposals to 018-A D-01–D-07. |
| 010 Hub & Facility Readiness Assessment | Dedicated operations/facility capability | `docs/operations/`; hub capability, permission, safety, service boundary, staffing and cost; no assumed appointment or custody. |
| 011 Pilot Operating Model & End-to-End Service Blueprint (current Project Home link: dfe6808b…) | Dedicated operating model + workflow mapping | `docs/operations/`, `docs/product/`, `docs/domain/`; digital workflows remain subordinate to the physical operating model and authority. The reconstructed 4136808b… copy is retained as history, not a parallel authority. |
| 012 Phase 0 Execution & Evidence Acquisition Plan | Governance/evidence index and workstream planning | `docs/governance/`, `evidence/`; do not convert indicative days into delivery commitments. |
| 013 Buyer, Producer, Hub & Provider Validation Pack | Discovery/qualification templates | `docs/operations/checklists/`, `fixtures/`, `evidence/`; no real participant data in public repo. |
| 014 Technical Test Harness & End-to-End Simulation | Dedicated executable test/evidence framework | `tests/`, `fixtures/`, `scripts/quality/`, `evidence/`; specification is not proof of execution. |
| 015 Technical Readiness Review & Migration 001 Remediation | Data/migration controls and defect traceability | `docs/data/`, `docs/delivery/`, `docs/quality/`; migration 001 remains HOLD. |
| 016 Migration 002 Design Decision & Remediation | Conditional data architecture and ADR inputs | `docs/data/`, `docs/decisions/`; not implementation authority. |
| 017 Migration 002 Detailed Technical Design | Conditional schema/service design reference | `docs/data/`, `docs/api/`, `docs/architecture/`; no executable migration until separately authorised. |
| 018 Migration 001 Schema Inventory, ERD & Conformance Review | Data lineage and migration evidence | `docs/data/`, `evidence/`; descriptive source schema review only. |
| 018-A Sponsor Decision Pack | See governing sources above | `docs/governance/` and all affected domain/test homes. |
| 018-B Migration 001 Column-Level Dictionary | Data dictionary source | `docs/data/dictionaries/`; retain source hash and distinguish source schema from approved target model. |
| 018-C Source-to-Target Mapping & Conditional Target ERD | Conditional data migration mapping | `docs/data/`, `docs/architecture/diagrams/`; preserve HOLD/not-authorised status. |
| 019 Minimum-Documentation Operationalization Strategy | Dedicated operational design and assisted-use requirements | `docs/operations/`, `docs/product/`, `web/features/`; minimum documentation must not weaken evidence, authority or accountability. |
| 020 Pilot Route Selection & Minimum-Documentation Feasibility | Route decision and pilot gate model | `docs/compliance/`, `docs/operations/`, `docs/product/maturity-axes-and-gates.md`; route is a complete producer-to-buyer/export pathway, not a commodity-only choice. |
| 021 Level 1 Digital Readiness Rehearsal | Human-executable rehearsal case pack | `tests/`, `fixtures/`, `evidence/`; rehearsal plan does not establish execution. |
| 022 Level 1 Test Data Pack & Execution Workbook | Synthetic fixtures and run templates | `fixtures/`, `tests/cases/`, `evidence/`; do not move real personal/commercial data into Git. |
| 023 Level 1 Local Prototype & Operator Handover | Prototype artefact, operator guide and known-defect record | `web/prototypes/` or controlled release artefact area when source is provided; `docs/operations/runbooks/`; do not imply the prototype is production software. |
| EVI-21 Run & Independent Review Pack | Evidence record and acceptance gate | `evidence/level-1/`, `docs/quality/`; EVI-21 OPEN / Closure Accepted NO until independently accepted. |
| Evidence Register Operating Protocol + database | Evidence metadata and closure workflow | `evidence/`, `docs/governance/`; Notion remains the live register of record; repository stores only approved, minimised evidence artefacts. |

## 4. Digital product specification series 024

| Source | Repository disposition | Exact home |
|---|---|---|
| 024 Product Blueprint | Product baseline integrated across repo | `docs/product/`, `docs/domain/`, `docs/architecture/`; do not duplicate the full blueprint in a single file. |
| 024-A Authority & Permission Matrix | Dedicated identity/authority domain | `packages/domain/authority/`, `docs/security/`, `docs/domain/`, tests for seller/exporter separation and machine-testable permission tuples. |
| 024-B Workflow, State & Business Rules | Workflow contracts and domain behaviour | `docs/product/workflow-state-index.md`, `packages/domain/*`, `tests/`; one state owner per bounded context. |
| 024-C Information Architecture & Data Dictionary | Logical data dictionary and relationships | `docs/data/dictionaries/`, `docs/data/`, `packages/domain/*`; separate logical model from physical schema/migrations. |
| 024-D API & Integration Contracts | Contract-first API/event definitions | `docs/api/`, `packages/contracts/`, `integrations/`; IA-09 trust, disputes, appeals and recalls need explicit contract coverage. |
| 024-E Screens & Interaction | Screen requirements and UX implementation | `web/features/`, `docs/product/`; separate public, buyer, supplier, hub, operations and reviewer surfaces. |
| 024-F Security, Privacy, Threat & Abuse | Dedicated security and trust controls | `docs/security/`, `docs/marketplace-trust/`, `tests/security/`; include public/QR projection, offline/device security, abuse reporting, appeals and incident response. |
| 024-G Test Strategy & Acceptance Evidence | Quality engineering control | `docs/quality/`, `tests/`, `evidence/`; keep test design, execution, independent review and closure distinct. |
| 024-R Independent Product Completeness Audit | Audit finding crosswalk, not a runtime module | `docs/quality/024r-audit-coverage-matrix.md` and this map. Audit record itself remains linked and immutable. |

### 024-R findings requiring explicit repository homes

| Finding | Required repository home |
|---|---|
| F-01 Evidence class versus provenance conflict | `docs/data/evidence-and-provenance-model.md`, `docs/data/dictionaries/`, tests |
| F-02 Seller and exporter are distinct capacities | `packages/domain/authority/`, `docs/security/`, permission/mandate tests |
| F-03 Pilot maturity levels versus software delivery stages | `docs/product/maturity-axes-and-gates.md`, release and pilot gate records |
| F-04 Withdrawal, recall, trace-forward and trace-back | `docs/product-integrity/`, `packages/domain/product-integrity/`, data/API/UI/test surfaces |
| F-05 Service catalogue, fees, billing and producer net proceeds | `docs/commerce/`, `packages/domain/commercial/`, `docs/data/`; implementation disabled pending approved model |
| F-06 Marketplace trust, listing integrity and abuse handling | `docs/marketplace-trust/`, `packages/domain/marketplace-trust/`, security and public-marketplace UI/tests |
| F-07 Offline device and synchronisation threats | `docs/architecture/offline-and-sync-architecture.md`, `docs/security/`, `tests/offline/` |
| F-08 Commodity/destination rule catalogue lifecycle | `docs/compliance/`, `packages/domain/compliance-rules/`; no automated legal determination |
| F-09 Versioned binding commercial terms | `docs/data/terms-and-fee-snapshots.md`, `docs/commerce/`, order/quotation tests |
| F-10 Machine-testable authorisation tuples | `packages/domain/authority/`, `docs/security/`, contract and database policy tests |
| F-11 Commercial and operational ownership | `docs/operations/service-ownership-and-support-model.md`, `docs/commerce/` |
| F-12 Producer/buyer value and outcome measures | `docs/measurement/`, `docs/product/`; baselines and numeric targets require evidence |

## 5. Planned or unresolved deliverables — do not invent authority

- **024-H:** a logical architecture/deployment/operations specification is the next planned companion in the sequence, but it has not been established as a completed Notion source in this scan. Its eventual home is `docs/architecture/`, `docs/delivery/` and `docs/operations/`. The repository does not create or approve it.
- **024-I:** 024-R explicitly concludes that no new 024-I is justified at this point. Do not create one merely to house audit findings.
- **025 — Commercial service catalogue and fee/billing model:** 024-R says a dedicated Deliverable 025 was referenced but not located in the workspace search. The repository reserves a domain home in `docs/commerce/`, but its programme identifier and approval remain unresolved. This repository section is not a substitute for sponsor confirmation.
- **026 — Screen/wireframe deliverable:** 024 refers to future screen/wireframe work. The existing 024-E remains the screen requirement authority; any approved wireframes belong under `web/design/` or an agreed design artefact location, not a duplicate product specification.
- Future connected sensors, blockchain anchoring, provider-led escrow, automated FX/customs/government/lab/carrier integrations, AI forecasting and multi-route scale are phase-gated. They receive architecture seams and decision records only, not active implementation modules.

## 6. Duplicate and archived source handling

- Use the current Project Home under the Saintsway Equity workspace as the current programme index.
- Where two Notion pages share a title/number, use the page linked from the current Project Home/document register; preserve the other as history until the project owner formally retires it.
- Archived Concept Paper and Development Manual versions are historical evidence only. Do not import their former microservices, Tailwind, blockchain, escrow or provider assumptions as current decisions.
- The current Project Home links to 011 page `dfe6808b…`; the reconstructed `4136808b…` copy is retained as history. The current Project Home also links to the canonical Migration 001 candidate schema, smoke-test and acceptance-checklist pages; their content is preserved under the explicit repository HOLD directory, not as active migrations.
- Do not copy whole Notion pages into GitHub by default. Implement the durable requirements in the correct source-controlled artefact and retain a source/version link and traceability ID.

## 7. Maintenance procedure

When a Notion source changes:
1. Re-fetch the canonical page and verify version, status, parent and complete content.
2. Compare the new content with this disposition map and the current repository.
3. Record source requirement IDs, additions, removals, contradictions and affected paths.
4. Update domain, data, API, UI, security, tests, runbooks and ADRs only where impacted.
5. Preserve prior decisions, test evidence and commit history.
6. Never close a Notion evidence item or programme gate solely because a repository file was added.



## 8. Additional source-level reconciliation (19 November 2026)

| Source / record | Repository disposition | Exact home / treatment |
|---|---|---|
| 018 parent — Migration 001 Schema Inventory, ERD & Design Conformance Review | Migration provenance and governance index | `docs/data/`, `evidence/`; retain its relationship to 018-A/B/C and do not treat source schema as approved target schema. |
| Notion Migration 001 Candidate Schema page | Preserve source under explicit HOLD | `supabase/candidates/migration-001-hold/migration_001_candidate.sql`; not in active migrations. |
| Notion Migration 001 Smoke & Constraint Tests page | Preserve source under explicit HOLD | `supabase/candidates/migration-001-hold/migration_001_tests_candidate.sql`; inspected, not executed. |
| Database Acceptance Checklist — Migration 001 | Preserve as test plan | `supabase/candidates/migration-001-hold/database_acceptance_checklist.md`; not a test result. |
| Migration 001 source-provenance record | Hash/lineage index | `docs/data/migration-001-source-provenance.md`; original checksums and HOLD status. |
| 024-C — ten information domains and 65 logical entities | Dedicated full entity-to-context crosswalk | `docs/domain/024c-entity-to-context-crosswalk.md`; each ENT-001–ENT-065 has one primary repository owner. |
| 024-B — WF-01–WF-18 and BR-001–BR-034 | Workflow and business-rule crosswalk | `docs/product/workflow-to-context-crosswalk.md`; links rules to bounded contexts. |
| 024-D — API contract groups and API-OD-01–12 | API contract map | `docs/api/024d-contract-domain-map.md`; logical contracts only, unresolved decisions remain open. |
| 024-E — six product surfaces and six journeys | Surface/navigation requirements | `docs/product/surface-and-navigation-map.md`; seller/exporter capacity is not an extra implicit role portal. |
| 024-F — SEC-001–020 and ST-01–24 | Security control/test crosswalk | `docs/security/024f-control-and-test-crosswalk.md`; requirements only, not security acceptance. |
| 024-G — QAT-001–QAT-036 | Product acceptance crosswalk | `docs/quality/024g-test-catalogue-crosswalk.md`; cases not executed by being documented. |
| AADDG v1.0 and TSBBF v1.0 | Engineering operating and technology decision standards | `docs/delivery/actify-engineering-operating-standards.md`; company standards applied as project controls without implying selected hosting/backend. |
| Deliverable 023 / Level 1 prototype v0.4 | Preserve controlled synthetic prototype | `tests/prototypes/level1/`; checksum recorded; browser rehearsal and independent acceptance remain open. |

### Repository treatment of 024-C's ten information domains

The repository uses bounded contexts rather than a one-folder-per-document scheme. The ten logical IA domains are preserved and mapped in the crosswalk; the 65 entities are assigned a primary owner. New package boundaries (marketplace, quotations-orders, cases, offline-sync and privacy) are refinements of 024-C logical ownership, not additional product scope or microservices.

### Current specification authority and status

024 v0.1d and 024-A v0.1b through 024-G v0.1 are draft specifications for sponsor, technical, operational and specialist review. 024-R's 12 findings are mapped but not closed by repository documentation. 024-H is not confirmed as completed; 024-I is not justified by 024-R; 025 was referenced but not located; 026 wireframes remain conditional. No code folder, package or crosswalk changes these statuses.


### Archive and live evidence register disposition
- Current archive index: `5d66808b…`. Earlier Concept Paper, Manual v2, earlier Development Manual and B2B Export Hub Manual v1 are historical sources only. They must not silently override Concept Paper v1.1 and Development Manual v3.0.
- The live Phase 0 Evidence Register database remains in Notion. GitHub contains evidence schemas, test artifacts and sanitized records only; it does not replace the live register or close evidence items.
- The 48 page links in the current Project Home were enumerated. This register maps the current 001–024-G programme sequence, supporting records, archive pages and technical artifacts; the separate 024-R audit and current 024 specifications are cross-referenced. The register should be re-run when the Project Home document register changes.


## 9. Second-pass digital scope reconciliation (20 November 2026)

The current Project Home (44c6808b…) was refetched. Its linked source set was reviewed across the strategic baseline, 001–023 validation/operating/technical records, 024 product blueprint, 024-A–G and 024-R, the Evidence Register protocol/database and archive index. Targeted searches were also run for 024-H, 025, passport/QR, notifications, accessibility/localization, low-bandwidth, and external integrations.

### Additional durable digital homes

| Requirement area | Source authority / evidence | Repository home |
|---|---|---|
| Six distinct UI surfaces and navigation | 024, 024-E | `web/surfaces/`, `docs/product/surface-and-navigation-map.md` |
| Screen states, interaction patterns and component inventory | 024-E | `docs/product/screen-state-catalogue.md`, `docs/product/design-system-and-component-catalogue.md`, `web/design-system/` |
| Responsive, accessibility, localization, language, low-bandwidth, assisted/shared-device experience | 024-E, 019, 021–023 | `docs/product/accessibility-localisation-and-low-bandwidth.md`, `tests/accessibility/`, surface-level test suites |
| Notifications and communications | 024, 024-D, 024-E | `packages/domain/notifications/`, `web/features/notifications/`, `docs/product/notifications-and-communications.md`, `integrations/` |
| Digital product passport, QR and public disclosure | Concept Paper v1.1, Manual v3.0, 024, 024-E, 024-F | `docs/product/digital-product-passport-and-public-projections.md`, `packages/domain/public-projections/`, `web/features/product-passport/`, `docs/decisions/ADR-0007-public-projections-and-qr.md` |
| Facility, partner and provider readiness | 010, 011, 013, 024, 024-B/C/D/E | `docs/operations/partner-and-provider-readiness.md`, `packages/domain/partner-readiness/`, `web/features/partner-readiness/` |
| Product capability to implementation/test ownership | 024, 024-A–G, 024-R | `docs/product/functional-capability-map.md`, `docs/quality/024e-screen-acceptance-crosswalk.md` |
| Architecture/deployment/operations specification gap | 024-R F-03/F-07/F-11 and allocation to 024-H; AADDG/TSBBF | `docs/architecture/024h-architecture-operations-gap.md`, `docs/governance/unresolved-source-deliverables.md` |

### Explicitly not a new subsystem

- Product passport is a read-only, permission-filtered projection over authoritative product, batch, evidence, document, compliance and shipment records. It must not become a second source of truth or imply certification.
- Reporting/analytics remains under the existing measurement context; dashboards and exports are controlled projections, not a new mutable domain.
- Provider/facility readiness is a time-bounded assessment and scope record; it does not create an appointment, procurement award, contract or authority.
- Notification delivery is not evidence that a person read, accepted or acted on a notice.
- UI roles, navigation and buttons never replace server-side permission enforcement.
- The six UI surfaces are navigation/security boundaries, not six separate applications or deployments.

### Missing or unconfirmed source deliverables

- 024-R allocates architecture, deployment and operations work to 024-H, but targeted search and the current Project Home did not surface a completed 024-H page. The repository records the gap; it does not fabricate a 024-H source or mark the work complete.
- 024-R references Deliverable 025 for commercial service catalogue/fees/billing/net proceeds. Targeted search did not locate a dedicated 025 page. The current commerce design docs preserve the requirement without implying approval.
- 026 wireframes are future/conditional; no wireframe pack was identified. 024-E remains the screen-requirements authority.
- Developer Guide v0.1 is mentioned in programme work but was not found as a canonical source in the current Project Home or targeted search. Its exact source location/version requires confirmation.
- A separate Phase 0 Work Map is a draft for sponsor review, not a new governing source. The provider qualification item surfaced as an Evidence Register row, not a standalone specification.

### Archive and duplicate handling

The current archive index says Concept Paper v1.1 and Technical Development Manual v3.0 govern; earlier concept/manual drafts remain historical. The second Project Home and reconstructed 011 copy are retained as superseded/history. Repository structure is derived from the current sources and their dependencies, not old archive-only features.

### Coverage status discipline

This mapping establishes that a requirement has a repository home. It does not mean the requirement is designed in detail, implemented, tested, independently reviewed or accepted. Each transition remains separately evidenced under `docs/governance/requirements-traceability.md` and the Notion Evidence Register.


## 10. Historical archive feature review

The archived earlier concept and implementation manuals were inspected for potentially reusable digital capabilities. The following ideas remain relevant only where retained by the current Concept Paper v1.1 and its phase gates:

- Digital product passport and QR-linked batch view → current read-only projection design; no certification or private-data bypass.
- Connected scales/moisture meters and sensor ingestion → later capability after device accuracy, calibration, operational fit and provider evidence.
- Blockchain anchoring and smart contracts → deferred; only after measurable benefit, legal/security review and separate architecture decision.
- Escrow, FX conversion and automated payouts → deferred; no platform-held funds or escrow under current D-07.
- Provider webhooks and payment status → candidate adapter pattern only; provider contract, authenticity, idempotency, reconciliation and authorization required.
- Demand mapping, AI forecasting and SMS advisories → descriptive reporting first; forecasts/advisories only after sufficient lawful data and separate validation.
- Multi-county/national rollout → future scale decision, not a current product or deployment assumption.

Older manuals also contain stack, endpoint and schema proposals that are superseded or remain unselected. They are not copied into active packages or treated as architecture decisions. Reuse of any archived detail requires explicit comparison against Concept Paper v1.1, Technical Development Manual v3.0, 018-A and 024.

Duplicate archive pages and older Project Home/011 copies are indexed as historical aliases. They do not create parallel authorities or additional modules.


| Phase 0 Evidence-to-Deliverable Reconciliation — Working Control Note | Governance/evidence crosswalk; not a new numbered deliverable or status register | `docs/governance/evidence-to-deliverable-reconciliation.md`; preserve 24-item coverage, gap classes, evidence dependencies and execution gates; Notion Evidence Register remains operational master |


## 8. Technical Development Manual v3.0 — detailed digital scope integration

The fetched canonical Manual v3.0 is mapped in `docs/architecture/technical-development-manual-v3-crosswalk.md`. Its scope is integrated into existing domain homes rather than copied as a parallel numbered subsystem:

- modular-monolith-first logical shape, web surfaces, API, domain modules, relational transaction store, private files, background work and replaceable provider adapters → `docs/architecture/`, `web/`, `packages/domain/`, `integrations/`, `workers/`;
- identity/organisations/memberships; catalogue/listings; hub intake/batches/measurement/quality; inventory/reservations/movements; buyer enquiry/quotation/order; documents/compliance/fulfilment; payment status/reconciliation; cases/disputes; notifications/reporting/audit → corresponding domain packages and surface feature homes;
- stable identifiers, decimal quantities/money, explicit units/currency, append-only movement/audit records, concurrency-safe allocation, immutable accepted-quotation snapshots, idempotency and server-side authorization → `docs/data/`, `docs/security/`, `docs/api/`, `tests/`;
- offline capture, device provenance/calibration, synthetic-data isolation, QR public-safe projection and blockchain deferral → existing offline, measurement, evidence, public-projection and phase-gate controls;
- payment references/status/reconciliation only at baseline; no platform-held funds, custom escrow wallet or automatic release on webhook/QR scan.

The manual's endpoint names are proposals; 024-D remains the technology-neutral API contract authority. Its candidate stack and migration references do not override TSBBF/ADR decisions or current migration holds.

## 9. Phase 0 Work Map integration

The 17 November draft Work Map is indexed at `docs/operations/phase-0-work-map-and-dependencies.md`. Its governance, external evidence, technical, legal/data-protection and checkpoint tracks are mapped into existing repository homes. It is a planning aid, not a kickoff, appointment, schedule or approval. The five external unlocks (buyer specification, qualified producer/cooperative, seller/exporter authority, facility readiness and written commodity/destination pathway) remain evidence dependencies, not features the software can manufacture.

The Work Map's historical statement that D-01–D-07 were selections awaiting approval is superseded by the 018-A record of approval with conditions on 17 November 2026. Its proposed Migration 001 execution / Migration 002 drafting tasks do not supersede current controls: Migration 001 HOLD; Migration 002 not authorised.
