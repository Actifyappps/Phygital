# EVI-28 — ADR-0001 technology baseline decision readiness assessment 001

**Review date:** 21 November 2026  
**Evidence item:** EVI-28 — Approve the evidence-backed technology baseline in ADR-0001  
**Status:** IN PROGRESS — source and candidate evidence mapped; scoring/selection not ready  
**ADR status:** OPEN — no technology baseline selected

## 1. Executive finding

The project has a sound technology decision framework and an extensive candidate-evidence preparation set:
- TSBBF v1.0 defines the weighted, component-level selection method.
- A technology-neutral component register and TDR-01–TDR-18 requirements baseline exist.
- WP-03 candidate evidence register and public-source snapshots exist across priority components.
- The TSBBF assessment workbook is intentionally blank.
- No candidate has been scored, shortlisted, selected, procured, provisioned or tested.

EVI-28 is **not ready for candidate scoring or ADR-0001 approval**. Critical prerequisites remain open: EVI-25 source authority, EVI-27 topology decision, workload/TCO, site/connectivity, legal/privacy/provider terms, candidate-specific security/recovery/portability, operating capacity, independent review and explicit decision authority.

**Disposition:** Keep ADR-0001 OPEN. Preserve candidate evidence as unscored. Do not select a technology baseline by preference, provider bundle, repository folder or incomplete document reference.

## 2. Governing decision method

TSBBF v1.0 is ratified and governs component-level reuse/build/buy decisions.

| Criterion | Weight |
|---|---:|
| Functional fit | 20% |
| Data portability and exit | 15% |
| Security and privacy | 15% |
| Reliability and maintenance | 15% |
| Total cost of ownership | 15% |
| Licence and commercial fit | 10% |
| Integration and scalability | 5% |
| Ease of operation | 5% |
| **Total** | **100%** |

Scores are 1–5 and must be supported by evidence. If a critical criterion is UNKNOWN, the candidate is INCOMPLETE — NOT SCORABLE. Critical unresolved legal, security, privacy, recovery or continuity risks block approval regardless of weighted score. A high score is not approval; the authorized decision owner approves ADR-0001.

## 3. Candidate evidence state

The WP-03 candidate register contains alternatives across frontend, runtime, database, identity, authorization, storage, worker/queue, hosting/deployment, CI, observability, backup/recovery, offline sync, QR/public projections, messaging, payment-status, logistics, laboratory and related capabilities.

- Public-source snapshots have been collected for selected P0 components.
- Many entries remain EVIDENCE STARTED — NOT SCORABLE or UNASSESSED.
- No component candidate is READY FOR SCORING.
- No numeric TSBBF score has been entered.
- No candidate is shortlisted or selected.
- Public documentation does not establish contractual suitability, data region, subprocessors, commercial terms, operational limits, backup/restore, exit capability or cost.

A provider bundle must not collapse separate component decisions. Database, identity, storage, hosting, worker and deployment choices require separate evidence and must be assessed for interoperability and combined operating cost.

## 4. EVI-28 closure readiness matrix

| Requirement | Current evidence | Gap / disposition |
|---|---|---|
| Source authority | Concept Paper v1.1, Manual v3.0, TSBBF v1.0 and AADDG v1.0 available; EVI-25 source assessment complete as a search record | EVI-25 remains IN PROGRESS pending complete guide recovery or authorized formal unavailability/supersession disposition; no stack attributed to missing guide |
| Requirements baseline | TDR-01–TDR-18 and 024-A–G source mappings exist | Technology-neutral; final source precedence and candidate-specific coverage sign-off incomplete |
| Topology | WP-04 compares integrated full-stack, modular monolith and microservices; Option B conditional only | EVI-27 IN PROGRESS; ADR-0002 OPEN; no topology selected |
| Candidate readiness | Public-source snapshots and component register exist | Candidate-specific DPA, region, subprocessor, security, commercial, support, quotas, recovery, portability and exit evidence incomplete |
| Workload | Concept Paper and Phase 0 instruments define scope questions | User/organisation counts, concurrency, transaction volumes, files, connectivity, devices, retention and growth remain UNKNOWN |
| TCO | Cost model and assumptions register exist | No comparable low/base/high 12/24/36-month TCO; prices, overages, egress, labour and exit costs not validated |
| Legal/privacy | 024-F and data-classification requirements exist | No approved data map, legal basis, DPA, cross-border transfer, subprocessor or retention approval |
| Security/reliability | 024-F/G requirements and test plans exist | Candidate-specific tests not executed; tenant isolation, session revocation, RLS bypass, private-file access, webhook and worker tests outstanding |
| Recovery/continuity | EVI-29 readiness assessment and design-only backup/restore controls prepared | No backup capability claimed; RTO/RPO and retention periods unset; no witnessed restore test |
| Operations/skills | AADDG and operations templates exist | Named maintainer, support, on-call, patching, incident and backup/restore ownership unconfirmed |
| Synthetic spike | WP-05 plan and readiness brief exist | EVI-26 IN PROGRESS; WP-05 NOT READY — NOT AUTHORIZED; no spike run |
| Independent review | Review requirements defined | No independent candidate scorecard review or ADR recommendation accepted |
| Decision authority | ADR-0001 exists | No authorized technology baseline decision recorded |

## 5. Candidate scoring prohibition

Do not populate numeric scores until:
1. EVI-25 source authority is recovered/reconciled or formally dispositioned with an approved alternative source baseline;
2. ADR-0002 topology is authorized and cross-referenced;
3. candidate-specific evidence is complete for the components being compared;
4. comparable workload and TCO assumptions are supported;
5. legal/privacy, security, region, subprocessor, licence and commercial terms are reviewed;
6. recovery, portability and exit are demonstrated or explicitly evidence-gated with authorized risk disposition;
7. skills, operating ownership and support are confirmed; and
8. independent review is complete.

Do not create a technology recommendation by converting unknowns into scores, assuming free tiers are suitable, or treating a local prototype/test plan as provider acceptance.

## 6. Dependencies and sequence

- EVI-25: source authority and precedence; complete or formally disposition.
- EVI-27 / ADR-0002: logical/deployable topology decision must precede final ADR-0001.
- ECR-02/03/06/07: workload, hub connectivity, operating capacity and TCO.
- ECR-04/05/11: data/privacy, provider terms and security evidence.
- EVI-29 / ECR-08: recovery objectives, retention and restore evidence.
- EVI-26: separately authorized synthetic spike only after prerequisites pass; a spike informs but does not itself approve the baseline.

Preliminary component research may continue in parallel where it does not assume an unapproved topology or missing source content.

## 7. Explicit boundaries

This assessment does not select a framework, provider, database, identity service, object store, queue, worker or hosting platform. It does not authorize procurement, provider accounts, production infrastructure, migrations, real participant data, live integrations, payment, escrow, custody, shipment or production deployment.

**Current disposition:** EVI-28 IN PROGRESS as a readiness assessment; ADR-0001 OPEN; no candidate scored or shortlisted; no technology baseline selected.

[Notion assessment](https://app.notion.com/p/41f6808bcd9e8130afbbc4a68db571dc).
