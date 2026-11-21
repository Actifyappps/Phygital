# Controlled Notion Change Package — Evidence Register Additions

**Package ID:** PEM-ER-CP-001  
**Version:** 0.4  
**Prepared:** 21 November 2026  
**Status:** APPROVED AND APPLIED — 21 November 2026  
**Decision:** Sponsor approved and commissioned all five additions, including implementation where necessary.

## 1. Purpose and change boundary

This package records the approved application of five distinct evidence requirements to the existing Phygital Phase 0 — Evidence Register. It follows the ECR-to-register crosswalk and the Evidence Register — Operating Protocol.

The original 24 records remain unchanged. Five new rows were created in the existing database, which now contains 29 active records. Evidence IDs EVI-25 through EVI-29 were generated automatically. No schema properties, assignments or existing-row statuses were changed. CV Finding remains blank on every new row; any extension of the existing CV-01–CV-20 / EVI-21–EVI-24 convention still requires a separate explicit governance decision. ECR references and the actual Evidence IDs are retained for traceability.

## 2. Proposed additions at a glance

| Ref | Proposed Evidence Item | ECR | Priority | Workstream | Decision Impact | Initial status |
|---|---|---|---|---|---|---|
| A | Establish authority of canonical Developer Guide v0.1 source | ECR-01 → EVI-25 | P1 approved | WS-08 Technology & Database | Phase 0 learning | OPEN |
| B | Authorize a bounded synthetic technology-candidate spike | ECR-12 → EVI-26 | P1 approved | WS-08 Technology & Database | Phase 0 learning | OPEN; execution not authorized |
| C | Record the authorised topology decision in ADR-0002 | ECR-13 → EVI-27 | P1 approved | WS-08 Technology & Database | Production/data gate | OPEN |
| D | Approve the evidence-backed technology baseline in ADR-0001 | ECR-14 → EVI-28 | P1 approved | WS-08 Technology & Database | Production/data gate | OPEN |
| E | Approve recovery objectives and retention controls; execute a witnessed restore test | ECR-08 → EVI-29 | P1 approved | WS-08 Technology & Database | Production/data gate | OPEN |

All five P1 classifications were approved as specified. P1 denotes a requirement that must close before real participant data, production deployment or live inventory/payment events, as applicable. EVI-26 is a prerequisite to the separately bounded WP-05 spike only; creating or closing the register requirement does not itself authorize execution. These are distinct gates, not five live-pilot gates.

## 3. Full proposed record specifications

### A. Developer Guide source authority and disposition

**Evidence Required:** Complete original Notion page or file; exact title/version/date; source owner/custodian; status and authority; complete content and attachments; source URL or controlled file reference. If unavailable, formal disposition recording search scope, custodian confirmation, unavailable/superseded status and treatment of decisions unique to the guide.

**Closure Test:** Recover the complete canonical source and record version, date, owner, authority and status; OR obtain an accountable document owner's reasoned unavailability/supersession disposition identifying affected decisions and authoritative replacement sources. Reconcile unique requirements into the governing baseline without silent omission.

**Owner Role:** Project document custodian / Developer Guide owner, supported by Technical Lead.  
**Reviewer Role:** Phase 0 Lead or independent document-governance reviewer; technical review for material architecture decisions.  
**Dependency:** ECR-01 source recovery and identification of document custodian.  
**Decision Impact:** Phase 0 learning; technology requirements and ADR evidence integrity.  
**Insufficient evidence:** Search result, partial excerpt, recollection, unverified copy or unsupported assertion of supersession.

### B. WP-05 synthetic technology-spike authorization

**Evidence Required:** Approved comparison question and candidate scope; rationale; isolated environment; budget/consumption ceiling; synthetic-only fixture specification; threat/privacy/security test plan; acceptance criteria; exact versions and commands; evidence-retention method; accountable owner and independent reviewer roles; cleanup/rollback plan; stop conditions; signed authorization by authorized decision owner.

**Closure Test:** Signed, dated authorization identifies candidate(s), scope, environment, budget ceiling, synthetic data, test plan, acceptance criteria, owner, independent reviewer, evidence location, cleanup/rollback and stop conditions. Authorization is limited to that spike and does not approve production selection, procurement, real data, deployment or live operations.

**Owner Role:** Technical Lead / WP-05 lead.  
**Reviewer Role:** Independent technical reviewer plus security/privacy reviewer; authorization by authorized technology decision owner or sponsor.  
**Dependency:** ECR-02, ECR-04, ECR-05, ECR-06, ECR-07, ECR-08 and ECR-11 prerequisites, plus source-authority resolution where applicable.  
**Decision Impact:** Phase 0 learning; WP-05 execution gate and candidate evidence. This is an authorization prerequisite for the spike, not the spike result and not a production approval.  
**Insufficient evidence:** Spike plan, candidate list, fixture, prototype, test script or verbal approval. This record tracks authorization; execution results are separately evidenced. No spike is currently authorized.

### C. ADR-0002 topology assessment and decision

**Evidence Required:** WP-04 topology assessment; validated workload and operating constraints; architecture alternatives; data-flow and trust boundaries; deployment/runtime and region implications; availability, offline/synchronization and recovery implications; security/privacy assessment; support/skills requirements; TCO and exit/portability analysis; risks and mitigations; independent review; signed decision with conditions, owner, review triggers and date.

**Closure Test:** Authorized technology decision owner records accepted/rejected alternatives, evidence references, rationale, conditions, accountable owners, deployment/data boundaries, recovery/exit provisions, residual risks, reassessment triggers and review date. Topology is explicitly approved, rejected or deferred. Proposed modular-monolith direction is not approved until recorded.

**Owner Role:** Technical Lead / architecture workstream lead.  
**Reviewer Role:** Independent architecture reviewer, security/privacy reviewer and operations reviewer.  
**Dependency:** ECR-02 through ECR-08 as applicable; WP-04 assessment; ECR-11 security/test planning. The topology decision must be recorded before ADR-0001 is finalized; candidate evidence work may proceed in parallel where it does not presuppose an unapproved topology.  
**Decision Impact:** Production/data gate; WP-04 closure; ADR-0002; architecture and deployment boundaries.  
**Insufficient evidence:** Preferred architecture in a manual, diagram, score without validated inputs or unsigned ADR draft.

### D. ADR-0001 technology baseline assessment and decision

**Evidence Required:** Candidate eligibility and evidence packs; completed TSBBF scorecards using ratified criteria and weights; comparable TCO scenarios; exact provider plans/terms and data-processing evidence; workload and operating assumptions; security/privacy and recovery results; portability/exit analysis; integration and maintenance assessment; independent review; critical blockers and rejected alternatives; signed decision stating selected baseline, conditions, owners, reassessment triggers and exit plan.

**Closure Test:** Every scored criterion is supported by current, applicable evidence; blockers and unknowns are explicit; independent review is recorded; authorized technology decision owner signs selected baseline or reasoned no-selection/defer decision. Conditions, owners, reassessment triggers, review date and exit/portability plan are included. A scorecard template alone does not establish readiness.

**Owner Role:** Technical Lead / technology assessment lead.  
**Reviewer Role:** Independent technical reviewer, Finance/Commercial reviewer and Security/Privacy reviewer.  
**Dependency:** ECR-01 through ECR-11 as applicable; ADR-0002 topology decision before final baseline selection; TSBBF evidence requirements and authorized scoring process. Candidate evidence collection and preliminary comparison may proceed in parallel, but final selection must be consistent with the approved topology.  
**Decision Impact:** Production/data gate; ADR-0001; WP-06 handoff; technology baseline and procurement decisions.  
**Insufficient evidence:** Candidate list, vendor marketing page, unverified pricing, incomplete scorecard, informal preference or unapproved stack proposal.

### E. Recovery objectives, retention and witnessed restore

**Evidence Required:** Business-impact and service-criticality assessment; approved RPO/RTO by service/data class; backup frequency and independent-copy design; backup encryption and access controls; restore dependencies and credentials; retention schedule for transaction, audit, evidence, file, telemetry and backup data; legal hold, deletion and disposal rules; recovery runbook; restore test environment and exact versions; execution logs, measured recovery/data-loss results, defects/retests and independent witness record.

**Closure Test:** Authorized service/product and operations owners approve measurable RPO/RTO and retention requirements by data class, with Legal/Data Protection review of retention and deletion constraints. Isolated supported-environment restore test demonstrates the process; measured RPO/RTO, source versions, logs, data-integrity checks, failures and retests are recorded. Independent reviewer/witness accepts evidence or records limitations and remediation.

**Owner Role:** Technical Lead / service owner with Operations Lead.  
**Reviewer Role:** Independent technical/operations reviewer; Legal/Data Protection reviewer for retention and deletion.  
**Dependency:** ECR-04 data inventory/privacy; ECR-06 operational capacity; ECR-05 provider terms; ECR-07 TCO; approved environment and backup design.  
**Decision Impact:** Production/data gate; hosting, database, storage and service-continuity readiness.  
**Insufficient evidence:** Backup configuration, provider marketing claim, unexecuted runbook, successful backup job without restore, or unwitnessed restore without integrity evidence.

## 4. Existing-record boundary

These proposals do not replace or duplicate EVI-22 (controlled evidence repository and decision log), EVI-21 (Level 1 simulated transaction rehearsal), EVI-24 (formal Phase 0 checkpoint), CV-05 (site readiness), CV-10 (audit integrity), CV-12 (Migration 001 and PostgreSQL tests), CV-13 (cost/revenue model), CV-14 (provider qualification), CV-17 (privacy/security obligations), CV-18 (dependency-based programme plan) or CV-20 (phase-gated capabilities).

Cross-reference those records; do not repurpose them as proxies for the new closure tests. Capture each evidence item once and link it to all relevant ECRs and Evidence IDs.

## 5. Existing database property mapping

Use only existing properties unless a separate schema change is approved.

| Property | Proposed use |
|---|---|
| Evidence Item | Exact proposed title above |
| Evidence Required | Required artefact/claim set |
| Closure Test | Objective pass condition |
| Proposed Owner Role | Role label only; no unconfirmed person |
| Reviewer Role | Reviewer role; no invented appointment |
| Priority | P1 proposed, pending confirmation |
| Workstream | WS-08 Technology & Database; cross-functional roles in owner/reviewer |
| Decision Impact | As specified per record |
| Dependency | Explicit ECR references and, after insertion, relevant existing Evidence ID references; no new identifier convention |
| Target Window | Blank until an authorized schedule/dependency plan supplies a defensible window |
| Notes / Finding | Factual initial note only; state proposed scope and unresolved dependencies without inventing a finding or blocker |
| Status | OPEN initially; BLOCKED only if the exact live database option exists and a specific blocker is recorded |
| Closure Accepted | NO |
| Evidence Reference | Blank until controlled evidence exists |
| Evidence Class | Blank until evidence is received and acquisition type is known |
| Evidence Date / Last Reviewed | Blank until actual dates exist |
| CV Finding | Blank initially; any new key requires explicit approval of an identifier-convention extension. Uniqueness checking alone is insufficient |

Respect actual database property types/options at insertion. Leave unspecified properties blank unless the mapping expressly provides a factual initial value. Do not invent select values, populate dates in advance, add unsupported notes, or conflate evidence strength E1–E4 with Notion Evidence Class acquisition type.

## 6. Application and verification record

1. Sponsor approval received in the project conversation on 21 November 2026; all five additions and implementation where necessary were commissioned.
2. The live schema and all active rows were re-fetched immediately before insertion; no duplicate requirements were found.
3. Five rows were created in the existing Evidence Register data source. No schema changes or changes to the original 24 rows were made.
4. The database assigned IDs automatically: EVI-25, EVI-26, EVI-27, EVI-28 and EVI-29. No manual IDs were supplied. CV Finding was left blank on every new record.
5. All five records were queried back and verified: titles, IDs, P1 priority, Decision Impact, WS-08 workstream, OPEN status, Closure Accepted = NO, dependencies, evidence requirements, closure tests and intentionally blank fields.
6. The ECR-to-register crosswalk is updated with the actual Evidence IDs in this applied package revision.
7. No existing row status or closure acceptance was changed.

## 7. Explicit non-authorizations

Approval of these register additions authorizes only creation of evidence-requirement records. It does not authorize WP-05 spike execution; procurement, accounts or paid commitments; production architecture or technology baseline selection; production deployment, real participant data or live integrations; live trading, inventory custody/reservation, platform-held funds/escrow or shipment; or external contact/collection beyond separately approved Phase 0 instruments.

ECR-12 remains NOT AUTHORIZED until separate explicit spike authorization. ADR-0001 and ADR-0002 remain OPEN until evidence and authorized decisions are complete.

## 8. Approval record

**Decision:** APPROVED — apply all five additions and commission implementation where necessary.  
**Approval source:** Explicit sponsor instruction in the project conversation, 21 November 2026.  
**Approved proposal:** Version 0.2, with its control refinements preserved.  
**Applied record:** Version 0.3, 21 November 2026; progress update v0.4, 21 November 2026.  
**Conditions:** CV Finding remains blank; no person appointments; WP-05, production, procurement, live data and live operations remain subject to their separate gates.

**Sources:** WP-03 ECR-to-Phase 0 Register Crosswalk; WP-03 Evidence Closure Request Register; Phase 0 Evidence Register; Evidence Register — Operating Protocol; Phase 0 evidence-return template.

**Change-control rule:** This v0.3 package records the approved five-row addition and its read-back verification. It does not close any evidence requirement or authorize a separately gated activity.


## 9. Applied record index

| ECR linkage | Evidence ID | Register record | Notion record |
|---|---|---|---|
| ECR-01 | EVI-25 | Establish authority of canonical Developer Guide v0.1 source | [Open EVI-25](https://app.notion.com/p/41f6808bcd9e81879620e81d03462247) |
| ECR-12 | EVI-26 | Authorize a bounded synthetic technology-candidate spike | [Open EVI-26](https://app.notion.com/p/41f6808bcd9e81d79ee9f98ce627dba8) |
| ECR-13 | EVI-27 | Record the authorised topology decision in ADR-0002 | [Open EVI-27](https://app.notion.com/p/41f6808bcd9e811cae67e55b07c85ab9) |
| ECR-14 | EVI-28 | Approve the evidence-backed technology baseline in ADR-0001 | [Open EVI-28](https://app.notion.com/p/41f6808bcd9e817185d3c1efaada6a46) |
| ECR-08 | EVI-29 | Approve recovery objectives and retention controls; execute a witnessed restore test | [Open EVI-29](https://app.notion.com/p/41f6808bcd9e811babefff6a00a8ccc9) |

## 10. Implementation progress — EVI-25

A targeted source-recovery assessment was completed across Notion, the connected Library and the current Phygital repository on 21 November 2026. The complete Developer Guide v0.1 was not located. The current Concept Paper v1.1 and Technical Development Manual v3.0 hierarchy remains controlling. EVI-25 is IN PROGRESS and linked to the assessment record. The source remains UNVERIFIED / NOT LOCATED pending custodian confirmation or formal disposition. Prior project context records the draft title/version/date, but the complete original content is not recovered and no stack is attributed. This does not close EVI-25 or authorize technology scoring from partial references.

[Notion source-recovery assessment](https://app.notion.com/p/41f6808bcd9e8130846cf2d7c22b16c0).
