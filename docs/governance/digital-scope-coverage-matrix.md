# Phygital digital scope coverage matrix

**Review date:** 20 November 2026  
**Coverage basis:** Current Project Home and linked source set, targeted Notion searches, 024 product blueprint and 024-A–G, 024-R, Concept Paper v1.1, Technical Development Manual v3.0, Phase 0 operating/technical sources.  
**Purpose:** A single navigation and completeness control showing where every material digital capability belongs in this repository. This is a coverage map, not implementation evidence.

## 0. Specification coverage inventory

The current 024 source set contains the following traceability units, each represented by a dedicated repository map or test home:

| Source artefact | Count / range | Repository control |
|---|---:|---|
| 024-C logical information model | 10 IA domains; 65 entities (ENT-001–ENT-065) | `docs/domain/024c-entity-to-context-crosswalk.md` |
| 024-B workflows | 18 workflows (WF-01–WF-18) | `docs/product/workflow-to-context-crosswalk.md` |
| 024-B business rules | BR-001–BR-034 | `docs/product/workflow-to-context-crosswalk.md` |
| 024-D API open decisions | 12 (API-OD-01–12) | `docs/api/024d-contract-domain-map.md` |
| 024-E screen inventory | 36 screens across six surfaces | `docs/product/024e-screen-inventory.md` |
| 024-E user journeys | 6 (J-01–J-06) | `docs/product/024e-journey-crosswalk.md` |
| 024-E screen acceptance | 18 criteria | `docs/quality/024e-screen-acceptance-crosswalk.md` |
| 024-F security controls | 20 (SEC-001–SEC-020) | `docs/security/024f-control-and-test-crosswalk.md` |
| 024-F security tests | 24 (ST-01–ST-24) | `docs/security/024f-control-and-test-crosswalk.md` |
| 024-G product acceptance | 36 (QAT-001–QAT-036) | `docs/quality/024g-test-catalogue-crosswalk.md` |
| 024-A permission tests | 15 base tests plus 10 seller/exporter supplement tests | `docs/security/024a-authorisation-tuple-model.md` |

Counts reflect the fetched specification content and repository crosswalks; they do not mean the tests have been executed or accepted.

## 0A. Concept Paper v1.1 technology-pillar coverage

| Pillar | Initial digital home | Deferred digital home / gate |
|---|---|---|
| Decentralized quality assurance and aggregation | `hub-services/`, `measurement/`, `evidence/`, `inventory/`, laboratory/provider integration catalogue | Connected scales/meters only after calibration, accuracy, operator and workflow validation |
| Digital Product Passport | `packages/domain/public-projections/`, `web/features/product-passport/`, `docs/product/digital-product-passport-and-public-projections.md` | Blockchain anchoring only after justified buyer/partner benefit and separate legal/security/TSBBF decision |
| Payment and escrow rails | `payment-status/`, direct buyer-to-seller references, manual/provider-verified reconciliation | Provider-led escrow, FX and payouts deferred; no platform-held funds or wallet under D-07 |
| Demand mapping and market intelligence | `measurement/`, `docs/measurement/demand-mapping-and-market-intelligence.md` | AI forecasting and SMS advisories only after sufficient lawful data, validation and separate approval |

See `docs/architecture/phase-gated-capabilities.md` for the governing staged capability boundary.

## 1. Product and experience

| Capability | Governing source | Repository home | Surface / verification |
|---|---|---|---|
| Product definition, principles, exclusions, roadmap and measures | Concept Paper v1.1; 024 | `docs/product/product-scope.md`, `docs/product/maturity-axes-and-gates.md` | Product review; stage/level gate tests |
| Public marketplace, discovery and listing | 024 §§5–7; 024-E | `packages/domain/marketplace/`, `web/features/public-marketplace/` | Public marketplace surface; public disclosure tests |
| Buyer portal, requirements, enquiries, RFQ, quote and order | 024 §§4–7; 024-B/E | `packages/domain/buyer-requirements/`, `packages/domain/quotations-orders/`, `web/surfaces/buyer/` | Buyer surface; quote/order lineage tests |
| Producer/supplier onboarding, declarations and assisted intake | 007, 013, 019, 024, 024-E | `packages/domain/identity/`, `organisations/`, `supply/`, `evidence/`; `web/surfaces/producer/` | Producer surface; low-burden and permission tests |
| Hub service, facility capability and measurement | 010, 011, 013, 024 | `packages/domain/hub-services/`, `measurement/`, `partner-readiness/` | Hub surface; mandate and service-scope tests |
| Platform administration, operations, support and queues | 011, 024-A/E, 024-R F-11 | `packages/domain/cases/`, `authority/`, `audit/`; `web/surfaces/administration/` | Admin/operations surface; separation-of-duties tests |
| Independent review and assurance | 006, 011, 014, 021, EVI-21, 024-A/E/G | `packages/domain/evidence/`, `cases/`, `audit/`, `measurement/`; `web/surfaces/reviewer/` | Reviewer surface; independence and audit tests |
| Screen inventory, state catalogue, reusable interaction patterns | 024-E | `docs/product/surface-and-navigation-map.md`, `screen-state-catalogue.md`, `design-system-and-component-catalogue.md` | `web/design-system/`; screen-level acceptance |
| Responsive mobile-first, accessibility, localization, low bandwidth and shared-device use | 019, 021–023, 024-E | `docs/product/accessibility-localisation-and-low-bandwidth.md` | `tests/accessibility/`, offline and mobile test suites |
| Notifications, delivery and communication preferences | 024 §6.12, 024-D/E/F | `packages/domain/notifications/`, `docs/product/notifications-and-communications.md` | Notifications feature; delivery/privacy/replay tests |
| Product passport, QR and public-safe record projection | Concept Paper v1.1, Manual v3.0, 024, 024-E/F | `packages/domain/public-projections/`, `docs/product/digital-product-passport-and-public-projections.md` | Passport feature; public disclosure/QR security tests |

## 2. Domain and transaction capabilities

| Capability | Governing source | Repository home | Critical invariants |
|---|---|---|---|
| Authentication, session, recovery and service identities | 024-A/F; 017 | `packages/domain/identity/` | Authentication is not authorisation; revoke stale identity/device |
| Organisation, membership, representation and data-sharing purpose | 024-A; 024-C | `organisations/`, `privacy/` | Organisation membership is not member-data disclosure authority |
| Mandates, seller/exporter capacities, role grants and separation of duties | 009, 018-A D-02, 024-A | `authority/` | Seller and exporter separate, independently evidenced and scoped |
| Product catalogue, commodity forms, grades, units and rules | 008, 024-B/C/D | `catalogue/`, `compliance-rules/` | Rules versioned by jurisdiction, commodity, product form, route and date |
| Supply declaration, source identity, batch and provenance | 007, 011, 019, 024-C | `supply/`, `inventory/`, `evidence/` | Declaration is not verified stock |
| Intake, inspection, measurement and calibration provenance | 010, 011, 014, 024 | `hub-services/`, `measurement/` | Hub service scope does not imply custody/certification |
| Evidence objects, class E1–E4, acquisition type, verification and revocation | 008, 013, 024-R F-01, 024-C/F/G | `evidence/`, `docs/data/evidence-and-provenance-model.md` | Evidence class and acquisition type are separate dimensions |
| Documents, export dossier, issuer and version controls | 009, 011, 024 §6.9, 024-D | `documents/`, `fulfilment/` | Platform tracks documents; it does not issue regulated certificates |
| Marketplace listing, backing, publication and withdrawal | 024, 024-B/C/E | `marketplace/`, `marketplace-trust/` | No unsupported availability or certification claims |
| Buyer requirement and compatibility | 007, 013, 024-B/C | `buyer-requirements/`, `compliance-rules/` | Mismatch/unknowns surfaced; no auto-confirmed supply |
| Quotation, terms, acceptance and order | 009, 018-A D-05, 024-B/C/D | `quotations-orders/`, `commercial/` | One accepted quote per pilot order; immutable terms snapshot |
| Reservation, allocation, inventory ledger and physical movement | 002, 014–018-C, 024 | `inventory/`, `fulfilment/` | Reservation ≠ movement ≠ dispatch; concurrency and ledger integrity |
| Payment status and reconciliation | 009, 018-A D-07, 024 | `payment-status/` | Direct buyer-to-seller flow; no wallet/escrow/platform-held funds |
| Shipment visibility and milestone provenance | 011, 014, 017, 024 | `fulfilment/` | A milestone record is not proof of dispatch/custody absent evidence |
| Product holds, withdrawal, recall and trace-forward/back | 024-R F-04, 024-B/C/D/E/F/G | `product-integrity/`, `cases/` | No re-listing/reallocation until authorised release |
| Trust reports, abuse, moderation, appeals and reinstatement | 024-R F-06, 024-A/B/E/F/G | `marketplace-trust/`, `cases/` | Preserve evidence; appeal/review separation |
| Offline capture, device binding, queue replay and conflict resolution | 014, 016–017, 024-D/E/F/G, 024-R F-07 | `offline-sync/`, `docs/architecture/offline-and-sync-architecture.md` | Offline state is pending; high-impact actions controlled online |
| Audit, reporting, metrics and governance gates | 005–006, 011, 024, 024-R F-12 | `audit/`, `measurement/`, `docs/governance/` | Metric provenance and separate software/pilot maturity axes |
| Service catalogue, billing, fees and producer net proceeds | 003, 009, 024-R F-05, 024-D/E | `commercial/`, `docs/commerce/` | No fee engine or fee collection before approval/legal/tax review |
| Facility/provider readiness, contracts and integration lifecycle | 010, 011, 013, 024-D, 024-R F-11 | `partner-readiness/`, `docs/operations/`, `integrations/` | Candidate ≠ approved ≠ contracted ≠ active |

## 3. Engineering and assurance

| Engineering concern | Governing source | Repository home | Required proof |
|---|---|---|---|
| Logical API commands, queries, events and errors | 014, 017, 024-D | `docs/api/`, `packages/contracts/` | Contract tests, idempotency and schema compatibility |
| Security, privacy, threat and abuse control | 024-A/F; 017; AADDG | `docs/security/`, `tests/security/` | Negative tests, access review, secure file handling, audit |
| Unit, integration, E2E and technical harness | 014–017, 024-G | `tests/unit/`, `integration/`, `e2e/`, `contracts/` | Reproducible run record; synthetic data |
| UI acceptance and accessibility | 021–023, 024-E/G | `tests/accessibility/`, `tests/e2e/` | Manual and automated evidence; target WCAG 2.2 AA |
| Performance, reliability, resilience and recovery | 024 product NFRs; AADDG | `docs/delivery/`, `infra/`, `tests/performance/`, `tests/recovery/` | Measured environment-specific results |
| Integrations and adapters | 013, 024-D, Manual v3.0 | `integrations/`, `docs/integrations/` | Provider due diligence, contract, sandbox, security and exit test |
| Secrets, environments, deployment, rollback and observability | AADDG; TSBBF; Manual v3.0 | `docs/delivery/`, `infra/`, `.github/` | Approved architecture/ADR, reproducible CI and rollback evidence |
| Migration and database integrity | 002, 014–018-C | `supabase/candidates/migration-001-hold/`, `docs/data/` | Migration 001 remains HOLD; Migration 002 not authorised |
| Evidence capture, run control and independent review | 006, 014, 021–023, EVI-21, 024-G | `evidence/`, `docs/quality/` | Test execution ≠ independent review ≠ acceptance |

## 4. Scope and source gaps
- 024-H (architecture, deployment and operations) is allocated in 024-R but no completed source page was located in the current Project Home or targeted search. Do not invent its contents or status.
- 025 (commercial service catalogue, fees, billing and producer net proceeds) is referenced by 024-R but no dedicated page was located. Requirements remain mapped to `docs/commerce/`, not approved.
- 026 wireframes remain future/conditional; 024-E is the current screen-requirements source.
- Developer Guide v0.1 source location/version was not located in the current Project Home/targeted search; reconcile before treating it as canonical.
- The product blueprint and 024-A–G remain draft specifications. This matrix is repository coverage, not implementation completion.


## 8. Phase 0 evidence coverage and closure boundary

The 24 active Phase 0 evidence items EVI-01–EVI-24 are mapped individually in [evidence-to-deliverable reconciliation](evidence-to-deliverable-reconciliation.md). That map separates design coverage from real-world evidence, technical execution, independent review and formal decisions.

The 18 November 2026 source snapshot reported all 24 rows with Closure Accepted = NO and no Evidence Reference; EVI-12 was UNVERIFIED, EVI-20 IN PROGRESS and the remaining 22 OPEN. Treat those as historical snapshot values only. The live Notion Evidence Register remains the operational master and must be checked before any status claim or closure.

Material digital/operational gaps identified in that reconciliation include:
- PostgreSQL execution and full Migration 001 acceptance evidence (EVI-12).
- Full unit economics and payer willingness evidence (EVI-13).
- Formal data-protection/security assessment (EVI-17).
- Complete KPI dictionary and defensible thresholds (EVI-19).
- Executed Level 1 rehearsal and independent review (EVI-21).
- Approved SOP pack, distinct from the proposed 011 operating blueprint (EVI-15).
- Formal dependency baseline, stop-loss decision and Phase 0 GO/HOLD/NO-GO checkpoint (EVI-18, EVI-23, EVI-24).

A repository home, design document, test specification, prototype or logic harness is not closure evidence by itself. Preserve the distinctions between planned, prepared, executed, passed, reviewed, accepted and authorised.


## 5. Operational readiness, Phase 0 execution and technical harness traceability

| Source | Capability / control | Repository home | Current disposition |
|---|---|---|---|
| 010 | Facility model ladder, scorecard, 12 hard gates, site evidence, HUB-01–HUB-10 | `docs/operations/facility-capability-register.md`; `docs/operations/010-hub-facility-readiness-crosswalk.md` | Framework represented; no site selected or approved; HOLD |
| 012 | WP-0–WP-9, indicative 20-day sequence, evidence acquisition, Phase 0 checkpoint | `docs/operations/phase-0-work-map-and-dependencies.md`; `docs/operations/012-phase-0-execution-crosswalk.md` | Planning sequence represented; kickoff/appointments/external evidence not inferred |
| 014 | T0–T8 technical harness, synthetic fixture, data integrity, tenant isolation, audit/events, workflow and recovery | `docs/quality/014-technical-test-harness-crosswalk.md`; `tests/`; `evidence/test-runs/` | Specification represented; execution and independent acceptance not claimed |

These source additions do not change the live Evidence Register. Facility readiness, Phase 0 completion and technical acceptance remain distinct evidence/decision gates.
undefined

## 6. Migration source and conditional technical-design coverage

| Source | Repository home | What is represented | What is not claimed |
|---|---|---|---|
| 015 static technical readiness review | `docs/data/015-018b-technical-design-reconciliation.md`; `docs/data/migration-001-source-provenance.md` | Source hashes, R-01–R-12, static inspection limits and CV-06–CV-12 dispositions | PostgreSQL execution, security certification or technical acceptance |
| 016 Migration 002 design record | `docs/data/migration-002-design-boundary.md`; `docs/data/015-018b-technical-design-reconciliation.md` | Proposed technical D-01–D-12, M2-01–M2-24, ledger, state, units, authority, tenant and event controls | Approval to write/deploy Migration 002 SQL |
| 017 detailed technical design | `docs/data/015-018b-technical-design-reconciliation.md`; `docs/api/`; `docs/security/`; `docs/quality/`; `tests/` | Logical components, relationships, transaction/lock controls, access matrix, service contracts, audit/outbox and TD-01–TD-10 | Selected technology stack, implemented services or completed work packages |
| 018-B source data dictionary | `docs/data/migration-001-source-provenance.md`; `docs/data/015-018b-technical-design-reconciliation.md` | 22 source tables, 230 declared columns and static source metrics | Runtime catalogue export, approved target schema or executed migration |

Migration 001 remains HOLD; CV-12 remains UNVERIFIED; Migration 002 remains NOT AUTHORISED. The source dictionary and target design remain separate artefacts.


## 7. 024-F / 024-G security and quality source completeness

The existing `docs/security/024f-control-and-test-crosswalk.md` preserves all 20 SEC controls and 24 ST security tests. `docs/quality/024g-test-catalogue-crosswalk.md` preserves all 36 QAT product-acceptance scenarios. These IDs remain distinct; overlapping QAT/ST scenarios require explicit cross-reference and evidence, not renumbering.

The supporting operational controls have now been expanded in:
- `docs/security/privacy-and-records-controls.md` — classification, purpose/minimisation, identity/session, mandate and tenant authorization, evidence/file integrity, API/provider controls, offline/device security, marketplace trust, monitoring and backup/recovery.
- `docs/security/threat-model.md` — TH-01–TH-20 initial threat register and risk-treatment fields.
- `docs/operations/incident-response.md` — incident triage, containment, evidence preservation, notification assessment, recovery and reopening template.
- `docs/quality/test-and-evidence-operating-model.md` — traceability chain, L0–L8 test levels, environment/data controls, defect closure and G0–G4 acceptance gates.
- `docs/delivery/release-gates.md` — release decision record and current project holds.

024-F and 024-G remain draft specifications. These repository expansions are requirements and operating templates, not implemented controls, completed DPIA, penetration test, security certification, test execution, release acceptance or production authorization.


## 8. Second-pass source-to-repository reconciliation — 20 November 2026

### Integrated in this pass

| Source group | Repository additions/updates | Disposition |
|---|---|---|
| 010 Hub & Facility Readiness | `docs/operations/010-hub-facility-readiness-crosswalk.md`; facility capability register; source register and map | Assessment framework and HUB-01–HUB-10 traceable; no site appointed/approved |
| 012 Phase 0 Execution | `docs/operations/012-phase-0-execution-crosswalk.md`; Phase 0 work map | WP-0–WP-9 and indicative 20-day plan mapped; not a kickoff commitment or completion record |
| 014 Technical Test Harness | `docs/quality/014-technical-test-harness-crosswalk.md` | T0–T8, synthetic fixture, test protocol and evidence links mapped; not executed |
| 015–018-B migration review/design | `docs/data/015-018b-technical-design-reconciliation.md`; migration provenance and boundary docs | R-01–R-12, technical D-01–D-12, M2-01–M2-24, TD-01–TD-10 and 22-table/230-column source inventory reconciled; migrations remain gated |
| 024-F security/privacy | Existing `docs/security/024f-control-and-test-crosswalk.md`; expanded privacy, threat and incident docs | 20 SEC controls, 24 ST tests and TH-01–TH-20 mapped; no security implementation/certification claimed |
| 024-G quality/acceptance | Existing `docs/quality/024g-test-catalogue-crosswalk.md`; expanded test/evidence model and release gates | 36 QAT cases, L0–L8 verification levels and G0–G4 acceptance gates mapped; no test execution/acceptance claimed |
| AADDG v1.0 / TSBBF v1.0 | `docs/delivery/actify-engineering-operating-standards.md`; ADR-0001/0002; technology status | Engineering lifecycle and selection framework applied; stack/topology deliberately remain OPEN |

### Reconfirmed source-location gaps

| Source | Latest disposition | Next action |
|---|---|---|
| 024-H Architecture, Deployment & Operations | No completed page found in targeted current Project Home/workspace search; intended scope allocated by 024-R | Confirm planned, drafted elsewhere or commission under controlled numbering; do not fabricate source |
| 025 Commercial Service Catalogue / Fees / Billing / Producer Net Proceeds | No dedicated page found; `docs/commerce/service-catalogue-and-fee-model.md` is a requirements holding area | Confirm planned/missing/renumbered and appoint commercial owner; legal/tax and sponsor review before approval |
| 026 wireframes | No approved wireframe pack found; future/conditional in 024-R | Keep 024-E as screen-requirements authority; do not create duplicate design authority |
| Developer Guide v0.1 (17 Nov 2026) | Canonical Notion/Library source not recovered in targeted search | Recover exact source/version before final architecture comparison or TSBBF scoring |

024-R explicitly states that no new 024-I is justified at this point. Its P0 correction record identifies 024 v0.1d and 024-A v0.1b updates, while wider P1/P2 requirements remain allocated to 024-A–024-H. Draft specification text and repository crosswalks do not constitute implementation or acceptance.

### Coverage interpretation

The substantive requirements reviewed in this pass now have explicit repository homes and source links. The remaining gap is not a reason to invent more folders or create duplicate specifications: it is to recover/confirm the missing source records, complete the architecture/commercial decisions, and then continue controlled source-to-repository reconciliation. The Notion searches were targeted, not proof of an exhaustive workspace inventory; no claim of 100% Notion coverage is made.


## 024-F and 024-G security/quality coverage

| Source | Repository home | Coverage / disposition |
|---|---|---|
| 024-F | `docs/security/024f-control-and-test-crosswalk.md`; existing `docs/security/`, `docs/marketplace-trust/`, `docs/integrations/` | 20 threat families; SEC-001–020; ST-01–24; privacy, identity, authority, tenant, evidence, file, API, provider, offline, abuse/appeal/recall, incident and recovery controls. Draft requirements only; no implementation/assessment claimed. |
| 024-G | `docs/quality/024g-test-catalogue-crosswalk.md`; existing `docs/quality/`, `tests/`, `evidence/` | L0–L8; QAT-001–028; G0–G4; traceability, test environment, defect closure and independent assurance. Draft strategy only; no execution/acceptance claimed. |

The quality/security sources are distinct from the database harness 014 and Level 1 rehearsal 021–023/EVI-21. No evidence status is closed by repository documentation.

## 015–018-B technical source coverage correction

The source-to-repository reconciliation is `docs/data/015-018b-technical-design-reconciliation.md`. It corrects 015's preliminary 20-table count to 22 tables / 230 declared columns, based on 016's explicit correction and 018-B's source inventory. 016 D-01–D-12 are technical design IDs and are not 018-A sponsor decisions D-01–D-07. Static review is not PostgreSQL execution. Migration 001 HOLD; Migration 002 NOT AUTHORISED.


## Engineering governance and technology-selection coverage — 20 November 2026

| Source | Repository home | Coverage status | Remaining gate |
|---|---|---|---|
| TSBBF v1.0 | `docs/delivery/actify-engineering-operating-standards.md`; `docs/architecture/technology-decision-status.md`; ADR-0001; engineering crosswalk | Framework, weighted criteria, critical-risk blockers, component-level assessment and exit/TCO evidence represented | Candidate scorecards and authorised decision not evidenced |
| AADDG v1.0 | `docs/delivery/actify-engineering-operating-standards.md`; ADR-0002; security/quality/delivery controls; engineering crosswalk | Lifecycle, source-of-truth, reproducibility, secrets, workers, Level 1 physical-digital/offline/provider/financial/recovery obligations represented as requirements | Runtime controls, environment provisioning, build/test/release evidence not established |
| Technical Development Manual v3.0 | `docs/architecture/technical-development-manual-v3-crosswalk.md`; engineering crosswalk | Modular-monolith-first logical candidate and functional/data/integration/offline/financial requirements mapped | Framework, database provider and deployment topology remain unselected |
| Developer Guide v0.1 (17 Nov 2026) | Technology status; ADR-0001; engineering crosswalk | Provisional competing architecture description recorded | Canonical source not recovered; exact content/version and scorecard evidence remain open |
| ADR-0001 / ADR-0002 | `docs/decisions/ADR-0001-technology-baseline.md`; `docs/decisions/ADR-0002-application-topology.md` | Decision questions, constraints and closure evidence represented | Both OPEN; no stack or topology selected |

Repository folders remain technology-neutral. `web/` versus `src/` is unresolved. No framework/provider selection, production environment, migration execution or deployment is claimed. Migration 001 remains HOLD; Migration 002 NOT AUTHORISED; EVI-21 remains OPEN.


## Technology decision preparation coverage — 20 November 2026

| Work product | Repository home | Coverage status | Remaining gate |
|---|---|---|---|
| Component inventory | `docs/architecture/technology-component-register.md` | 24 component decisions mapped to requirements, seams, candidate classes, risks and priorities | Confirm against recovered Developer Guide/current 024; gather workload/partner evidence |
| TSBBF assessment | `docs/decisions/TSBBF-component-assessment-workbook.md` | Blank weighted scorecard, evidence checklist, TCO model and ADR handoff | No candidate scored; complete with evidence and authorised reviewers |
| Technical spike | `docs/delivery/technology-spike-and-acceptance-plan.md` | Synthetic vertical slice and 18 acceptance conditions defined | Not authorised or executed; needs owner, environment and independent reviewer |
| Technology decision | ADR-0001/0002 and ADR-0003–0008 | Decision dependencies linked | All OPEN; no stack/topology selected |

No candidate is shortlisted or selected. Migration 001 HOLD; Migration 002 NOT AUTHORISED; EVI-21 OPEN. Spike plan authorises no production provisioning, real data, live integration or live trade.


## Product realization integration — 20 November 2026

| Coverage layer | Repository home | Status |
|---|---|---|
| Integrated product lifecycle across 024 / 024-A–G | docs/product/end-to-end-product-realization-map.md | Consolidated traceability map; source requirements remain drafts |
| Six product surfaces and user tasks | docs/product/024e-screen-inventory.md; docs/product/end-to-end-product-realization-map.md | Represented; no production UI implied |
| Authority → preconditions → command → state → data/provenance → event → UI → test → evidence chain | docs/product/end-to-end-product-realization-map.md; detailed 024-A–G crosswalks | Represented as engineering rule; implementation/evidence outstanding |
| Lifecycle-to-domain ownership | docs/product/end-to-end-product-realization-map.md; docs/domain/bounded-context-catalogue.md | Logical ownership mapped; no microservice or schema decision implied |
| Pilot-first engineering increments P0–P5 | docs/product/end-to-end-product-realization-map.md | Proposed sequencing; separate pilot maturity and authorization gates remain in force |

The consolidated map is not a substitute for detailed source crosswalks, test catalogues, sponsor decisions or the evidence register. It does not change Migration 001 HOLD, Migration 002 NOT AUTHORISED, or EVI-21 OPEN.
