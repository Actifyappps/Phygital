# Technology decision requirements baseline

**Review date:** 20 November 2026  
**Status:** Source-derived comparison baseline for ADR-0001/0002; not a product specification approval, technology selection or implementation authorisation.  
**Authority:** Concept Paper v1.1; Technical Development Manual v3.0; 024-A–G; 018-A sponsor decisions; Actify TSBBF v1.0 and AADDG v1.0.

## 1. Purpose and use

This document consolidates the requirements that technology and topology candidates must be assessed against. It is deliberately technology-neutral. It does not replace 024-A–G, their source catalogues, the domain model, the TSBBF workbook or the ADRs.

Use the source identifiers in the right-hand column as the traceability anchors. Where a source is still a draft or an open decision, that status carries through; representation here is not approval.

## 2. Architecture decision requirements

| ID | Requirement candidates must satisfy | Source anchors | Minimum verification evidence |
|---|---|---|---|
| TDR-01 | Enforce organisation-scoped identity, role and mandate checks at the trusted server boundary; distinguish seller and exporter capacities; support revocation and least privilege | 024-A; 018-A D-02 | Positive and negative cross-organisation/role tests; expired and revoked authority tests; auditable decision context |
| TDR-02 | Preserve the platform coordinator, seller/exporter, hub and payment boundaries; do not imply that the platform is seller/payee, that a hub has custody, or that the platform holds funds | 018-A D-01–D-03, D-07; 009; 024-A | Architecture/data-flow review; prohibited-action tests; explicit role and funds-flow mapping |
| TDR-03 | Support the governed end-to-end workflow and state transitions without collapsing evidence review, listing, enquiry, quotation, order, allocation, fulfilment, payment status and exception handling | 024-B WF-01–WF-18; BR-001–BR-034 | Workflow/state contract coverage; transition and denial tests; traceability to owning domain |
| TDR-04 | Preserve source-linked data, evidence class separately from acquisition/provenance, entity relationships, correction history and auditability | 024-C ENT-001–ENT-065; REL-001–REL-034; 36 invariants; 024-R F-01; Framework 008 §4.1 | Referential-integrity tests; provenance fixtures; correction/audit reconstruction; source-to-target review |
| TDR-05 | Protect quantity, reservation and commercial integrity under concurrent operations; reservation is not physical movement; accepted order lines retain the accepted quotation/commercial snapshot | 024-B; 024-C; 018-A D-04–D-06; 018-C | Parallel allocation tests; no-over-allocation assertions; immutable quote/order snapshot tests; explicit movement-state checks |
| TDR-06 | Expose versioned, validated and documented application contracts with consistent errors, idempotency, safe retries and replaceable provider adapters | 024-D (65 logical operations; 77 candidate events; API-OD-01–12) | Contract tests; schema/version compatibility tests; duplicate/replay/error tests; provider SDK isolation review |
| TDR-07 | Support six role-appropriate product surfaces and the specified journeys, responsive layouts, accessible interaction, language support, assisted use and low-bandwidth conditions | 024-E (36 screens; J-01–J-06; UI-OD-01–12) | Journey coverage; device/network-throttling tests; accessibility and localisation review; role-based screen access tests |
| TDR-08 | Apply security/privacy controls across identity, tenant isolation, private files, public projections, abuse, offline devices, sessions and sensitive audit/log data | 024-F (TH-01–TH-20; SEC-001–SEC-020; ST-01–ST-24) | Threat-to-control traceability; negative tests; secret/log redaction checks; scoped file access; independent security review |
| TDR-09 | Provide private-by-default evidence/file handling, scoped access, integrity, retention, quarantine/malware inspection and recoverability | 024-C; 024-F; 024-D; Technical Development Manual v3.0 | Upload/download authorisation tests; expiry/revocation; file hash and metadata checks; quarantine/scanning evidence; restore test |
| TDR-10 | Support constrained offline capture only where explicitly allowed; revalidate authority and business state on the server; handle duplicate, stale, conflicting, revoked and replayed submissions safely | 024-B; 024-D; 024-F F-07; 024-R F-07 | Allow-list review; duplicate/idempotency tests; revoked/stale authority tests; conflict review; shared-device privacy checks |
| TDR-11 | Support reliable background work and provider-event processing with authenticated provenance, bounded retries, idempotency, replay protection, visible terminal failures and operational ownership | 024-D; 024-F; AADDG Level 1; Technical Development Manual v3.0 | Signed/invalid/replayed event tests; retry/dead-letter tests; operator visibility; event reconciliation and ownership evidence |
| TDR-12 | Make builds, releases, environments, secrets, rollback, monitoring, incident response and operational handover reproducible and accountable | AADDG v1.0; 024-G; 024-H source-gap assessment | Clean-checkout build; environment/secret review; release/rollback rehearsal; redacted telemetry; named support/incident roles |
| TDR-13 | Demonstrate backup, restore, continuity and exit for relational data, files, metadata, configuration and audit lineage | AADDG v1.0; TSBBF v1.0; 024-H source-gap assessment | Restore to clean environment; count/hash/relation reconciliation; RTO/RPO assumptions and evidence; export/import rehearsal |
| TDR-14 | Preserve lawful, traceable payment-status recording without platform-held funds, escrow, payment initiation or payout absent separate approval and licensed-provider/legal arrangements | 018-A D-01, D-07; 024-B WF-11; 024-C ENT-065/REL-034; 024-D API-OD-09; 025 source-gap brief | Funds-flow review; provider identity/contract evidence before any integration; signed callback and reconciliation tests; no-funds-handling boundary tests |
| TDR-15 | Support the baseline Digital Product Passport and reporting needs while keeping public projections allow-listed, privacy-safe and revocable; defer blockchain and AI capabilities behind evidence gates | Concept Paper v1.1; Technical Development Manual v3.0; 024-R F-08/F-12 | Public-field allow-list and revocation tests; source-linked reporting; separate measurable-benefit, privacy and legal gate for later technology |
| TDR-16 | Be operable and economically sustainable for the pilot and intended growth, with current commercial terms, support, skills, data location, usage limits and total cost made visible | TSBBF v1.0; AADDG v1.0; Phase 0 work map | Candidate evidence packs; low/base/high 12/24/36-month TCO; quota/overage review; named operating capacity; independent challenge |
| TDR-17 | Remain portable and replaceable: export/import core records, relationships, private files, metadata, audit history and configuration without silent lineage loss | TSBBF v1.0; AADDG v1.0 | Reproducible export/import and reconciliation; documented replacement sequence; measured exit effort and cost |
| TDR-18 | Keep the architecture proportionate: prefer a small number of cohesive deployable units; introduce separate runtimes only for demonstrated workload, security, reliability or operational reasons | AADDG v1.0; Technical Development Manual v3.0; ADR-0002 | Runtime inventory; domain/module map; workload/failure rationale; comparative operating-cost and ownership evidence |

## 3. Cross-cutting candidate assessment rules

1. **Same baseline:** compare alternatives against the same TDR-01–TDR-18 requirements and workload assumptions.
2. **Component before bundle:** score frontend, application runtime, database, identity, authorisation, storage, workers, hosting, CI, backup, offline and portability independently; then assess bundle-level integration burden.
3. **Unknown stays unknown:** missing evidence is not a pass and must not be converted into a guessed TSBBF score.
4. **Critical-risk veto:** a weighted score cannot override unresolved legal, security, privacy, recovery, continuity or data-integrity blockers.
5. **Reversibility:** include export/import, provider exit, migration effort, data region and licence obligations.
6. **Operating reality:** include support, maintenance, upgrades, monitoring, backup, incident response and people—not only subscription prices.
7. **Stage-gated capability:** do not make connected measurement devices, blockchain anchoring, escrow/FX/payout, automated regulatory integrations, AI forecasting or automated advisories prerequisites for the baseline pilot unless an approved evidence-based change requires it.

## 4. Verification and acceptance relationship

- 024-A–G remain source specifications and catalogues; their presence in this baseline does not mean they are approved or implemented.
- QAT-001–QAT-036, ST-01–ST-24 and SPIKE-01–SPIKE-18 remain distinct source/test identifiers. Do not merge or renumber them.
- The existing synthetic spike plan is the execution protocol candidate. It requires a separate entry approval and independent review.
- A source-to-repository crosswalk is not test execution. A planned test is not a passed test. A local logic assertion is not browser acceptance.

## 5. Open source and authority dependencies

| Dependency | Current disposition | Effect on technology decisions |
|---|---|---|
| Developer Guide v0.1 (17 November 2026) | Canonical source not recovered in targeted Notion/Library search | Candidate A remains provisional and cannot be scored as a verified source-derived bundle |
| 024-H | Completed canonical page not located in targeted search | Operations requirements are distributed and assessed; programme-owner disposition remains required |
| 025 | Dedicated canonical page not located in targeted search | Commercial model remains unapproved; no fee engine, payer, tax treatment or payout design selected |
| Phase 0 workload and operator evidence | Not fully validated in this repository review | TCO, scale, support and staffing assumptions must remain explicitly uncertain |
| Decision authority and named reviewers | Not recorded in ADRs | No ADR closure or spike approval may be inferred |

## 6. Current decision status

TDR-01–TDR-18 are a comparison baseline, not a declaration that every requirement is complete or accepted. ADR-0001 and ADR-0002 remain OPEN; no candidate is scored or shortlisted; no framework, provider, database, hosting or runtime is selected.

Migration 001 remains **HOLD**. Migration 002 remains **NOT AUTHORISED**. EVI-21 remains **OPEN / Closure Accepted = NO**. No production backend, deployment, live integration, live trade, custody, platform-held funds or escrow is authorised.
