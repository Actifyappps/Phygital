# Test execution and evidence operating model

## Test levels
Requirements review; static/source checks; unit; component; database constraint; integration; contract; end-to-end; security; privacy; accessibility; performance; resilience/offline; migration; backup/restore; operational rehearsal; independent review.

## Each test case must state
Stable ID; source requirement; risk/priority; actor and authority; environment/build; preconditions; synthetic fixture; exact steps; expected state and denied path; observed result; logs/screenshots/output; defect references; tester; reviewer; timestamp; retest and regression links.

## Evidence grades and integrity
Preserve raw output and identify generated summaries. Record commit SHA, build artefact hash, runtime/environment, data-fixture version, test tool/version and exact command. Do not edit raw logs. A rerun creates a new execution record. Redact secrets and personal data before storage.

## Independent review
Reviewer checks requirement coverage, procedure fidelity, raw output, reproducibility, defects, false-positive paths and whether the evidence supports the stated conclusion. Implementers do not self-accept their own material remediation where independence is required.

## Level 1 boundary
The v0.4 logic harness is not a browser test. The 16-step operator rehearsal, 12 browser negative tests and independent review remain outstanding; EVI-21 stays OPEN and Closure Accepted NO until the canonical closure criteria are met.


## 024-G test governance and acceptance gates

024-G is the product-wide quality and acceptance authority. It coordinates, but does not replace:
- 014 technical/database harness and technical E2E simulation;
- 021 Level 1 rehearsal plan;
- 022 synthetic fixture and operator workbook;
- 023 local prototype and handover;
- EVI-21 controlled rehearsal and independent review;
- 024-F security-specific SEC/ST controls and tests.

### Traceability chain

Maintain explicit forward and reverse links:

**Governing source/decision → requirement ID → authority/actor → design/implementation reference → test case → test level → fixture/version → execution record → defect/retest → reviewer → acceptance decision.**

Minimum record fields: source/version, requirement ID, priority/risk, expected behaviour, design/API/data/screen/security references, test ID and level, fixture, environment/build/schema identity, expected and actual result, raw evidence/checksum, defect/retest links, operator/reviewer, timestamps and acceptance authority.

No requirement is accepted because a test exists. No test is passed because it is listed in a plan. Untested, blocked, not run, not applicable and deferred are distinct.

### Verification levels

| Level | Method | Evidence / exit |
|---|---|---|
| L0 | Static/specification review | Conflicts and ambiguity resolved or explicitly blocked |
| L1 | Unit | Deterministic domain/calculation assertions |
| L2 | Component | Bounded UI/service/storage behaviour and error states |
| L3 | API/contract | Schemas, authorization, idempotency and compatibility |
| L4 | Integration | Connected components/provider simulators, retries and reconciliation |
| L5 | System/E2E | Cross-surface workflow, exceptions and recovery |
| L6 | Non-functional | Security, privacy, accessibility, usability, performance, resilience and recovery |
| L7 | User/operational acceptance | Observed role-based tasks and authorised operational acceptance |
| L8 | Independent assurance | Re-performance/sampling, evidence challenge and independent disposition |

These are test levels, not product delivery stages or pilot maturity levels.

### Test environment and evidence

Maintain distinct local, automated-test, integration/staging, operational-rehearsal and production environments. Production is not an available test environment under the current project authority. Stop if environment identity is uncertain, production secrets/endpoints are present, real data is unapproved, a real notification/payment/booking/shipment could occur, build/fixture identity differs or evidence cannot be retained.

Current tests use versioned TEST/SYNTHETIC fixtures only. Fixtures should cover separate tenants, distinct role/capacity/mandate states, E1–E4 evidence, compatible/incompatible batches, overlapping listings, concurrent allocations, quote versions, reservations versus movements, duplicate/reordered provider events, offline revoked/replayed actions and recall across split/merged batches.

Evidence class is not test outcome. E1–E4 describe the underlying claim; PASS/FAIL/BLOCKED/NOT RUN describe test execution. A screenshot does not prove physical existence or independent verification.

### Defect management

- **Critical:** unauthorized funds/stock effect, cross-tenant or sensitive-data exposure, false payment/dispatch/verification, material audit bypass, safety or legal-boundary bypass. Stop affected testing/release; no routine waiver.
- **High:** P0 failure, material workflow corruption, authority bypass, data loss, over-allocation, broken lineage or unsafe recovery. Blocks relevant acceptance.
- **Medium:** bounded material defect without mandatory-control bypass; disposition requires impact, owner and approval.
- **Low:** cosmetic/low-impact issue; track and schedule.

Retest the original failure and relevant regression cases. Preserve failed evidence; link successful retest rather than overwrite. Critical/High findings require independent review or a documented equivalent assurance arrangement. A waiver remains visible, scoped, time-bound and authorized; it cannot waive prohibited actions or mandatory gates.

### Acceptance gates

| Gate | Minimum evidence | What it does not mean |
|---|---|---|
| G0 Specification readiness | Testable requirements, conflicts resolved/blocked, source-to-test traceability, approved synthetic fixtures/stop rules, named test/review roles and evidence repository | Does not prove software works |
| G1 Component/contract readiness | Relevant unit/component/API results, authorization/validation tests, build/config identity, no unresolved Critical/High defect in accepted scope | Does not prove integrated workflow |
| G2 Integrated workflow readiness | E2E positive/negative/exception/recovery results, data/event lineage, concurrency/idempotency/replay, relevant security/privacy/accessibility review | Does not prove operational acceptance |
| G3 Operational acceptance readiness | Representative role review, SOPs, support ownership, incident/exception handling, independent review of high-risk evidence and authorized operational acceptance | Does not authorize production/live trade |
| G4 Production or pilot authorization | Separate external commercial, legal, regulatory, exporter, facility, commodity, destination, privacy, security, payment, logistics, insurance and operational evidence plus explicit authorized decision | Cannot be granted by software tests |

### Status vocabulary

Specified ≠ scripted ≠ built ≠ run ≠ passed ≠ reviewed ≠ accepted ≠ deployed ≠ production-ready. Record each state separately. Product delivery stage, pilot maturity level and test/acceptance state are independent axes.

