# Controlled Notion Change Package — Evidence Register Additions

**Package ID:** PEM-ER-CP-001  
**Version:** 0.1  
**Prepared:** 21 November 2026  
**Status:** PROPOSED — NOT APPLIED  
**Decision:** PENDING; no approval inferred.

## 1. Purpose and change boundary

This package proposes five genuinely distinct evidence requirements for the existing Phygital Phase 0 — Evidence Register. It follows the read-only crosswalk in `wp03-ecr-to-phase0-register-crosswalk.md` and the Evidence Register — Operating Protocol.

The existing 24 records remain unchanged. No new database rows, Evidence IDs, CV Finding codes, assignments, statuses or schema properties have been created. If approved, use the existing database only; allow its auto-generated Evidence ID mechanism to assign IDs and allocate CV Finding keys only after a uniqueness check.

## 2. Proposed additions at a glance

| Ref | Proposed Evidence Item | ECR | Priority | Workstream | Initial status |
|---|---|---|---|---|---|
| A | Recover and establish authority of canonical Developer Guide v0.1 source | ECR-01 | P1 proposed | WS-08 Technology & Database; document custodian support | OPEN |
| B | Obtain explicit authorization for a bounded synthetic technology-candidate spike | ECR-12 | P1 proposed | WS-08 Technology & Database; governance decision owner | OPEN or BLOCKED only if justified and supported by database option |
| C | Assess topology alternatives and record the authorized ADR-0002 decision | ECR-13 | P1 proposed | WS-08 Technology & Database | OPEN |
| D | Complete evidence-backed technology candidate assessment and record the authorized ADR-0001 baseline decision | ECR-14 | P1 proposed | WS-08 Technology & Database | OPEN |
| E | Approve service recovery objectives and evidence/data retention controls; execute and independently witness a restore test | ECR-08 | P1 proposed | WS-08 Technology & Database; Operations / Legal / Data Protection | OPEN |

P1 is a proposal, not an approved classification. The authorized programme owner should confirm or amend priorities before insertion.

## 3. Full proposed record specifications

### A. Developer Guide source authority and disposition

**Evidence Required:** Complete original Notion page or file; exact title/version/date; source owner/custodian; status and authority; complete content and attachments; source URL or controlled file reference. If unavailable, formal disposition recording search scope, custodian confirmation, unavailable/superseded status and treatment of decisions unique to the guide.

**Closure Test:** Recover the complete canonical source and record version, date, owner, authority and status; OR obtain an accountable document owner's reasoned unavailability/supersession disposition identifying affected decisions and authoritative replacement sources. Reconcile unique requirements into the governing baseline without silent omission.

**Owner Role:** Project document custodian / Developer Guide owner, supported by Technical Lead.  
**Reviewer Role:** Phase 0 Lead or independent document-governance reviewer; technical review for material architecture decisions.  
**Dependency:** ECR-01 source recovery and identification of document custodian.  
**Decision Impact:** Source authority; technology requirements and ADR evidence integrity.  
**Insufficient evidence:** Search result, partial excerpt, recollection, unverified copy or unsupported assertion of supersession.

### B. WP-05 synthetic technology-spike authorization

**Evidence Required:** Approved comparison question and candidate scope; rationale; isolated environment; budget/consumption ceiling; synthetic-only fixture specification; threat/privacy/security test plan; acceptance criteria; exact versions and commands; evidence-retention method; accountable owner and independent reviewer roles; cleanup/rollback plan; stop conditions; signed authorization by authorized decision owner.

**Closure Test:** Signed, dated authorization identifies candidate(s), scope, environment, budget ceiling, synthetic data, test plan, acceptance criteria, owner, independent reviewer, evidence location, cleanup/rollback and stop conditions. Authorization is limited to that spike and does not approve production selection, procurement, real data, deployment or live operations.

**Owner Role:** Technical Lead / WP-05 lead.  
**Reviewer Role:** Independent technical reviewer plus security/privacy reviewer; authorization by authorized technology decision owner or sponsor.  
**Dependency:** ECR-02, ECR-04, ECR-05, ECR-06, ECR-07, ECR-08 and ECR-11 prerequisites, plus source-authority resolution where applicable.  
**Decision Impact:** WP-05 execution gate; candidate evidence and technology scoring.  
**Insufficient evidence:** Spike plan, candidate list, fixture, prototype, test script or verbal approval. This record tracks authorization; execution results are separately evidenced. No spike is currently authorized.

### C. ADR-0002 topology assessment and decision

**Evidence Required:** WP-04 topology assessment; validated workload and operating constraints; architecture alternatives; data-flow and trust boundaries; deployment/runtime and region implications; availability, offline/synchronization and recovery implications; security/privacy assessment; support/skills requirements; TCO and exit/portability analysis; risks and mitigations; independent review; signed decision with conditions, owner, review triggers and date.

**Closure Test:** Authorized technology decision owner records accepted/rejected alternatives, evidence references, rationale, conditions, accountable owners, deployment/data boundaries, recovery/exit provisions, residual risks, reassessment triggers and review date. Topology is explicitly approved, rejected or deferred. Proposed modular-monolith direction is not approved until recorded.

**Owner Role:** Technical Lead / architecture workstream lead.  
**Reviewer Role:** Independent architecture reviewer, security/privacy reviewer and operations reviewer.  
**Dependency:** ECR-02 through ECR-08 as applicable; WP-04 assessment; ECR-11 security/test planning.  
**Decision Impact:** WP-04 closure; ADR-0002; architecture and deployment boundaries.  
**Insufficient evidence:** Preferred architecture in a manual, diagram, score without validated inputs or unsigned ADR draft.

### D. ADR-0001 technology baseline assessment and decision

**Evidence Required:** Candidate eligibility and evidence packs; completed TSBBF scorecards using ratified criteria and weights; comparable TCO scenarios; exact provider plans/terms and data-processing evidence; workload and operating assumptions; security/privacy and recovery results; portability/exit analysis; integration and maintenance assessment; independent review; critical blockers and rejected alternatives; signed decision stating selected baseline, conditions, owners, reassessment triggers and exit plan.

**Closure Test:** Every scored criterion is supported by current, applicable evidence; blockers and unknowns are explicit; independent review is recorded; authorized technology decision owner signs selected baseline or reasoned no-selection/defer decision. Conditions, owners, reassessment triggers, review date and exit/portability plan are included. A scorecard template alone does not establish readiness.

**Owner Role:** Technical Lead / technology assessment lead.  
**Reviewer Role:** Independent technical reviewer, Finance/Commercial reviewer and Security/Privacy reviewer.  
**Dependency:** ECR-01 through ECR-11 as applicable; ECR-13 topology decision where sequencing requires it; TSBBF evidence requirements and authorized scoring process.  
**Decision Impact:** ADR-0001; WP-06 handoff; technology baseline and procurement decisions.  
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

These proposals do not replace or duplicate E-022 (controlled evidence repository and decision log), E-021 (Level 1 simulated transaction rehearsal), E-024 (formal Phase 0 checkpoint), CV-05 (site readiness), CV-10 (audit integrity), CV-12 (Migration 001 and PostgreSQL tests), CV-13 (cost/revenue model), CV-14 (provider qualification), CV-17 (privacy/security obligations), CV-18 (dependency-based programme plan) or CV-20 (phase-gated capabilities).

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
| Dependency | Explicit ECR and Evidence ID links |
| Status | OPEN initially; BLOCKED only if allowed and a real blocker is recorded |
| Closure Accepted | NO |
| Evidence Reference | Blank until controlled evidence exists |
| Evidence Class | Blank until evidence is received and acquisition type is known |
| Evidence Date / Last Reviewed | Blank until actual dates exist |
| CV Finding | Unassigned until approval and uniqueness check |

Respect actual database property types/options at insertion. Do not invent select values, pre-populate dates, or conflate evidence strength E1–E4 with Notion Evidence Class acquisition type.

## 6. Application and verification sequence

1. Record sponsor/authorized decision-owner approval, including amendments.
2. Re-fetch live schema and rows immediately before insertion; verify none of the five has since been created.
3. Create the five rows in the existing Evidence Register data source only.
4. Allow auto-generated Evidence IDs; allocate CV Finding keys after uniqueness checks.
5. Read back all five rows and verify properties, dependencies and closure tests.
6. Update the ECR crosswalk with actual IDs/keys; preserve existing identities and history.
7. Do not change existing statuses or closure acceptance because these proposals were created.

## 7. Explicit non-authorizations

Approval of these register additions authorizes only creation of evidence-requirement records. It does not authorize WP-05 spike execution; procurement, accounts or paid commitments; production architecture or technology baseline selection; production deployment, real participant data or live integrations; live trading, inventory custody/reservation, platform-held funds/escrow or shipment; or external contact/collection beyond separately approved Phase 0 instruments.

ECR-12 remains NOT AUTHORIZED until separate explicit spike authorization. ADR-0001 and ADR-0002 remain OPEN until evidence and authorized decisions are complete.

## 8. Approval record

**Decision:** PENDING — no approval inferred.  
**Authorized decision-maker:** To be confirmed under programme governance.  
**Decision date / approved version:** To be recorded when decided.  
**Conditions / amendments:** To be recorded.  
**Decision evidence reference:** To be linked after approval.

**Sources:** WP-03 ECR-to-Phase 0 Register Crosswalk; WP-03 Evidence Closure Request Register; Phase 0 Evidence Register; Evidence Register — Operating Protocol; Phase 0 evidence-return template.

**Change-control rule:** This package is a proposal. No database row, schema, status, assignment or decision has been changed by its preparation.
