# Phase 0 work-package to repository crosswalk

**Source:** Deliverable 012 — Phase 0 Execution & Evidence Acquisition Plan v1.0.  
**Related sources:** Deliverables 010, 014 and 015; Concept Paper v1.1; Technical Development Manual v3.0; Phase 0 Evidence Register and Operating Protocol.  
**Status:** Repository navigation and traceability aid. It is not an approved appointment, execution record, Phase 0 closure or live-pilot authorisation.

## Operating rule

Deliverable 012 sequences discovery and evidence acquisition into ten work packages (WP-0–WP-9). The Notion Evidence Register remains the operational master for evidence status and closure. This crosswalk does not create a second status register. Every repository artefact below is a preparation/control home; actual evidence must be linked to its relevant CV/E item and reviewed under the Notion protocol.

The indicative 20-working-day schedule begins only after authorised kickoff. It is not a delivery promise. Incomplete evidence extends the work; dates must never be compressed by reclassifying assumptions as facts.

## Work-package mapping

| Work package | Scope | Repository homes | Closure evidence / boundary |
|---|---|---|---|
| WP-0 Mobilisation, governance and evidence control | Sponsor/decision authority, scope, roles, access, evidence repository, confidentiality and outreach approval | `docs/governance/`, `docs/operations/`, `evidence/`, `docs/delivery/` | Authorised scope and decision log; actual role-holders separately appointed; controlled evidence access. No informal statement grants authority. |
| WP-1 Commodity and destination screening | Commodity shortlist, supply/route fit, competent authorities, product-specific export and destination requirements | `docs/compliance/`, `docs/operations/`, `docs/measurement/` | Evidence-backed commodity/route assessment or HOLD/NO-GO; public import data alone is not buyer validation or regulatory clearance. |
| WP-2 Buyer discovery and specification validation | Qualified buyer evidence, written product specification, quality/packaging/volume/delivery/payment terms and accepted evidence | `docs/product/`, `packages/domain/buyer-requirements/`, `packages/domain/quotations-orders/`, `evidence/partner-validation/` | Interview and specification evidence; distinguish prospect, interviewed buyer, qualified buyer and buyer with written specification. No assumed demand. |
| WP-3 Producer and supply validation | Identity, representative authority, producer/member consent, current/seasonal supply, competing commitments, ownership and traceability | `packages/domain/identity/`, `organisations/`, `supply/`, `inventory/`, `evidence/partner-validation/` | Verified organisational/representative authority and supply evidence. Estimates are not available inventory; declarations are not verified stock. |
| WP-4 Hub and operational readiness | Site permission, digital and physical suitability, staffing, equipment, calibration, service workflow, custody boundaries, risk and cost | `docs/operations/facility-capability-register.md`, `field-and-hub-operating-model.md`, `partner-and-provider-readiness.md`, `packages/domain/hub-services/`, `tests/hub-services/` | Completed site assessment, written permission and exact service scope. No candidate hub is selected; digital-only is baseline. No custody by implication. |
| WP-5 Legal/commercial role, funds-flow and provider qualification | Seller/exporter/operator roles, title/custody/risk, payment, tax/fees, claims, unit economics and provider diligence | `docs/commerce/`, `docs/domain/`, `docs/operations/partner-and-provider-readiness.md`, `packages/domain/commercial/`, `integrations/` | Qualified legal/tax/provider review and documented commercial assumptions. Direct buyer-to-seller flow; no platform-held funds or escrow under current controls. |
| WP-6 Technical validation and database remediation | Schema and workflow integrity, inventory ledger, allocation, units, tenant isolation, audit, idempotency and provenance | `docs/data/inventory-integrity-control-matrix.md`, `docs/data/migration-001-source-provenance.md`, `docs/data/migration-002-design-boundary.md`, `supabase/candidates/migration-001-hold/`, `tests/`, `evidence/test-runs/` | Isolated PostgreSQL execution with synthetic data, retained commands/output/checksums, resolved critical defects and independent review. Migration 001 remains HOLD; Migration 002 is not authorised. |
| WP-7 End-to-end simulated transaction and dossier | Synthetic producer-to-buyer workflow, exception scenarios, document dossier and event provenance | `tests/fixtures/`, `fixtures/scenarios/`, `tests/quotations-orders/`, `tests/fulfilment/`, `evidence/level-1/` | Reproducible synthetic run and mock dossier clearly marked TEST / NOT FOR SHIPMENT. No real trade or shipment. |
| WP-8 Metrics, boundaries and stop-loss | Buyer/producer readiness, traceability, conversion, cost, margin, claims, satisfaction and stop conditions | `docs/measurement/`, `docs/product/maturity-axes-and-gates.md`, `docs/operations/pilot-readiness.md` | Defensible baselines or explicitly provisional thresholds; documented stop-loss conditions. Advanced devices, blockchain, escrow, automated payouts and AI remain phase-gated. |
| WP-9 Formal Phase 0 checkpoint | Evidence snapshot, CV/E reconciliation, risk/dissent review and GO/HOLD/NO-GO recommendation | `docs/governance/project-status.md`, `docs/governance/requirements-traceability.md`, `evidence/reviews/`, Notion Evidence Register | Dated evidence snapshot and authorised decision with conditions. A Phase 0 GO permits preparation for separate pilot approval; it is not live-pilot permission. |

## Facility-readiness detail from Deliverable 010

The 010 scorecard weights authority/permission, digital infrastructure, premises/safety, staffing, commodity suitability, operating sustainability, data protection/cybersecurity and producer accessibility. Scores are 0–5, weighted to 100. Bands are 80–100 (eligible for conditional approval only if all hard gates pass), 65–79 (conditional/remediation), and below 65 (do not select). Any hard-gate failure overrides the score. The current candidate placeholders SITE-001, SITE-002 and SITE-003 remain HOLD; see `docs/operations/facility-capability-register.md`.

A digital hub listing or TTI mandate does not prove permission for commercial marketplace activity, storage, grading, packing, laboratory work or export operations. Assess the exact site, activity, commodity and date. A digital-only site can still link evidence generated by a competent off-site provider.

## Technical test and migration control from Deliverables 014–015

Deliverable 014 is an execution-ready test specification, not a test report. It requires an isolated environment, synthetic fixtures, unique run IDs, explicit PASS / FAIL / BLOCKED / NOT RUN outcomes, raw retained evidence and independent review. A planned case is never a PASS.

Deliverable 015 is a static review of Migration 001 and its companion artefacts. It explicitly records PostgreSQL execution as not performed and Migration 001 as HOLD. Its R-01–R-12 findings are represented in `docs/data/migration-002-design-boundary.md`; the critical themes include allocatable batch states, cross-record lineage, authoritative inventory ledger, tenant isolation, protected audit history, quote/order lineage, concurrency, controlled units, shipment idempotency, payment signature verification, hub authority and event provenance.

Do not edit Migration 001 in place, promote candidate SQL to the active migration path, or create Migration 002 without the required design decisions and separate authorisation. Application-layer concerns such as provider signature verification and user authorisation cannot be solved by adding database columns alone.

## Evidence and authority distinctions

- Declared, hub-recorded, device-measured and independently verified evidence remain distinct.
- Evidence quality/provenance is not inferred from a UI badge or status label.
- A candidate, assessment, readiness score or provider profile is not an appointment, contract or legal authority.
- A reservation is not physical movement; a shipment milestone is not dispatch proof absent competent evidence.
- A Phase 0 conclusion may validly be HOLD or NO-GO. Negative findings are evidence, not failure to complete the work.
- ChatGPT can prepare analysis, templates, crosswalks and test artefacts; buyer/producer interviews, site access, regulatory/legal confirmation, provider commitments, live database execution and independent acceptance require the appropriate external people and environments.

## Source links

- [010 Hub & Facility Readiness Assessment](https://app.notion.com/p/88c6808bcd9e82f7a96401215970f467)
- [012 Phase 0 Execution & Evidence Acquisition Plan](https://app.notion.com/p/4136808bcd9e81e8ae9cee40b3df1d96)
- [014 Technical Test Harness & End-to-End Simulation](https://app.notion.com/p/4136808bcd9e81e0bb13f2ea26004dd1)
- [015 Technical Readiness & Migration 001 Remediation](https://app.notion.com/p/4136808bcd9e81cd98aae29ae9fc79b1)


## Deliverable 013 — validation instrument mapping

The 013 pack provides evidence-gathering instruments for WP-1 through WP-5. It does not claim that interviews, site visits or third-party confirmations have occurred.

| Instrument | Evidence focus | Repository destination | Key discipline |
|---|---|---|---|
| A — Buyer discovery and qualification | Identity/authority, purchasing activity, written specification, volumes/frequency, quality/traceability expectations, buying process and payment terms | `docs/product/`, `packages/domain/buyer-requirements/`, `evidence/partner-validation/` | A lead or expression of interest is not a qualified buyer; a high score cannot replace a written usable specification. |
| B — Producer/cooperative supply validation | Legal identity and representative authority, active producer base, seasonal/current supply, commitments, quality, governance/consent and supply calculation | `packages/domain/organisations/`, `supply/`, `inventory/`, `evidence/partner-validation/` | Do not convert estimated production into available inventory; subtract existing commitments, producer retention, quality losses and competing channels. |
| C — Hub/facility readiness | Ownership/access, permissions, digital infrastructure, safety, physical suitability, staff, equipment, custody, cost and liability | `docs/operations/facility-capability-register.md`, `packages/domain/hub-services/`, `evidence/partner-validation/` | Any unresolved legal access, safety, security, custody or mandatory-permission issue is HOLD regardless of score. |
| D — Service provider qualification | Identity, licences/accreditation, exact service scope, staff/equipment, capacity, pricing, insurance, security and contract readiness | `docs/operations/partner-and-provider-readiness.md`, `integrations/`, `evidence/partner-validation/` | Marketing statements and directory listings are not proof of current licence, capacity, availability or suitability. |

Each instrument record must retain evidence references, source/date, reviewer and limitations, and link to the relevant Notion Evidence Register item. Negative findings and non-participation are retained, not omitted. The Notion Evidence Register remains the operational master for status and closure.


## Deliverable 013 — validation instrument mapping

The 013 pack provides evidence-gathering instruments for WP-1 through WP-5. It does not claim that interviews, site visits or third-party confirmations have occurred.

| Instrument | Evidence focus | Repository destination | Key discipline |
|---|---|---|---|
| A — Buyer discovery and qualification | Identity/authority, purchasing activity, written specification, volumes/frequency, quality/traceability expectations, buying process and payment terms | `docs/product/`, `packages/domain/buyer-requirements/`, `evidence/partner-validation/` | A lead or expression of interest is not a qualified buyer; a high score cannot replace a written usable specification. |
| B — Producer/cooperative supply validation | Legal identity and representative authority, active producer base, seasonal/current supply, commitments, quality, governance/consent and supply calculation | `packages/domain/organisations/`, `supply/`, `inventory/`, `evidence/partner-validation/` | Do not convert estimated production into available inventory; subtract existing commitments, producer retention, quality losses and competing channels. |
| C — Hub/facility readiness | Ownership/access, permissions, digital infrastructure, safety, physical suitability, staff, equipment, custody, cost and liability | `docs/operations/facility-capability-register.md`, `packages/domain/hub-services/`, `evidence/partner-validation/` | Any unresolved legal access, safety, security, custody or mandatory-permission issue is HOLD regardless of score. |
| D — Service provider qualification | Identity, licences/accreditation, exact service scope, staff/equipment, capacity, pricing, insurance, security and contract readiness | `docs/operations/partner-and-provider-readiness.md`, `integrations/`, `evidence/partner-validation/` | Marketing statements and directory listings are not proof of current licence, capacity, availability or suitability. |

Each instrument record must retain evidence references, source/date, reviewer and limitations, and link to the relevant Notion Evidence Register item. Negative findings and non-participation are retained, not omitted. The Notion Evidence Register remains the operational master for status and closure.
