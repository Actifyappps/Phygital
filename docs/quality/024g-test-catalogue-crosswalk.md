# 024-G — test strategy, quality engineering and acceptance crosswalk

**Source:** [024-G — Test Strategy, Quality Engineering & Acceptance Evidence Specification v0.1](https://app.notion.com/p/41d6808bcd9e81c78dfdfa7919489c30)  
**Source date:** 19 November 2026  
**Status:** Draft for sponsor, product, technical, operational, security, privacy, legal and independent assurance review; not implementation, release or production authorization.  
**Review:** 20 November 2026

## 1. Purpose and verification chain

024-G defines how digital product requirements are verified before a capability, workflow, build, release or operational stage is described as accepted. Its governing chain is:

**Governing source/decision → requirement → design element → implementation item → test case → execution record → defect/retest → review → acceptance decision.**

It is a test strategy, not test execution evidence, technology selection, migration authorization, certification or release approval.

## 2. Scope separation from existing test artefacts

- **014** remains the technical/database harness: migration, PostgreSQL, schema/constraint, inventory, tenant, audit/event and technical E2E simulation.
- **021** remains the bounded Level 1 digital readiness rehearsal.
- **022** remains the synthetic test-data pack and operator workbook.
- **023** remains the local prototype and operator handover.
- **EVI-21** remains the controlled run and independent-review record.
- **024-G** coordinates product-wide quality engineering and acceptance across all domains; it does not replace the above.

A paper walkthrough is not a software test. A mocked-DOM logic harness is not a browser test. A browser test is not production acceptance. Evidence cannot be relabelled as proof of another verification layer.

## 3. Requirement traceability discipline

Each requirement needs stable ID, governing source/section, priority/risk, atomic expected behaviour, design/implementation reference, test case IDs, level, fixture/version, objective expected result, actual result only after execution, evidence reference/checksum, defect/retest links and reviewer/acceptance authority/date/scope.

Rules:
- A test case existing is not acceptance.
- A planned test is not an executed test.
- Untested, blocked, not applicable and deferred are distinct.
- Maintain forward and reverse traceability.
- Requirement changes require impact analysis across design, code, tests, fixtures, evidence and accepted releases.
- Unmapped implementation behaviour is a scope-control issue.

## 4. Test levels L0–L8

| Level | Purpose | Typical evidence |
|---|---|---|
| L0 Static/specification review | Ambiguity, contradictions, missing constraints | Review record and disposition |
| L1 Unit | Isolated calculations, validators, state guards | Automated results/build identity |
| L2 Component | Bounded UI/service/storage/domain component | Component output/screens/logs |
| L3 API/contract | Request/response, schema, authorization, idempotency, events | Contract report/schema version |
| L4 Integration | Connected components and provider simulators | Logs, traces, reconciliation |
| L5 System/E2E | Cross-surface workflows and state integrity | Run report, correlation IDs, records |
| L6 Non-functional | Security, privacy, accessibility, performance, resilience, recovery | Specialist reports and measurements |
| L7 User/operational acceptance | Intended users can perform the task | Observed task results and authorized acceptance |
| L8 Independent assurance | Independent re-performance/sample and evidence challenge | Independent report and findings |

These are verification levels, not software delivery stages or pilot maturity levels. Automation is appropriate for deterministic regression, contracts, access matrices, concurrency and build pipelines; manual methods remain necessary for usability, accessibility, field practicality and independent evidence inspection. Tool selection follows TSBBF/AADDG, not an assumption embedded in 024-G.

## 5. Environments and data

Distinct controlled environments are required as architecture is selected: local development, disposable automated test, integration/staging with simulators, bounded operational rehearsal and production (not currently authorized). Test environments must not use production as a convenience.

Synthetic data is the baseline. Every fixture must identify source/version, synthetic status, expected state and permitted use. Evidence class is not test outcome. Preserve runner/configuration, build identity, output, failures and raw evidence.

Stop if environment identity is uncertain, production credentials/endpoints appear, real data is present without approval, evidence is being overwritten or a critical boundary is bypassed.

## 6. Product domains and minimum coverage

Coverage domains include identity/organisation, role/authority, producer intake/consent, product/evidence, batch/inventory, listing/publication, buyer enquiry/matching, quotation/order, reservation/movement, payment status, shipment/documents, offline, recall/withdrawal, trust/abuse/appeals, privacy/records, accessibility/localization, reliability/recovery.

Each domain requires both positive and negative/boundary cases. In particular:
- cross-tenant and forged context;
- seller/exporter capacity separation and expired mandates;
- evidence class/provenance, expiry and scope;
- duplicate supply, unit/quantity mismatch, over-allocation and race;
- held/withdrawn listing and public-field leakage;
- one accepted quotation, immutable order terms and lineage;
- reservation distinct from physical movement;
- payment screenshot/redirect and forged/replayed webhook rejection;
- shipment authority and mock-dossier lineage;
- offline revocation/replay/conflict handling;
- recall trace-back/forward;
- privacy, member-data disclosure and safe exports;
- accessible critical warnings and error recovery;
- partial commit, duplicate event, backup/restore and fail-safe behaviour.

## 7. QAT catalogue and relation to 024-F

024-G defines QAT-001–QAT-028. Preserve these identifiers and link them to SEC/ST tests from 024-F where overlapping; do not collapse the product acceptance and security test catalogues into one ambiguous set.

| QAT range | Coverage |
|---|---|
| QAT-001–005 | Tenant isolation, authority, expiry, self-approval |
| QAT-006–007 | Evidence class, expiry, contradiction and scope |
| QAT-008–012 | Batch/listing backing, allocation, movement, eligibility |
| QAT-013 | Public/QR projection privacy |
| QAT-014–016 | Quote acceptance, order creation and immutable terms |
| QAT-017–019 | Payment proof, provider event and amount/party/reference mismatch |
| QAT-020–022 | Offline revocation, replay and conflict |
| QAT-023–024 | Recall/withdrawal traceability and re-publication control |
| QAT-025–028 | Member privacy, privileged access, independent appeal and malicious files |

Each case must be expanded before execution with fixture, setup, action, expected result, actual result and evidence reference.

## 8. Defect severity and closure

- **Critical:** unauthorized funds/stock effect, cross-tenant or sensitive-data exposure, false payment/dispatch/verification, material audit bypass, safety/legal boundary bypass. Stop affected work; no routine waiver.
- **High:** P0 failure, workflow corruption, authority bypass, data loss, over-allocation, broken lineage or unsafe recovery. Blocks acceptance.
- **Medium:** material bounded defect with safe workaround and no mandatory-control bypass; requires documented disposition.
- **Low:** cosmetic/low impact; track and disclose where relevant.

Defect record must link requirement/test, build/environment/fixture, reproducible steps, actual/expected result, impact/severity, evidence, containment, root cause, remediation commit/build, reviewer, retest/regression and residual risk. Preserve original failed evidence. Critical/High require independent review or documented equivalent assurance.

## 9. Acceptance gates G0–G4

- **G0 Specification readiness:** stable/testable requirements, material conflicts resolved or blocked, traceability, synthetic fixtures, stop conditions, test/review roles and evidence store. Passing G0 means test programme is specified, not software works.
- **G1 Component/contract readiness:** relevant unit/component/API results, authorization/validation, build/config identity and no unresolved Critical/High issue in scope.
- **G2 Integrated workflow readiness:** E2E positive/negative/exception/recovery, data/event lineage, concurrency/idempotency/replay, security/privacy and accessibility/usability evidence.
- **G3 Operational acceptance readiness:** observed role-based operations, SOPs, training/support, incident/continuity, partner and field readiness, cost/ownership and independent review.
- **G4 Production/pilot authorization:** separate sponsor decision, legal/regulatory/contractual approvals, security/privacy and operational gates, accepted residual risk, bounded scope and stop-loss. Passing earlier gates does not authorize live operations.

Every gate record must state scope, build, environment, requirements, coverage, limitations, defects, evidence, reviewers and decision authority.

## 10. Sequencing and current status

Recommended order: establish traceability; reconcile 024-A–F and 024-R; approve synthetic fixtures/environment/evidence retention; establish unit/component/contract foundations; add authorization, tenant, evidence, batch and audit tests; add marketplace transaction flows; add offline/provider/concurrency/privacy/accessibility/resilience; coordinate 014 migration tests only after separate authorization; execute 021–023/EVI-21 with exact build identity; obtain independent review before expansion.

Current status: 024-G is a draft strategy. It does not prove test execution or authorize migration. EVI-21 remains OPEN; Closure Accepted = NO. Migration 001 remains HOLD; Migration 002 NOT AUTHORISED; live operations remain prohibited pending separate gates.

## 11. Detailed product acceptance catalogue

The complete source scenarios and minimum expected results for QAT-001–QAT-036 are preserved in `docs/quality/024g-product-acceptance-catalogue.md`. The crosswalk below remains the strategy, coverage and gate summary. The 36 cases are requirements only; no execution or acceptance is claimed.

## 12. Repository acceptance

- [x] L0–L8 verification levels and product test domains represented.
- [x] QAT-001–036, G0–G4 and defect severity/closure rules mapped.
- [x] Scope separation from 014 and 021–023/EVI-21 preserved.
- [ ] No test execution, independent acceptance, release or pilot authorization is claimed.
