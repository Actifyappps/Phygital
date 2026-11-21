# EVI-26 — WP-05 synthetic technology spike authorization readiness and decision brief 001

**Review date:** 21 November 2026  
**Evidence item:** EVI-26 — Authorize a bounded synthetic technology-candidate spike  
**Readiness status:** NOT READY — NOT AUTHORIZED  
**Work status:** IN PROGRESS — authorization prerequisites being reconciled  
**Execution status:** NO SPIKE HAS BEEN RUN

## 1. Executive disposition

The existing WP-05 spike plan is a test specification, and the WP-05 readiness assessment remains **NOT READY — NOT AUTHORIZED**.

Approval to create and implement the five Evidence Register requirements is not interpreted as authorization to execute WP-05. EVI-26 requires a separate explicit decision record naming accountable and independent roles, exact candidates and versions, environment and budget, security/privacy controls, test cases and acceptance, stop conditions, deliverables and exclusions.

**Recommendation:** Do not authorize execution yet. Continue only permitted pre-authorization evidence and preparation work.

## 2. Proposed bounded scope

The existing plan describes a small, reversible synthetic vertical slice to test critical architecture risks, not build the marketplace. Potential test domains include reproducible build; domain/API boundary; synthetic identity/session and revocation; tenant isolation; quotation/order snapshots; concurrent reservation invariants; private evidence-file access; public QR projection/revocation; signed callback verification and idempotency with no funds transfer; offline sync; job/outbox retry; redacted observability; synthetic database/object restore; non-production deployment/rollback only if separately approved; low-bandwidth behaviour; cost/limits; portability/exit; and independent handover.

This is a test menu, not an approved candidate shortlist or execution scope. Final authorization must select only tests justified by candidate evidence and approved risk questions.

## 3. Current readiness gates

| Gate | Required condition | Current position |
|---|---|---|
| G-01 Source authority | EVI-25 closed by source recovery/reconciliation or authorized formal unavailability/supersession disposition with approved alternative source baseline | BLOCKED — EVI-25 IN PROGRESS |
| G-02 Comparable requirements | Exact TDR/component requirements frozen for comparison | PARTIAL |
| G-03 Candidate readiness | At least two credible candidates per tested component with technical, security, legal, commercial and portability evidence | BLOCKED — no shortlist; key evidence incomplete |
| G-04 Workload | Pilot users, organisations, concurrency, transactions, file sizes, connectivity, retention and operating assumptions validated/bounded | BLOCKED — quantities UNKNOWN |
| G-05 Legal/privacy | Data map, purpose, transfer, DPA, region, retention and provider processing reviewed | BLOCKED |
| G-06 Security/test design | Synthetic fixtures, threat model, authorization matrix, classification and acceptance approved | PARTIAL |
| G-07 Environment/budget | Isolated synthetic environment, region, budget, access controls, secrets, cleanup and rollback approved | BLOCKED |
| G-08 Ownership | Named implementation/operations owners and security/independent reviewers confirmed | BLOCKED |
| G-09 Authorization | Authorized owner explicitly approves exact candidates, scope, spend, environment, dates and reviewers | BLOCKED |
| G-10 Acceptance/evidence | Exact versions, commands, commit, raw outputs, defects/retests and review plan confirmed | PARTIAL |

**Overall:** NOT READY — NOT AUTHORIZED.

## 4. Permitted work before authorization

- Continue EVI-25 source recovery and authority disposition.
- Obtain current provider terms, DPAs, subprocessors, regions, quotas, limits and quotes from public/authorized sources.
- Complete Phase 0 workload, connectivity and operational evidence under separately approved instruments.
- Complete ECR-01–ECR-14 evidence requests.
- Refine synthetic fixtures and expected outcomes without connecting to real providers.
- Review spike tests, security controls, data minimisation, secrets, cleanup and rollback.
- Prepare the final decision brief.

## 5. Prohibited until gates pass and authorization is recorded

No production accounts/resources; live database/identity/storage/queue/worker/domain; migrations; real participant/KYC/financial/trade data; real payment/carrier/lab/government/messaging integrations; funds, escrow, custody, stock release, dispatch or shipment; or claims of approved selection/independent acceptance.

## 6. Authorization decision record — required fields

No values or appointments are invented.

| Field | Current entry |
|---|---|
| Decision ID/date | Not assigned |
| Authorized decision owner | Not appointed/recorded |
| Exact candidates and versions | Not selected; candidate readiness gate blocked |
| Comparison question and component scope | Pending G-02/G-03 |
| Environment and region | Not selected/approved |
| Budget ceiling and funding source | Not approved |
| Synthetic fixture ID/hash | Not approved |
| Data classification | Synthetic only; exact fixture approval outstanding |
| Security/privacy controls | 024-F baseline; spike-specific review outstanding |
| Implementation owner | Not appointed |
| Operations owner | Not appointed |
| Security/privacy reviewer | Not appointed |
| Independent reviewer/witness | Not appointed |
| Test cases/acceptance | Existing plan is draft baseline; final scope pending |
| Stop conditions | To be approved |
| Deliverables/evidence location | To be approved |
| Cleanup/rollback | To be approved and rehearsed |
| Explicit exclusions | No production, real data, provider procurement, migrations, live integrations, funds, custody, live inventory, dispatch or shipment |
| Decision outcome | PENDING — NOT AUTHORIZED |

## 7. Authorization conditions

A future approval must identify exact candidates/versions; limit use to synthetic/non-personal/non-commercial data; state isolated environment, region, budget ceiling and expiry; name implementation/operations owners and security/independent reviewers; list exact tests, acceptance, stop conditions, outputs and cleanup; define access/secrets and evidence retention; explicitly exclude production, real data, procurement and live operations; and record that approval applies only to the bounded spike.

## 8. Dependencies

- EVI-25: complete source recovery or authorized formal disposition.
- ECR-02/03/06/07: workload, site/connectivity, operating capacity and TCO evidence.
- ECR-04/05/11: data/privacy, provider and security evidence.
- EVI-29/ECR-08: recovery objectives, retention and restore readiness.
- EVI-27/ADR-0002: topology evidence and authorized decision before final technology baseline selection.
- Candidate evidence packs and TSBBF scorecards: no candidate may be scored or shortlisted without sufficient evidence.

**Current disposition:** EVI-26 IN PROGRESS as an authorization-readiness task; WP-05 NOT READY — NOT AUTHORIZED; no spike executed.

[Notion decision brief](https://app.notion.com/p/41f6808bcd9e81f9adebf57aeac5472d).
