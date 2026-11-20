# 024-G product acceptance test catalogue

**Source:** 024-G — Test Strategy, Quality Engineering & Acceptance Evidence Specification v0.1, dated 19 November 2026.
**Status:** Draft test requirements; not executed test results, product acceptance, release or production authorization.

## 1. Source catalogue

All 36 product acceptance tests (QAT-001–QAT-036) from 024-G §9 are preserved below with their scenario and minimum expected result.

| Test ID | Scenario | Minimum expected result |
|---|---|---|
| QAT-001 | User A requests Organisation B record by direct identifier | Denied without protected-data disclosure; attributable security event |
| QAT-002 | User changes organisation context in request payload | Server validates authoritative membership and scope; unauthorized action denied |
| QAT-003 | Seller-only identity attempts exporter-only action | Denied; separate exporter mandate/qualification required |
| QAT-004 | Expired or revoked authority attempts action | Denied at execution time |
| QAT-005 | User attempts to approve own authority or evidence | Prevented or routed to authorized independent reviewer |
| QAT-006 | E1, E2, E3 and E4 evidence are displayed | Canonical Framework 008 meanings are used; acquisition method remains separate |
| QAT-007 | Evidence is expired, contradictory or outside its stated scope | Relevant gate holds or requests review; no positive status inferred |
| QAT-008 | Batch has overlapping listings or allocations | Available quantity is derived consistently; no duplicate backing |
| QAT-009 | Concurrent allocations exceed eligible quantity | Atomic control prevents over-allocation; balances remain reconcilable |
| QAT-010 | Reservation is created without physical movement | UI, API and audit records do not claim dispatch, custody or movement |
| QAT-011 | A movement is recorded with invalid unit or negative quantity | Rejected; no ledger corruption |
| QAT-012 | Listing is based on held, withdrawn or ineligible batch | Publication blocked or withdrawn according to authority and workflow |
| QAT-013 | Public listing/QR projection is queried for private fields | Only allow-listed public fields returned |
| QAT-014 | Two quotations are accepted for one order where rule prohibits it | Second acceptance rejected; first accepted commercial snapshot preserved |
| QAT-015 | Order is created from an unaccepted or expired quotation | Rejected; no orphan or unauthorized order |
| QAT-016 | Order item is changed after acceptance | Change requires controlled amendment; original accepted terms remain auditable |
| QAT-017 | Buyer uploads payment screenshot or browser redirect | Not accepted as authoritative payment confirmation |
| QAT-018 | Duplicate or forged provider event is received | Idempotent/replay controls prevent false or duplicate state change |
| QAT-019 | Payment amount, currency, payer, payee or reference mismatch occurs | Exception/pending state; no inferred settlement |
| QAT-020 | Offline action syncs after user/device revocation | Rejected or quarantined; no authoritative state change |
| QAT-021 | Same offline command is replayed after timeout | No duplicate effect; deterministic reconciliation outcome |
| QAT-022 | Offline data conflicts with current server state | Conflict surfaced; no unsafe last-write-wins |
| QAT-023 | Recall affects split/merged batches, listings and orders | Complete trace-back/trace-forward set is produced and auditable |
| QAT-024 | Withdrawn batch is republished or reallocated without release | Denied |
| QAT-025 | User requests member data beyond delegated disclosure scope | Denied; minimum disclosure and audit record |
| QAT-026 | Privileged administrator accesses restricted record | Purpose-bound, attributable, logged and reviewable |
| QAT-027 | User appeals a restriction imposed by same decision-maker | Independent appeal route available |
| QAT-028 | Malformed or prohibited file is uploaded | Rejected/quarantined; never executed or publicly served |
| QAT-029 | Critical workflow is completed using keyboard and assistive technology | No critical action inaccessible; focus and status remain understandable |
| QAT-030 | User operates in supported low-connectivity/offline condition | Pending/synced/conflict states are explicit; no false completion |
| QAT-031 | Provider or dependent service times out | Safe retry/backoff and pending/exception state; no duplicate side effect |
| QAT-032 | Backup is restored after simulated loss/corruption | Critical records, lineage and audit integrity verified before reopening |
| QAT-033 | Application logs are inspected | No passwords, tokens, unnecessary personal data or sensitive file contents |
| QAT-034 | Test/staging environment attempts to access production secrets/data | Boundary denies access |
| QAT-035 | Product delivery stage and pilot maturity level are presented together | Separate axes; neither is inferred from the other |
| QAT-036 | A test fails or is blocked at a prerequisite layer | Dependent tests do not receive a false pass; gate status reflects dependency |

## 2. Relationship to security tests

024-F's ST-01–ST-24 remain the security-specific minimum test catalogue. QAT-001–QAT-036 are product-level cross-domain scenarios and deliberately overlap selected security controls where end-to-end behaviour must be checked. Maintain explicit cross-references; do not duplicate or renumber ST cases. A QAT pass does not close an ST case unless the exact security test, build, scope and evidence requirements were met and linked.

## 3. Test levels and acceptance gates

024-G defines verification levels L0–L8 and acceptance gates G0–G4. These are separate concepts: verification levels classify test methods/evidence; G0–G4 govern readiness and release decisions. Neither is the physical pilot maturity level. A test specification or passing lower gate does not authorize production or live trade.

## 4. Execution record requirements

For each executed QAT case retain requirement/source links, test case ID, test level, fixture/version and synthetic status, build/configuration identity, environment, runner or procedure, actual result, logs/output/checksum, defect/retest link, reviewer and disposition. Planned, blocked, not run, failed and passed are distinct statuses.

**Current status:** this file records test specifications only. No QAT case is claimed executed or accepted. EVI-21 remains OPEN; DEF-L1-001 and DEF-L1-002 remain OPEN; Migration 001 HOLD; Migration 002 NOT AUTHORISED.