# Phygital Notion-to-repository disposition map

**Review date:** 19 November 2026  
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
| 011 Pilot Operating Model & End-to-End Service Blueprint | Dedicated operating model + workflow mapping | `docs/operations/`, `docs/product/`, `docs/domain/`; digital workflows remain subordinate to the physical operating model and authority. |
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
- The two 011 records and duplicated migration acceptance/test records require canonical-page confirmation before any future Notion update. Their content is not a reason to create duplicate repository modules.
- Do not copy whole Notion pages into GitHub by default. Implement the durable requirements in the correct source-controlled artefact and retain a source/version link and traceability ID.

## 7. Maintenance procedure

When a Notion source changes:
1. Re-fetch the canonical page and verify version, status, parent and complete content.
2. Compare the new content with this disposition map and the current repository.
3. Record source requirement IDs, additions, removals, contradictions and affected paths.
4. Update domain, data, API, UI, security, tests, runbooks and ADRs only where impacted.
5. Preserve prior decisions, test evidence and commit history.
6. Never close a Notion evidence item or programme gate solely because a repository file was added.
