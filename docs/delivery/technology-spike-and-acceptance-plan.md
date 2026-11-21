# Synthetic-data technology spike and acceptance plan

**Status:** Prepared test plan only; not an execution record or environment authorisation.  
**Governing:** TSBBF v1.0, AADDG v1.0, ADR-0001/0002, Concept Paper v1.1, Technical Development Manual v3.0, 024-A–G and sponsor decisions 018-A.

## 1. Purpose and prerequisites

Define a small, reversible, evidence-producing spike to compare shortlisted components before selecting a stack/topology. It tests critical architecture risks; it does not build the marketplace.

Start only after:
1. EVI-25 is closed by recovering and reconciling the complete Developer Guide v0.1, or by an authorized formal unavailability/supersession disposition that records the approved alternative source baseline and resolves precedence;
2. candidates have sufficient TSBBF evidence to justify testing;
3. an authorised owner approves scope, budget, environment and reviewers;
4. synthetic fixtures and security/test plans are approved.

## 2. Explicit exclusions

No real producer/buyer/cooperative/hub/bank/payment/carrier/lab/government connections; no real personal/KYC/trade/financial data; no Migration 001 or 002 execution; no production deployment; no funds, payment initiation, escrow, custody, stock release, dispatch or shipment; no connected devices, blockchain, customs automation, AI forecast or automated advisories. No EVI-21 closure claim. Synthetic generated files only.

## 3. Small vertical slice

1. Synthetic user joins synthetic organisation with scoped role/mandate.
2. Create draft supply listing and synthetic batch.
3. Reviewer records synthetic evidence decision.
4. Synthetic buyer submits enquiry and receives versioned quotation.
5. Accept one quote; order snapshot preserves accepted lines, price, quantity and terms.
6. Attempt reservation under concurrency; reservation is not movement.
7. Upload synthetic private document; test quarantine/scanning and authorised access.
8. Publish allow-listed synthetic QR projection and revoke token.
9. Simulate signed provider callback; replay/duplicate safe; records status only.
10. Queue offline capture and synchronise with provenance and server-side revalidation.
11. Retry background job; terminal failure visible to operator.
12. Reconstruct workflow from audit/log correlation without leaking secrets or excess data.

This comparison harness does not imply all product workflows are complete.

## 4. Fair comparison controls

Score components first. Compare equivalent scope, synthetic data, load assumptions and test conditions. Record versions, configuration, limits, cost and operator time. Keep provider SDKs outside domain contracts. Include extra worker/queue/service burden in cost and operations. Mark unknown evidence explicitly. Convenience cannot override legal, privacy, security or sponsor constraints.

## 5. Acceptance matrix

| ID | Test | Acceptance condition | Evidence |
|---|---|---|---|
| SPIKE-01 | Reproducible build | Clean checkout installs/builds/tests from committed source; no undocumented dashboard mutation | Commit SHA, lockfile, commands, build output |
| SPIKE-02 | Domain/API boundary | Domain rules independent of provider SDKs; validation and stable errors demonstrated | Contract tests and dependency review |
| SPIKE-03 | Identity/session | Synthetic sign-in/out; expiry and revocation work as designed | Session/revocation cases |
| SPIKE-04 | Authority/tenant isolation | Cross-organisation access and unauthorised direct API actions denied server-side | Negative test matrix |
| SPIKE-05 | Commercial snapshot | Accepted quote lines/price/currency/quantity/terms reproducible after later edits | Before/after fixtures and assertions |
| SPIKE-06 | Reservation concurrency | Concurrent reservations cannot exceed eligible quantity; no movement implied | Parallel test and invariant assertion |
| SPIKE-07 | Private evidence files | Unauthorised reads denied; authorised scoped access expires; unsafe file rejected/quarantined | Permission, link expiry and file tests |
| SPIKE-08 | QR/public projection | Unguessable token; allow-listed fields only; revocation works | Token, field allow-list and revocation tests |
| SPIKE-09 | Provider callback | Invalid signature/replay rejected; duplicate idempotent; no funds transfer initiated | Callback fixtures and event ledger |
| SPIKE-10 | Offline sync | Duplicate idempotent; stale/revoked authority and conflicts fail safely or route to review | Queue fixtures, sync logs and conflict tests |
| SPIKE-11 | Worker resilience | Bounded retry/backoff; duplicate safe; terminal failure visible | Retry/dead-letter tests |
| SPIKE-12 | Observability/privacy | Correlation IDs trace flow; secrets/unnecessary personal data absent | Redacted logs and automated checks |
| SPIKE-13 | Backup/restore | Synthetic DB and objects restore to clean environment with integrity verified | Restore run, hashes/counts |
| SPIKE-14 | Deploy/rollback | Only authorised non-production deployment; previous build restorable; secrets environment-scoped | Deploy record and rollback demo |
| SPIKE-15 | Low-bandwidth | Graceful degradation; pending/rejected sync state visible | Throttled test record |
| SPIKE-16 | Cost/limits | Quotas, bandwidth, storage, worker limits and overages recorded | Cost sheet and assumptions |
| SPIKE-17 | Portability/exit | Core records and file metadata export/restore without silent lineage loss | Export package and reconciliation |
| SPIKE-18 | Operator handover | Another reviewer reproduces setup, tests, logs, restore and teardown | Handover checklist and reviewer sign-off |

Each test is PASS, FAIL, BLOCKED or NOT RUN, with evidence. A spike cannot pass if critical security, privacy, recovery, tenant-isolation or data-integrity criteria remain untested.

## 6. Evidence record

Record spike ID/date/operator/reviewer; approved scope/environment/data classification; candidate versions; commit SHA and commands; test preconditions/expected/actual; logs/results/screenshots redacted as needed; defects and retests; resource use/quotas/cost assumptions; deviations and untested cases; independent review and acceptance authority.

A test plan is not a test run. A local assertion is not browser acceptance. A demo is not independent review. Deployment is not production authorisation.

## 7. Decision outputs

Prepare updated component scorecards, architecture trade-off report, observed cost model, security/privacy and portability review, ADR-0001/0002 proposals and recommendation to proceed/repeat/defer/reject. Only authorised programme/product governance decides adoption. Reviewers do not acquire procurement or production authority.

## 8. Current gates

Developer Guide v0.1 canonical source not recovered; ADR-0001/0002 and ADR-0003–0008 OPEN; Migration 001 HOLD; Migration 002 NOT AUTHORISED; EVI-21 OPEN / Closure Accepted NO. This plan authorises no production backend, deployment, live provider integration or live trade.


## EVI-26 authorization readiness update — 21 November 2026

The EVI-26 authorization-readiness brief is maintained at `evi-26-wp05-synthetic-spike-authorization-readiness-001.md`. WP-05 remains NOT READY — NOT AUTHORIZED. No spike has run. Register-change approval and a general commission to implement evidence work do not substitute for the explicit WP-05 decision required by this plan.
